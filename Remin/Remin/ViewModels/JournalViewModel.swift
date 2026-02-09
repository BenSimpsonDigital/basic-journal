//
//  JournalViewModel.swift
//  Remin
//
//  One Thing - Daily Voice Journal
//  Lightweight state management for UI prototype
//

import Foundation
import SwiftUI
import Combine
import AVFoundation

enum SearchChip: Hashable {
    case people
    case dates
    case missingDays
}

enum DatePreset: Equatable {
    case thisWeek
    case thisMonth
    case last3Months
    case custom(start: Date, end: Date)
}

struct TimelineDay: Identifiable, Equatable {
    let id: String // yyyy-MM-dd
    let dayStart: Date
    let entry: Entry

    var dateHeader: String {
        let calendar = Calendar.current
        if calendar.isDateInToday(dayStart) {
            return "Today"
        }
        if calendar.isDateInYesterday(dayStart) {
            return "Yesterday"
        }
        return Self.dayHeaderFormatter.string(from: dayStart)
    }

    private static let dayHeaderFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.setLocalizedDateFormatFromTemplate("EEE d MMM")
        return formatter
    }()
}

struct MissingDayGap: Identifiable, Equatable {
    let id: String
    let newerDay: TimelineDay
    let olderDay: TimelineDay
    let missingCount: Int
    let firstMissingDay: Date
    let lastMissingDay: Date

    var label: String {
        "\(missingCount) day\(missingCount == 1 ? "" : "s") missing"
    }
}

/// Flow state for the journal entry process
enum JournalFlowState: Equatable {
    case startingPrompt  // Greeting + suggested prompt (once per day)
    case recordPrompt    // Ready to record
    case recording       // Recording in progress
    case preview         // Recording complete, awaiting explicit save
}

/// Main view model managing all app state
/// - Note: In production, this would integrate with persistence, audio services, etc.
@MainActor
class JournalViewModel: ObservableObject {
    private enum DefaultsKey {
        static let hasCompletedOnboarding = "hasCompletedOnboarding"
        static let userName = "userName"
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let profileImageData = "profileImageData"
        static let hasSeenStartingPromptToday = "hasSeenStartingPromptToday"
        static let lastStartingPromptDate = "lastStartingPromptDate"
        static let dailyPromptDate = "dailyPromptDate"
        static let dailyPromptText = "dailyPromptText"
        static let lastPromptIndex = "lastPromptIndex"
        static let lastAppOpenDate = "lastAppOpenDate"
    }

    // MARK: - Published Properties

    /// All journal entries (mock data)
    @Published var entries: [Entry] {
        didSet {
            rebuildTimelineDerivedData()
        }
    }

    /// Search and filter chips used in Journal timeline.
    @Published var activeSearchChips: Set<SearchChip> = []

    /// Applied date range filter for Journal timeline.
    @Published var activeDateRange: ClosedRange<Date>?

    /// Selected date preset backing activeDateRange.
    @Published var selectedDatePreset: DatePreset?

    /// Trigger for switching from Journal to Today tab.
    @Published var shouldNavigateToTodayFromJournal: Bool = false

    /// Forces Today to show the recording workflow even when today's entry exists (used for re-record/edit).
    @Published var forceEntryComposerVisible: Bool = false

    /// One timeline item per local day.
    @Published private(set) var timelineDays: [TimelineDay] = []

    /// O(1) lookup to find day position in timeline.
    @Published private(set) var timelineDayIndex: [String: Int] = [:]

    /// O(1) lookup from yyyy-MM to first available day key (earliest day in month with an entry).
    @Published private(set) var monthToFirstAvailableDayKey: [String: String] = [:]

    /// Whether user has completed onboarding
    @Published var hasCompletedOnboarding: Bool = false {
        didSet { UserDefaults.standard.set(hasCompletedOnboarding, forKey: DefaultsKey.hasCompletedOnboarding) }
    }

    /// User's first name (set during onboarding, editable in profile)
    @Published var firstName: String = "" {
        didSet { UserDefaults.standard.set(firstName, forKey: DefaultsKey.firstName) }
    }

    /// User's last name (editable in profile)
    @Published var lastName: String = "" {
        didSet { UserDefaults.standard.set(lastName, forKey: DefaultsKey.lastName) }
    }

