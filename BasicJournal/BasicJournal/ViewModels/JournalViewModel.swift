//
//  JournalViewModel.swift
//  BasicJournal
//
//  One Thing - Daily Voice Journal
//  Lightweight state management for UI prototype
//

import Foundation
import SwiftUI
import Combine

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

    /// Current flow state for Today screen (two-step journal entry)
    @Published var flowState: JournalFlowState = .selectMood

    /// Elapsed recording time in seconds (for timer display)
    @Published var recordingSeconds: Int = 0

    /// Currently selected mood for new recording (nil = not selected)
    @Published var selectedMood: Int? = nil

    /// Target date for the new entry (for creating past entries from calendar)
    @Published var pendingEntryDate: Date = Date()

    /// Current random prompt text
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

    // MARK: - Private Properties

    private var recordingTimer: Timer?

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

        // Load persisted starting prompt state
        self.hasSeenStartingPromptToday = UserDefaults.standard.bool(forKey: "hasSeenStartingPromptToday")
        checkAndResetDailyPrompt()

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

    /// Start a fake recording session
    func startRecording() {
        flowState = .recording
        recordingSeconds = 0

        // TODO: In production, request microphone permission and start AVAudioRecorder
        // TODO: Start speech-to-text transcription

        // Start timer for visual feedback
        recordingTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            Task { @MainActor in
                self?.recordingSeconds += 1
            }
        }
    }

    /// Stop the fake recording session
    func stopRecording() {
        recordingTimer?.invalidate()
        recordingTimer = nil
        flowState = .saved

        // TODO: In production, stop AVAudioRecorder
        // TODO: Finalize transcription
        // TODO: Save audio file

        // Create a new mock entry for the pending date (mood already selected in Step 1)
        // Only create if no entry exists for that date
        if entry(for: pendingEntryDate) == nil {
            let newEntry = Entry(
                date: pendingEntryDate,
                transcript: "This is a placeholder for your recorded entry. In the full app, your voice would be transcribed here automatically.",
                mood: selectedMood ?? 2,
                hasAudio: true
            )
            entries.insert(newEntry, at: 0)
            // Sort entries by date (newest first)
            entries.sort { $0.date > $1.date }
        }
    }

    /// Reset flow state to initial mood selection
    func resetRecording() {
        flowState = .selectMood
        recordingSeconds = 0
        selectedMood = nil
        pendingEntryDate = Date()
    }

    /// Advance from mood selection to recording prompt (Step 1 → Step 2)
    func advanceToRecordPrompt() {
        refreshDailyPrompt()
        flowState = .recordPrompt
    }

    /// Select a random prompt ensuring no consecutive repeats
    private func refreshDailyPrompt() {
        let lastIndex = UserDefaults.standard.integer(forKey: "lastPromptIndex")
        var newIndex = Int.random(in: 0..<prompts.count)
        
        // Ensure we don't pick the same one twice in a row, unless there's only 1 item
        while newIndex == lastIndex && prompts.count > 1 {
            newIndex = Int.random(in: 0..<prompts.count)
        }
        
        // Save and update
        UserDefaults.standard.set(newIndex, forKey: "lastPromptIndex")
        dailyPrompt = prompts[newIndex]
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
