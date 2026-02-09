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
        static let hasSeenStartingPromptToday = "hasSeenStartingPromptToday"
        static let lastStartingPromptDate = "lastStartingPromptDate"
        static let dailyPromptDate = "dailyPromptDate"
        static let dailyPromptText = "dailyPromptText"
        static let lastPromptIndex = "lastPromptIndex"
        static let lastAppOpenDate = "lastAppOpenDate"
    }

    // MARK: - Published Properties

    /// All journal entries (mock data)
    @Published var entries: [Entry]

    /// Whether user has completed onboarding
    @Published var hasCompletedOnboarding: Bool = false {
        didSet { UserDefaults.standard.set(hasCompletedOnboarding, forKey: DefaultsKey.hasCompletedOnboarding) }
    }

    /// User's display name (set during onboarding, editable in settings)
    @Published var userName: String = "" {
        didSet { UserDefaults.standard.set(userName, forKey: DefaultsKey.userName) }
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
        // Runtime starts with no seeded entries.
        // This ensures first launch always enters the starting prompt flow.
        self.entries = []

        // Load persisted onboarding state
        self.hasCompletedOnboarding = UserDefaults.standard.bool(forKey: DefaultsKey.hasCompletedOnboarding)

        // Load persisted user name
        self.userName = UserDefaults.standard.string(forKey: DefaultsKey.userName) ?? ""

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

    /// Entries grouped by date for timeline display
    var entriesByDate: [(date: String, entries: [Entry])] {
        let grouped = Dictionary(grouping: entries) { entry in
            entry.relativeDateString
        }

        // Sort by most recent first
        return grouped
            .map { (date: $0.key, entries: $0.value.sorted { $0.date > $1.date }) }
            .sorted { first, second in
                guard let firstEntry = first.entries.first,
                      let secondEntry = second.entries.first else {
                    return false
                }
                return firstEntry.date > secondEntry.date
            }
    }

    /// Filtered entries based on search query
    var filteredEntries: [Entry] {
        guard !searchQuery.isEmpty else { return [] }
        let query = searchQuery.lowercased()
        return entries.filter { $0.transcript.lowercased().contains(query) }
    }

    /// Whether the Today entry workflow UI is currently active.
    var isTodayWorkflowActive: Bool {
        let isPendingDateToday = Calendar.current.isDateInToday(pendingEntryDate)

        if flowState == .startingPrompt || flowState == .recording || flowState == .preview {
            return true
        }

        if todayEntry == nil {
            return true
        }

        return flowState == .recordPrompt && !isPendingDateToday
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

    // MARK: - Calendar Support

    /// Get entry for a specific calendar date (ignoring time)
    func entry(for date: Date) -> Entry? {
        let calendar = Calendar.current
        return entries.first { calendar.isDate($0.date, inSameDayAs: date) }
    }

    /// Start a new entry for a specific date (past or today)
    func startEntryForDate(_ date: Date) {
        pendingEntryDate = date
        pendingEntryID = nil
        recordingSeconds = 0
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

    // MARK: - Helpers

    /// Format seconds as MM:SS for recording timer
    func formattedRecordingTime() -> String {
        let minutes = recordingSeconds / 60
        let seconds = recordingSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