    /// Optional profile image bytes
    @Published var profileImageData: Data? = nil {
        didSet {
            if let profileImageData {
                UserDefaults.standard.set(profileImageData, forKey: DefaultsKey.profileImageData)
            } else {
                UserDefaults.standard.removeObject(forKey: DefaultsKey.profileImageData)
            }
        }
    }

    /// Current flow state for Today screen
    @Published var flowState: JournalFlowState = .recordPrompt {
        didSet {
            if flowState != .recording {
                recordingInputLevel = 0
            }
        }
    }

    /// Elapsed recording time in seconds (for timer display)
    @Published var recordingSeconds: Int = 0

    /// Smoothed normalized microphone level for recording animations (0...1)
    @Published var recordingInputLevel: CGFloat = 0

    /// Target date for the new entry (for creating past entries from calendar)
    @Published var pendingEntryDate: Date = Date()

    /// Draft preview entry for the active recording, not yet persisted in entries
    @Published var previewEntryDraft: Entry?

    /// Current daily prompt text (cached per calendar day)
    @Published var dailyPrompt: String = "What stood out about today?"

    /// Search query text
    @Published var searchQuery: String = ""

    /// Whether user has seen starting prompt today
    @Published var hasSeenStartingPromptToday: Bool = false

    /// Trigger for timeline navigation (when user dismisses starting prompt)
    @Published var shouldNavigateToTimeline: Bool = false

    /// Settings: Daily reminder enabled
    @Published var reminderEnabled: Bool = true

    /// Settings: Reminder time (display only)
    @Published var reminderTime: Date = {
        var components = DateComponents()
        components.hour = 20
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }()

    // MARK: - Services

    let audioService = AudioRecordingService()
    let transcriptionService = TranscriptionService()

    // MARK: - Private Properties

    private var recordingTimer: Timer?
    private var pendingEntryID: UUID?
    private var previewEntryID: UUID?
    private var cancellables = Set<AnyCancellable>()
    private var serviceCancellables = Set<AnyCancellable>()

    /// Last date user saw the starting prompt (for daily reset)
    private var lastPromptDate: Date {
        get { UserDefaults.standard.object(forKey: DefaultsKey.lastStartingPromptDate) as? Date ?? Date.distantPast }
        set { UserDefaults.standard.set(newValue, forKey: DefaultsKey.lastStartingPromptDate) }
    }

    private let prompts: [String] = [
        "What stood out about today?",
        "Did anything surprise you today?",
        "What was the best part of your day?",
        "Did something small make you smile?",
        "What felt memorable today?",
        "Did anything go better than expected?",
        "What moment stuck with you today?",
        "Did you enjoy anything unexpectedly?",
        "What was today’s highlight?",
        "Did anything feel different today?"
    ]

    // MARK: - Initialization

    init() {
        // Runtime starts with showcase entries for Journal design iteration.
        self.entries = []
        seedSampleEntriesIfNeeded()
        rebuildTimelineDerivedData()

        // Load persisted onboarding state
        self.hasCompletedOnboarding = UserDefaults.standard.bool(forKey: DefaultsKey.hasCompletedOnboarding)

        // Load persisted profile fields
        self.firstName = UserDefaults.standard.string(forKey: DefaultsKey.firstName) ?? ""
        self.lastName = UserDefaults.standard.string(forKey: DefaultsKey.lastName) ?? ""
        self.profileImageData = UserDefaults.standard.data(forKey: DefaultsKey.profileImageData)
        migrateLegacyUserNameIfNeeded()

        // Load persisted starting prompt state
        self.hasSeenStartingPromptToday = UserDefaults.standard.bool(forKey: DefaultsKey.hasSeenStartingPromptToday)
        checkAndResetDailyPrompt()

        // Load or generate cached daily prompt
        loadDailyPrompt()
        bindAudioInputLevel()

        registerAppOpenAndPrepareDailyWorkflowIfNeeded()

        if todayEntry == nil {
            flowState = shouldShowStartingPrompt() ? .startingPrompt : .recordPrompt
        }
    }

    // MARK: - Computed Properties

    /// Entry for today, if one exists
    var todayEntry: Entry? {
        entries.first { $0.isToday }
    }

    /// Filtered timeline days based on active search and chips.
    var filteredTimelineDays: [TimelineDay] {
        timelineDays.filter { day in
            matchesDateRangeFilter(day.entry) && matchesSearchFilter(day.entry)
        }
    }

