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
    case startingPrompt  // Initial prompt before mood selection
    case selectMood      // Step 1: Mood selection
    case recordPrompt    // Step 2: Ready to record with prompt
    case recording       // Recording in progress
    case saved           // Recording complete
}

/// Main view model managing all app state
/// - Note: In production, this would integrate with persistence, audio services, etc.
@MainActor
class JournalViewModel: ObservableObject {

    // MARK: - Published Properties

    /// All journal entries (mock data)
    @Published var entries: [Entry]

    /// Whether user has completed onboarding
    @Published var hasCompletedOnboarding: Bool = false

    /// User's display name (set during onboarding, editable in settings)
    @Published var userName: String = "" {
        didSet { UserDefaults.standard.set(userName, forKey: "userName") }
    }

    /// Current flow state for Today screen (two-step journal entry)
    @Published var flowState: JournalFlowState = .selectMood

    /// Elapsed recording time in seconds (for timer display)
    @Published var recordingSeconds: Int = 0

    /// Currently selected mood for new recording (nil = not selected)
    @Published var selectedMood: Int? = nil

    /// Target date for the new entry (for creating past entries from calendar)
    @Published var pendingEntryDate: Date = Date()

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
    private var cancellables = Set<AnyCancellable>()

    /// Last date user saw the starting prompt (for daily reset)
    private var lastPromptDate: Date {
        get { UserDefaults.standard.object(forKey: "lastStartingPromptDate") as? Date ?? Date.distantPast }
        set { UserDefaults.standard.set(newValue, forKey: "lastStartingPromptDate") }
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
        // Load mock data
        self.entries = Entry.generateMockEntries()

        // Load persisted user name
        self.userName = UserDefaults.standard.string(forKey: "userName") ?? ""

        // Load persisted starting prompt state
        self.hasSeenStartingPromptToday = UserDefaults.standard.bool(forKey: "hasSeenStartingPromptToday")
        checkAndResetDailyPrompt()

        // Load or generate cached daily prompt
        loadDailyPrompt()

        // Set initial flow state based on whether starting prompt should show
        if shouldShowStartingPrompt() {
            flowState = .startingPrompt
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

    // MARK: - Recording Actions

    /// Start recording audio
    func startRecording() {
        let entryID = UUID()
        pendingEntryID = entryID

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
            break
        @unknown default:
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
                Task { @MainActor in
                    self?.recordingSeconds += 1
                }
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
        }
    }

    /// Stop recording and save the entry
    func stopRecording() {
        recordingTimer?.invalidate()
        recordingTimer = nil

        let audioURL = audioService.stopRecording()
        saveEntry(audioURL: audioURL)
    }

    /// Handle recording stopped externally (e.g. by backgrounding)
    private func handleRecordingStopped() {
        guard flowState == .recording else { return }
        recordingTimer?.invalidate()
        recordingTimer = nil
        saveEntry(audioURL: nil) // Audio file already saved by service; saveEntry triggers transcription
    }

    /// Save the entry after recording completes
    private func saveEntry(audioURL: URL?) {
        flowState = .saved

        // Create a new entry for the pending date
        if entry(for: pendingEntryDate) == nil {
            let newEntry = Entry(
                id: pendingEntryID ?? UUID(),
                date: pendingEntryDate,
                transcript: "Transcribing...",
                mood: selectedMood ?? 2,
                hasAudio: true
            )
            entries.insert(newEntry, at: 0)
            entries.sort { $0.date > $1.date }
        }

        // Trigger transcription
        if let entryID = pendingEntryID {
            transcribeEntry(entryID: entryID)
        }
    }

    /// Transcribe the audio for an entry
    private func transcribeEntry(entryID: UUID) {
        let fileURL = audioService.audioFileURL(for: entryID)
        Task {
            let transcript = await transcriptionService.transcribe(audioFileURL: fileURL)
            if let index = entries.firstIndex(where: { $0.id == entryID }) {
                entries[index].transcript = transcript ?? "Transcript unavailable"
            }
        }
    }

    /// Reset flow state to initial mood selection
    func resetRecording() {
        flowState = .selectMood
        recordingSeconds = 0
        selectedMood = nil
        pendingEntryDate = Date()
        pendingEntryID = nil
        cancellables.removeAll()
    }

    /// Cancel the current recording and return to record prompt
    func cancelRecording() {
        audioService.cancelRecording()
        recordingTimer?.invalidate()
        recordingTimer = nil
        recordingSeconds = 0
        pendingEntryID = nil
        cancellables.removeAll()
        flowState = .recordPrompt
    }

    /// Advance from mood selection to recording prompt (Step 1 → Step 2)
    func advanceToRecordPrompt() {
        loadDailyPrompt()
        flowState = .recordPrompt
    }

    /// Load the cached daily prompt, or generate and cache a new one if the day has changed
    private func loadDailyPrompt() {
        let today = Calendar.current.startOfDay(for: Date())
        let cachedDate = UserDefaults.standard.object(forKey: "dailyPromptDate") as? Date
        let cachedPrompt = UserDefaults.standard.string(forKey: "dailyPromptText")

        if let cachedDate, Calendar.current.isDate(cachedDate, inSameDayAs: today), let cachedPrompt {
            dailyPrompt = cachedPrompt
        } else {
            // New day — pick a fresh prompt, avoiding the previous one
            let lastIndex = UserDefaults.standard.integer(forKey: "lastPromptIndex")
            var newIndex = Int.random(in: 0..<prompts.count)
            while newIndex == lastIndex && prompts.count > 1 {
                newIndex = Int.random(in: 0..<prompts.count)
            }
            let newPrompt = prompts[newIndex]

            UserDefaults.standard.set(newIndex, forKey: "lastPromptIndex")
            UserDefaults.standard.set(newPrompt, forKey: "dailyPromptText")
            UserDefaults.standard.set(today, forKey: "dailyPromptDate")
            dailyPrompt = newPrompt
        }
    }

    /// Go back from recording prompt to mood selection (Step 2 → Step 1)
    func goBackToMoodSelection() {
        flowState = .selectMood
    }

    /// Complete the entry and reset flow
    func completeEntry() {
        resetRecording()
    }

    // MARK: - Entry Actions

    /// Update mood for an entry
    func updateMood(for entry: Entry, to mood: Int) {
        if let index = entries.firstIndex(where: { $0.id == entry.id }) {
            entries[index].mood = mood
        }
    }

    /// Delete an entry
    func deleteEntry(_ entry: Entry) {
        entries.removeAll { $0.id == entry.id }
    }

    // MARK: - Onboarding

    /// Mark onboarding as completed
    func completeOnboarding() {
        // TODO: In production, persist this to UserDefaults
        hasCompletedOnboarding = true
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

    /// Begin journaling from starting prompt (transition to mood selection)
    func beginJournalingFromPrompt() {
        hasSeenStartingPromptToday = true
        persistStartingPromptState()
        flowState = .selectMood
    }

    /// Check and reset daily prompt state if a new day has started
    func checkAndResetDailyPrompt() {
        let today = Calendar.current.startOfDay(for: Date())
        let lastDate = Calendar.current.startOfDay(for: lastPromptDate)

        if today > lastDate {
            hasSeenStartingPromptToday = false
            lastPromptDate = today
            UserDefaults.standard.set(false, forKey: "hasSeenStartingPromptToday")
        }
    }

    /// Persist the starting prompt state to UserDefaults
    private func persistStartingPromptState() {
        UserDefaults.standard.set(hasSeenStartingPromptToday, forKey: "hasSeenStartingPromptToday")
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
        flowState = .selectMood
    }

    // MARK: - Helpers

    /// Format seconds as MM:SS for recording timer
    func formattedRecordingTime() -> String {
        let minutes = recordingSeconds / 60
        let seconds = recordingSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