    /// Backward-compatible filtered entries for existing consumers.
    var filteredEntries: [Entry] {
        filteredTimelineDays.map(\.entry)
    }

    /// Missing-day gaps derived from filtered timeline days (most recent first).
    var filteredMissingDayGaps: [MissingDayGap] {
        missingDayGaps(for: filteredTimelineDays)
    }

    var hasActiveTimelineFilters: Bool {
        !searchQuery.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || !activeSearchChips.isEmpty
    }

    var availableJumpYears: [Int] {
        let years = Set(timelineDays.map { Calendar.current.component(.year, from: $0.dayStart) })
            .union([Calendar.current.component(.year, from: Date())])
        return years.sorted()
    }

    /// Full profile display name for settings and profile summary surfaces.
    var profileDisplayName: String {
        let first = firstName.trimmingCharacters(in: .whitespacesAndNewlines)
        let last = lastName.trimmingCharacters(in: .whitespacesAndNewlines)
        let full = [first, last]
            .filter { !$0.isEmpty }
            .joined(separator: " ")
            .trimmingCharacters(in: .whitespacesAndNewlines)
        return full.isEmpty ? "Your Name" : full
    }

    /// Name injected into greeting lines.
    var greetingName: String {
        let first = firstName.trimmingCharacters(in: .whitespacesAndNewlines)
        let last = lastName.trimmingCharacters(in: .whitespacesAndNewlines)
        return [first, last]
            .filter { !$0.isEmpty }
            .joined(separator: " ")
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }

    /// Whether the Today entry workflow UI is currently active.
    var isTodayWorkflowActive: Bool {
        let isPendingDateToday = Calendar.current.isDateInToday(pendingEntryDate)

        if forceEntryComposerVisible && flowState == .recordPrompt {
            return true
        }

        if flowState == .startingPrompt || flowState == .recording || flowState == .preview {
            return true
        }

        if todayEntry == nil {
            return true
        }

        return flowState == .recordPrompt && !isPendingDateToday
    }

    // MARK: - Journal Timeline Filters

    func toggleSearchChip(_ chip: SearchChip) {
        switch chip {
        case .dates:
            if activeSearchChips.contains(.dates) {
                clearDateFilter()
            }
        default:
            if activeSearchChips.contains(chip) {
                activeSearchChips.remove(chip)
            } else {
                activeSearchChips.insert(chip)
            }
        }
    }

    func applyDatePreset(_ preset: DatePreset) {
        selectedDatePreset = preset
        activeDateRange = normalizedRange(for: preset)
        activeSearchChips.insert(.dates)
    }

    func applyCustomDateRange(start: Date, end: Date) {
        let lower = min(start, end)
        let upper = max(start, end)
        applyDatePreset(.custom(start: lower, end: upper))
    }

    func clearDateFilter() {
        selectedDatePreset = nil
        activeDateRange = nil
        activeSearchChips.remove(.dates)
    }

    func clearAllTimelineFilters() {
        searchQuery = ""
        activeSearchChips.removeAll()
        selectedDatePreset = nil
        activeDateRange = nil
    }

    func firstAvailableDayKey(inYear year: Int, month: Int) -> String? {
        let key = String(format: "%04d-%02d", year, month)
        return monthToFirstAvailableDayKey[key]
    }

    func missingGap(between newerDay: TimelineDay, and olderDay: TimelineDay) -> MissingDayGap? {
        let calendar = Calendar.current
        let dayDifference = calendar.dateComponents([.day], from: olderDay.dayStart, to: newerDay.dayStart).day ?? 0
        let missingCount = dayDifference - 1

        guard missingCount >= 2,
              let firstMissingDay = calendar.date(byAdding: .day, value: 1, to: olderDay.dayStart),
              let lastMissingDay = calendar.date(byAdding: .day, value: -1, to: newerDay.dayStart) else {
            return nil
        }

        return MissingDayGap(
            id: "\(olderDay.id)-\(newerDay.id)",
            newerDay: newerDay,
            olderDay: olderDay,
            missingCount: missingCount,
            firstMissingDay: firstMissingDay,
            lastMissingDay: lastMissingDay
        )
    }

    func beginTodayEntryFromJournal() {
        hasSeenStartingPromptToday = true
        persistStartingPromptState()
        pendingEntryDate = Date()
        pendingEntryID = nil
        recordingSeconds = 0
        clearPreviewDraft(deleteAudio: false)
        flowState = .recordPrompt
        forceEntryComposerVisible = true
        shouldNavigateToTodayFromJournal = true
    }

    func beginEditingEntryFromJournal(_ entry: Entry) {
        startEntryForDate(entry.date, forceVisible: true)
        shouldNavigateToTodayFromJournal = true
    }

    // MARK: - Recording Actions

    /// Start recording audio
    func startRecording() {
        let entryID = UUID()
        pendingEntryID = entryID
        clearPreviewDraft(deleteAudio: false)

        // Check microphone permission first
        switch audioService.permissionStatus {
        case .granted:
            beginRecording(entryID: entryID)
        case .undetermined:
            Task {
                let granted = await audioService.requestPermission()
                if granted {
                    beginRecording(entryID: entryID)
                }
                // If denied, the view should handle showing the denied state
            }
        case .denied:
            // View layer handles showing settings prompt
            pendingEntryID = nil
            break
        @unknown default:
            pendingEntryID = nil
            break
        }
    }

    /// Actually begin the recording session after permission is confirmed
    private func beginRecording(entryID: UUID) {
        do {
            try audioService.startRecording(entryID: entryID)
            flowState = .recording
            recordingSeconds = 0

            // Start timer for visual feedback
            recordingTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
                self?.recordingSeconds += 1
            }

            // Observe audio service stopping (e.g. backgrounding)
            audioService.$isRecording
                .dropFirst()
                .filter { !$0 }
                .first()
                .receive(on: DispatchQueue.main)
                .sink { [weak self] _ in
                    self?.handleRecordingStopped()
                }
                .store(in: &cancellables)
        } catch {
            // Recording failed to start — stay on prompt screen
            flowState = .recordPrompt
            pendingEntryID = nil
        }
    }

    /// Stop recording and prepare a preview draft
    func stopRecording() {
        recordingTimer?.invalidate()
        recordingTimer = nil

        _ = audioService.stopRecording()

        guard let entryID = pendingEntryID else {
            flowState = .recordPrompt
            return
        }

        transitionToPreview(entryID: entryID)
    }

    /// Handle recording stopped externally (e.g. by backgrounding)
    private func handleRecordingStopped() {
        guard flowState == .recording else { return }
        recordingTimer?.invalidate()
        recordingTimer = nil
        guard let entryID = pendingEntryID else {
            flowState = .recordPrompt
            return
        }
        transitionToPreview(entryID: entryID)
    }

    /// Transition from recording to an unsaved preview draft
    private func transitionToPreview(entryID: UUID) {
        previewEntryID = entryID
        previewEntryDraft = Entry(
            id: entryID,
            date: pendingEntryDate,
            transcript: "Transcribing...",
            hasAudio: true
        )
        flowState = .preview
        recordingSeconds = 0
        transcribeEntry(entryID: entryID)
    }

    /// Transcribe the audio for an entry
    private func transcribeEntry(entryID: UUID) {
        let fileURL = audioService.audioFileURL(for: entryID)
        Task {
            let transcript = await transcriptionService.transcribe(audioFileURL: fileURL) ?? "Transcript unavailable"

            if previewEntryDraft?.id == entryID {
                previewEntryDraft?.transcript = transcript
            }

            if let index = entries.firstIndex(where: { $0.id == entryID }) {
                entries[index].transcript = transcript
            }
        }
    }

    /// Persist the current preview draft as an actual journal entry
    func confirmPreviewEntrySave() {
        guard let draft = previewEntryDraft else {
            resetRecording()
            return
        }

        // Once a user saves a real entry, clear all showcase samples.
        entries.removeAll { $0.isSample }

        if let existingIndex = entries.firstIndex(where: { Calendar.current.isDate($0.date, inSameDayAs: draft.date) }) {
            entries[existingIndex] = draft
        } else {
            entries.insert(draft, at: 0)
        }
        entries.sort { $0.date > $1.date }

        clearPreviewDraft(deleteAudio: false)
        flowState = .recordPrompt
        recordingSeconds = 0
        pendingEntryDate = Date()
        pendingEntryID = nil
        forceEntryComposerVisible = false
        cancellables.removeAll()
    }

    /// Discard the current preview and return to idle recording state
    func tryAgainFromPreview() {
        clearPreviewDraft(deleteAudio: true)
        flowState = .recordPrompt
        recordingSeconds = 0
        pendingEntryID = nil
        cancellables.removeAll()
    }

    /// Discard the current preview after explicit user confirmation
    func discardPreviewEntry() {
        tryAgainFromPreview()
    }

    /// Reset flow state to initial record prompt
    func resetRecording() {
        flowState = .recordPrompt
        recordingSeconds = 0
        pendingEntryDate = Date()
        pendingEntryID = nil
        forceEntryComposerVisible = false
        clearPreviewDraft(deleteAudio: false)
        cancellables.removeAll()
    }

    /// Cancel the current recording and return to record prompt
    func cancelRecording() {
        audioService.cancelRecording()
        recordingTimer?.invalidate()
        recordingTimer = nil
        recordingSeconds = 0
        pendingEntryID = nil
        forceEntryComposerVisible = false
        clearPreviewDraft(deleteAudio: false)
        cancellables.removeAll()
        flowState = .recordPrompt
    }

    /// Load the cached daily prompt, or generate and cache a new one if the day has changed
    private func loadDailyPrompt() {
        let today = Calendar.current.startOfDay(for: Date())
        let cachedDate = UserDefaults.standard.object(forKey: DefaultsKey.dailyPromptDate) as? Date
        let cachedPrompt = UserDefaults.standard.string(forKey: DefaultsKey.dailyPromptText)

        if let cachedDate, Calendar.current.isDate(cachedDate, inSameDayAs: today), let cachedPrompt {
            dailyPrompt = cachedPrompt
        } else {
            // New day — pick a fresh prompt, avoiding the previous one
            let lastIndex = UserDefaults.standard.integer(forKey: DefaultsKey.lastPromptIndex)
            var newIndex = Int.random(in: 0..<prompts.count)
            while newIndex == lastIndex && prompts.count > 1 {
                newIndex = Int.random(in: 0..<prompts.count)
            }
            let newPrompt = prompts[newIndex]

            UserDefaults.standard.set(newIndex, forKey: DefaultsKey.lastPromptIndex)
            UserDefaults.standard.set(newPrompt, forKey: DefaultsKey.dailyPromptText)
            UserDefaults.standard.set(today, forKey: DefaultsKey.dailyPromptDate)
            dailyPrompt = newPrompt
        }
    }

    /// Complete the entry and reset flow
    func completeEntry() {
        confirmPreviewEntrySave()
    }

    /// Delete an entry
    func deleteEntry(_ entry: Entry) {
        entries.removeAll { $0.id == entry.id }
    }

    // MARK: - Onboarding

    /// Mark onboarding as completed
    func completeOnboarding() {
        hasCompletedOnboarding = true

        if todayEntry == nil {
            hasSeenStartingPromptToday = false
            persistStartingPromptState()
            pendingEntryDate = Date()
            forceEntryComposerVisible = false
            flowState = .startingPrompt
        }
    }

    // MARK: - App Launch Handling

    /// Returns true when this is the first app open for the current local calendar day.
    /// On that first open, prepares the Today flow for a new daily entry.
    @discardableResult
    func registerAppOpenAndPrepareDailyWorkflowIfNeeded() -> Bool {
        let today = Calendar.current.startOfDay(for: Date())
        let lastAppOpenDate = UserDefaults.standard.object(forKey: DefaultsKey.lastAppOpenDate) as? Date
        let isFirstOpenToday = lastAppOpenDate.map { !Calendar.current.isDate($0, inSameDayAs: today) } ?? true

        guard isFirstOpenToday else { return false }

        UserDefaults.standard.set(today, forKey: DefaultsKey.lastAppOpenDate)
        pendingEntryDate = today
        forceEntryComposerVisible = false

        if todayEntry == nil {
            flowState = shouldShowStartingPrompt() ? .startingPrompt : .recordPrompt
        }

        return true
    }

    // MARK: - Starting Prompt

    /// Check if starting prompt should be shown
    func shouldShowStartingPrompt() -> Bool {
        todayEntry == nil && !hasSeenStartingPromptToday
    }

    /// Dismiss starting prompt and navigate to timeline
    func dismissStartingPrompt() {
        hasSeenStartingPromptToday = true
        forceEntryComposerVisible = false
        shouldNavigateToTimeline = true
        persistStartingPromptState()
    }

    /// Begin journaling from starting prompt (show idle recording state first)
    func beginJournalingFromPrompt() {
        hasSeenStartingPromptToday = true
        persistStartingPromptState()
        pendingEntryDate = Date()
        pendingEntryID = nil
        recordingSeconds = 0
        forceEntryComposerVisible = false
        clearPreviewDraft(deleteAudio: false)
        flowState = .recordPrompt
    }

    /// Check and reset daily prompt state if a new day has started
    func checkAndResetDailyPrompt() {
        let today = Calendar.current.startOfDay(for: Date())
        let lastDate = Calendar.current.startOfDay(for: lastPromptDate)

        if today > lastDate {
            hasSeenStartingPromptToday = false
            lastPromptDate = today
            UserDefaults.standard.set(false, forKey: DefaultsKey.hasSeenStartingPromptToday)
            loadDailyPrompt()
        }
    }

    /// Persist the starting prompt state to UserDefaults
    private func persistStartingPromptState() {
        UserDefaults.standard.set(hasSeenStartingPromptToday, forKey: DefaultsKey.hasSeenStartingPromptToday)
    }

    /// Migrates the legacy single userName into first/last names when needed.
    private func migrateLegacyUserNameIfNeeded() {
        let hasAnyCurrentName =
            !firstName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
            !lastName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty

        guard !hasAnyCurrentName else { return }

        let legacyName = UserDefaults.standard.string(forKey: DefaultsKey.userName)?
            .trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

        guard !legacyName.isEmpty else { return }

        let tokens = legacyName.split(whereSeparator: \.isWhitespace).map(String.init)
        firstName = tokens.first ?? ""
        if tokens.count > 1 {
            lastName = tokens.dropFirst().joined(separator: " ")
        } else {
            lastName = ""
        }
    }

    // MARK: - Calendar Support

    /// Get entry for a specific calendar date (ignoring time)
    func entry(for date: Date) -> Entry? {
        let calendar = Calendar.current
        return entries.first { calendar.isDate($0.date, inSameDayAs: date) }
    }

    /// Start a new entry for a specific date (past or today)
    func startEntryForDate(_ date: Date, forceVisible: Bool = true) {
        pendingEntryDate = date
        pendingEntryID = nil
        recordingSeconds = 0
        forceEntryComposerVisible = forceVisible
        clearPreviewDraft(deleteAudio: false)
        flowState = .recordPrompt
    }

    private func clearPreviewDraft(deleteAudio: Bool) {
        if deleteAudio, let entryID = previewEntryDraft?.id ?? previewEntryID {
            audioService.deleteAudioFile(for: entryID)
        }
        previewEntryDraft = nil
        previewEntryID = nil
    }

    private func bindAudioInputLevel() {
        audioService.$normalizedInputLevel
            .receive(on: DispatchQueue.main)
            .sink { [weak self] level in
                guard let self else { return }
                self.recordingInputLevel = self.flowState == .recording ? level : 0
            }
            .store(in: &serviceCancellables)
    }

    private func seedSampleEntriesIfNeeded() {
        guard entries.isEmpty else { return }
        entries = Entry.generateJournalShowcaseEntries()
    }

    // MARK: - Timeline Derivation

    private func rebuildTimelineDerivedData() {
        let calendar = Calendar.current
        let sortedEntries = entries.sorted { $0.date > $1.date }
        var seenDayKeys = Set<String>()
        var resolvedDays: [TimelineDay] = []

        for entry in sortedEntries {
            let dayStart = calendar.startOfDay(for: entry.date)
            let dayKey = Self.dayKeyFormatter.string(from: dayStart)
            guard seenDayKeys.insert(dayKey).inserted else { continue }
            resolvedDays.append(TimelineDay(id: dayKey, dayStart: dayStart, entry: entry))
        }

        timelineDays = resolvedDays
        timelineDayIndex = Dictionary(uniqueKeysWithValues: resolvedDays.enumerated().map { ($0.element.id, $0.offset) })

        var monthMap: [String: String] = [:]
        for day in resolvedDays.reversed() {
            let monthKey = Self.monthKeyFormatter.string(from: day.dayStart)
            if monthMap[monthKey] == nil {
                monthMap[monthKey] = day.id
            }
        }
        monthToFirstAvailableDayKey = monthMap
    }

    private func matchesDateRangeFilter(_ entry: Entry) -> Bool {
        guard let range = activeDateRange else { return true }
        return range.contains(entry.date)
    }

    private func matchesSearchFilter(_ entry: Entry) -> Bool {
        let query = searchQuery.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()

        if activeSearchChips.contains(.people) {
            let personTokens = personNameTokens(in: entry.transcript)
            if query.isEmpty {
                return !personTokens.isEmpty
            }
            return personTokens.contains { token in
                token.contains(query) || query.contains(token)
            }
        }

        guard !query.isEmpty else { return true }

        if entry.transcript.lowercased().contains(query) {
            return true
        }

        return entry.searchableDateText.lowercased().contains(query)
    }

    private func personNameTokens(in transcript: String) -> Set<String> {
        let pattern = #"\b[A-Z][a-z]{2,}\b"#
        guard let regex = try? NSRegularExpression(pattern: pattern) else {
            return []
        }

        let nsRange = NSRange(transcript.startIndex..<transcript.endIndex, in: transcript)
        let matches = regex.matches(in: transcript, range: nsRange)
        var tokens = Set<String>()

        for match in matches {
            guard let range = Range(match.range, in: transcript) else { continue }
            let token = transcript[range].lowercased()
            guard !Self.nameStopWords.contains(token) else { continue }
            tokens.insert(token)
        }

        return tokens
    }

    private func normalizedRange(for preset: DatePreset) -> ClosedRange<Date> {
        let calendar = Calendar.current
        let now = Date()

        switch preset {
        case .thisWeek:
            let start = calendar.dateInterval(of: .weekOfYear, for: now)?.start ?? calendar.startOfDay(for: now)
            let end = calendar.date(byAdding: .day, value: 7, to: start)?.addingTimeInterval(-1) ?? now
            return start...end

        case .thisMonth:
            let start = calendar.dateInterval(of: .month, for: now)?.start ?? calendar.startOfDay(for: now)
            let end = calendar.date(byAdding: .month, value: 1, to: start)?.addingTimeInterval(-1) ?? now
            return start...end

        case .last3Months:
            let startCandidate = calendar.date(byAdding: .month, value: -3, to: now) ?? now
            let start = calendar.startOfDay(for: startCandidate)
            let end = calendar.date(bySettingHour: 23, minute: 59, second: 59, of: now) ?? now
            return start...end

        case let .custom(start, end):
            let lower = calendar.startOfDay(for: min(start, end))
            let upperDay = max(start, end)
            let upper = calendar.date(bySettingHour: 23, minute: 59, second: 59, of: upperDay) ?? upperDay
            return lower...upper
        }
    }

    private func missingDayGaps(for days: [TimelineDay]) -> [MissingDayGap] {
        guard days.count > 1 else { return [] }

        var gaps: [MissingDayGap] = []
        for index in 0..<(days.count - 1) {
            let newer = days[index]
            let older = days[index + 1]
            if let gap = missingGap(between: newer, and: older) {
                gaps.append(gap)
            }
        }
        return gaps
    }

    private static let dayKeyFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = .current
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = .current
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()

    private static let monthKeyFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = .current
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = .current
        formatter.dateFormat = "yyyy-MM"
        return formatter
    }()

    private static let nameStopWords: Set<String> = [
        "about", "afternoon", "after", "again", "already", "and", "another", "before", "best", "between",
        "breakfast", "coffee", "did", "dinner", "evening", "felt", "friday", "from", "good", "had", "highlight",
        "interview", "journaled", "late", "left", "lunch", "monday", "morning", "night", "noted", "quick", "read",
        "recorded", "reminder", "saturday", "search", "sent", "spent", "still", "sunday", "team", "test", "the",
        "thursday", "today", "tonight", "took", "transcript", "tried", "tuesday", "unexpectedly", "wednesday", "with",
        "worked", "yesterday"
    ]

    // MARK: - Helpers

    /// Format seconds as MM:SS for recording timer
    func formattedRecordingTime() -> String {
        let minutes = recordingSeconds / 60
        let seconds = recordingSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
