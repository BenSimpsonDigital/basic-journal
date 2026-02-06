//
//  TodayView.swift
//  Remin
//
//  One Thing - Daily Voice Journal
//  Minimal, editorial design — clean typography, subtle motion
//

import SwiftUI

struct TodayView: View {
    @ObservedObject var viewModel: JournalViewModel
    @State private var showDiscardConfirmation = false
    @State private var isCountingDown = false

    // Active mood for subtle background tint
    private var activeMood: Int? {
        viewModel.todayEntry?.mood ?? viewModel.selectedMood
    }

    var body: some View {
        NavigationStack {
            ZStack {
                // Base background
                Theme.Colors.background
                    .ignoresSafeArea()

                // Subtle mood tint when mood is selected
                if let mood = activeMood {
                    RadialGradient(
                        colors: [
                            Theme.Colors.moodAccents[mood].opacity(0.06),
                            Theme.Colors.background
                        ],
                        center: .center,
                        startRadius: 0,
                        endRadius: UIScreen.main.bounds.height * 0.5
                    )
                    .ignoresSafeArea()
                    .animation(.easeInOut(duration: 0.8), value: mood)
                }

                ScrollView(showsIndicators: false) {
                    VStack(spacing: Theme.Spacing.xl) {
                        // Header with date
                        ScreenHeaderView(
                            title: formattedDate,
                            subtitle: formattedWeekday,
                            alignment: .center
                        )
                        .padding(.top, Theme.Spacing.md)

                        // Main content based on state
                        if let todayEntry = viewModel.todayEntry,
                           viewModel.flowState != .recording {
                            TodayEntryCardView(entry: todayEntry, viewModel: viewModel)
                        } else {
                            TodayRecordingView(viewModel: viewModel, isCountingDown: $isCountingDown)
                        }
                    }
                }
                .safeAreaInset(edge: .bottom) {
                    todayDock
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .confirmationDialog(
                "Discard today's entry?",
                isPresented: $showDiscardConfirmation,
                titleVisibility: .visible
            ) {
                Button("Discard", role: .destructive) {
                    UINotificationFeedbackGenerator().notificationOccurred(.warning)
                    viewModel.cancelRecording()
                }
                Button("Keep recording", role: .cancel) { }
            }
        }
    }

    // MARK: - Bottom Dock

    @ViewBuilder
    private var todayDock: some View {
        if viewModel.todayEntry == nil || viewModel.flowState == .recording {
            switch viewModel.flowState {
            case .startingPrompt:
                BottomActionDock {
                    Button("Start") {
                        withAnimation(.easeOut(duration: 0.3)) {
                            viewModel.beginJournalingFromPrompt()
                        }
                    }
                    .buttonStyle(PrimaryDockButtonStyle())
                } secondary: {
                    Button("Later") {
                        viewModel.dismissStartingPrompt()
                    }
                    .buttonStyle(SecondaryDockButtonStyle())
                }

            case .selectMood:
                BottomActionDock {
                    Button("Next") {
                        viewModel.advanceToRecordPrompt()
                    }
                    .buttonStyle(PrimaryDockButtonStyle())
                    .disabled(viewModel.selectedMood == nil)
                }

            case .recordPrompt:
                if !isCountingDown {
                    BottomActionDock {
                        Button("I'm ready") {
                            isCountingDown = true
                        }
                        .buttonStyle(PrimaryDockButtonStyle())
                    } secondary: {
                        Button("Back") {
                            viewModel.goBackToMoodSelection()
                        }
                        .buttonStyle(SecondaryDockButtonStyle())
                    }
                    .transition(.opacity)
                }

            case .recording:
                BottomActionDock {
                    Button("Stop & try again") {
                        viewModel.cancelRecording()
                        isCountingDown = false
                    }
                    .buttonStyle(SecondaryDockButtonStyle())
                } secondary: {
                    Button("Discard entry") {
                        showDiscardConfirmation = true
                    }
                    .buttonStyle(SecondaryDockButtonStyle())
                    .foregroundColor(Theme.Colors.textTertiary)
                }

            case .saved:
                BottomActionDock {
                    Button("Done") {
                        viewModel.completeEntry()
                    }
                    .buttonStyle(PrimaryDockButtonStyle())
                }
            }
        }
    }

    private var formattedWeekday: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: Date())
    }

    private var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM"
        return formatter.string(from: Date())
    }
}

// MARK: - Recording View (Main interaction area)

struct TodayRecordingView: View {
    @ObservedObject var viewModel: JournalViewModel
    @Binding var isCountingDown: Bool

    var body: some View {
        ZStack {
            switch viewModel.flowState {
            case .startingPrompt:
                StartingPromptView(viewModel: viewModel)
                    .transition(.opacity)

            case .selectMood:
                MoodSelectionStepView(viewModel: viewModel)
                    .transition(.opacity)

            case .recordPrompt:
                RecordPromptStepView(
                    viewModel: viewModel,
                    isCountingDown: $isCountingDown,
                    onCountdownComplete: {
                        viewModel.startRecording()
                    }
                )
                .transition(.opacity)

            case .recording:
                RecordingStateView(viewModel: viewModel)
                    .transition(.opacity)

            case .saved:
                SimpleSavedStateView(viewModel: viewModel)
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.35), value: viewModel.flowState)
    }
}

// MARK: - Starting Prompt View

struct StartingPromptView: View {
    @ObservedObject var viewModel: JournalViewModel
    @State private var hasAppeared = false

    private var timeOfDayGreeting: String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 5..<12: return "Good morning"
        case 12..<17: return "Good afternoon"
        case 17..<21: return "Good evening"
        default: return "Good night"
        }
    }

    private var greetingLine: String {
        let name = viewModel.userName.trimmingCharacters(in: .whitespacesAndNewlines)
        if name.isEmpty {
            return "\(timeOfDayGreeting)."
        } else {
            return "\(timeOfDayGreeting), \(name)."
        }
    }

    var body: some View {
        VStack(spacing: Theme.Spacing.xl) {
            Spacer()

            VStack(spacing: Theme.Spacing.xxl) {
                Text(greetingLine)
                    .font(Theme.Typography.displayLarge())
                    .foregroundColor(Theme.Colors.textPrimary)
                    .multilineTextAlignment(.center)

                Text("Take a moment\nfor yourself")
                    .font(Theme.Typography.displayLarge())
                    .foregroundColor(Theme.Colors.textSecondary)
                    .multilineTextAlignment(.center)
            }
            .lineSpacing(4)
            .opacity(hasAppeared ? 1.0 : 0)
            .animation(.easeOut(duration: 0.6), value: hasAppeared)

            Spacer()
        }
        .padding(.horizontal, Theme.Spacing.lg)
        .onAppear {
            hasAppeared = true
        }
    }
}

// MARK: - Step 1: Mood Selection

struct MoodSelectionStepView: View {
    @ObservedObject var viewModel: JournalViewModel

    var body: some View {
        VStack(spacing: Theme.Spacing.lg) {
            Spacer()

            Text("How does today\nfeel, overall?")
                .font(Theme.Typography.displayLarge())
                .foregroundColor(Theme.Colors.textPrimary)
                .multilineTextAlignment(.center)
                .lineSpacing(4)

            // Mood pills in a wrapping horizontal layout
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: Theme.Spacing.sm) {
                    ForEach(0..<5) { index in
                        MoodPill(
                            index: index,
                            isSelected: viewModel.selectedMood == index,
                            action: {
                                UISelectionFeedbackGenerator().selectionChanged()
                                withAnimation(.easeOut(duration: 0.2)) {
                                    viewModel.selectedMood = index
                                }
                            }
                        )
                    }
                }
                .padding(.horizontal, Theme.Spacing.lg)
                .padding(.vertical, Theme.Spacing.md)
            }

            Spacer()
        }
    }
}

// MARK: - Step 2: Record Prompt

struct RecordPromptStepView: View {
    @ObservedObject var viewModel: JournalViewModel
    @Binding var isCountingDown: Bool
    var onCountdownComplete: () -> Void

    @State private var countdownValue = 3
    @State private var showPromptText = true
    @State private var countdownTimer: Timer?

    var body: some View {
        ZStack {
            // Main Content
            VStack(spacing: 0) {
                Spacer()

                Text("Let's record\ntoday's note")
                    .font(Theme.Typography.displayLarge())
                    .foregroundColor(Theme.Colors.textPrimary)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
                    .opacity(showPromptText ? 1.0 : 0.0)

                Spacer()
            }
            .padding(.horizontal, Theme.Spacing.lg)

            // Countdown overlay
            if isCountingDown && !showPromptText {
                CountdownNumberView(value: countdownValue)
                    .transition(.scale.combined(with: .opacity))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .contentShape(Rectangle())
        .onTapGesture {
            if isCountingDown {
                cancelCountdown()
            }
        }
        .animation(.easeInOut(duration: 0.3), value: showPromptText)
        .animation(.easeOut(duration: 0.3), value: countdownValue)
        .onChange(of: isCountingDown) { _, newValue in
            if newValue {
                startCountdown()
            } else {
                cancelCountdown()
            }
        }
        .onDisappear {
            cancelCountdown()
        }
    }

    private func startCountdown() {
        countdownValue = 3
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()

        withAnimation(.easeOut(duration: 0.25)) {
            showPromptText = false
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            guard isCountingDown else { return }
            runCountdownTimer()
        }
    }

    private func runCountdownTimer() {
        countdownTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if countdownValue > 1 {
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
                countdownValue -= 1
            } else {
                timer.invalidate()
                countdownTimer = nil
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                onCountdownComplete()
            }
        }
    }

    private func cancelCountdown() {
        countdownTimer?.invalidate()
        countdownTimer = nil
        countdownValue = 3
        isCountingDown = false
        withAnimation(.easeOut(duration: 0.2)) {
            showPromptText = true
        }
    }
}

// MARK: - Countdown Number View

struct CountdownNumberView: View {
    let value: Int

    @State private var scale: CGFloat = 0.5
    @State private var opacity: Double = 0

    var body: some View {
        Text("\(value)")
            .font(.system(size: 96, weight: .ultraLight, design: .monospaced))
            .foregroundColor(Theme.Colors.textPrimary)
            .scaleEffect(scale)
            .opacity(opacity)
            .onAppear {
                withAnimation(.spring(response: 0.35, dampingFraction: 0.6)) {
                    scale = 1.0
                    opacity = 1.0
                }
            }
            .onChange(of: value) { _, _ in
                withAnimation(.easeIn(duration: 0.1)) {
                    scale = 0.85
                    opacity = 0.5
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                        scale = 1.0
                        opacity = 1.0
                    }
                }
            }
    }
}

// MARK: - Recording State

struct RecordingStateView: View {
    @ObservedObject var viewModel: JournalViewModel

    var body: some View {
        VStack(spacing: Theme.Spacing.xl) {
            Spacer()

            // Breathing circle animation
            BreathingCircle(size: 160, color: Theme.Colors.accent)

            // Timer display
            Text(viewModel.formattedRecordingTime())
                .font(Theme.Typography.timer())
                .foregroundColor(Theme.Colors.textPrimary)
                .monospacedDigit()

            // Recording label
            Text("Recording")
                .font(Theme.Typography.captionMedium())
                .foregroundColor(Theme.Colors.textSecondary)
                .textCase(.uppercase)
                .tracking(1.5)

            Spacer()

            // Stop button
            Button(action: {
                UINotificationFeedbackGenerator().notificationOccurred(.success)
                viewModel.stopRecording()
            }) {
                ZStack {
                    Circle()
                        .fill(Theme.Colors.accent)
                        .frame(width: 64, height: 64)

                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.white)
                        .frame(width: 20, height: 20)
                }
            }
            .buttonStyle(.plain)
            .accessibilityLabel("Stop recording")

            Text("Tap to stop")
                .font(Theme.Typography.caption())
                .foregroundColor(Theme.Colors.textTertiary)

            Spacer()
        }
    }
}

// MARK: - Saved State

struct SimpleSavedStateView: View {
    @ObservedObject var viewModel: JournalViewModel
    @State private var isPlaying = false
    @State private var playbackProgress: Double = 0.0
    @State private var showFullTranscript = false

    private var savedEntry: Entry? {
        viewModel.todayEntry
    }

    var body: some View {
        VStack(spacing: Theme.Spacing.lg) {
            Text("Saved for today")
                .font(Theme.Typography.displaySmall())
                .foregroundColor(Theme.Colors.textPrimary)

            SoftCard {
                VStack(spacing: Theme.Spacing.lg) {
                    // Audio playback
                    AudioPlaybackView(isPlaying: $isPlaying, progress: $playbackProgress)

                    Divider()
                        .foregroundColor(Theme.Colors.border)

                    // Transcript preview
                    if let entry = savedEntry {
                        VStack(alignment: .leading, spacing: Theme.Spacing.sm) {
                            Text(entry.transcript)
                                .font(Theme.Typography.body())
                                .foregroundColor(Theme.Colors.textPrimary)
                                .lineSpacing(6)
                                .lineLimit(showFullTranscript ? nil : 3)
                                .frame(maxWidth: .infinity, alignment: .leading)

                            if entry.transcript.count > 120 && !showFullTranscript {
                                Button("See more") {
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        showFullTranscript = true
                                    }
                                }
                                .font(Theme.Typography.caption())
                                .foregroundColor(Theme.Colors.accent)
                            }
                        }

                        Text("Transcript saved automatically")
                            .font(Theme.Typography.caption())
                            .foregroundColor(Theme.Colors.textTertiary)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Divider()
                            .foregroundColor(Theme.Colors.border)

                        // Metadata: mood + date
                        HStack {
                            Text(entry.moodLabel)
                                .font(Theme.Typography.captionMedium())
                                .foregroundColor(Theme.Colors.moodAccents[entry.mood])
                                .padding(.horizontal, Theme.Spacing.md)
                                .padding(.vertical, Theme.Spacing.xs + 2)
                                .background(
                                    Capsule()
                                        .fill(Theme.Colors.moodAccentBackground(for: entry.mood))
                                )

                            Spacer()

                            Text(entry.formattedTime)
                                .font(Theme.Typography.caption())
                                .foregroundColor(Theme.Colors.textTertiary)
                        }
                    } else {
                        Text("Your entry has been saved.")
                            .font(Theme.Typography.body())
                            .foregroundColor(Theme.Colors.textSecondary)
                    }
                }
            }
            .padding(.horizontal, Theme.Spacing.lg)
        }
        .onAppear {
            UINotificationFeedbackGenerator().notificationOccurred(.success)
        }
    }
}

// MARK: - Today Entry Card (When entry exists)

struct TodayEntryCardView: View {
    let entry: Entry
    @ObservedObject var viewModel: JournalViewModel
    @State private var isPlaying = false
    @State private var playbackProgress: Double = 0.3

    var body: some View {
        VStack(spacing: Theme.Spacing.lg) {
            // Success badge
            HStack(spacing: Theme.Spacing.sm) {
                AppIconImage(icon: .checkCircle, isSelected: true, size: 18)
                    .foregroundColor(Theme.Colors.accent)
                Text("Today's reflection")
                    .font(Theme.Typography.captionMedium())
                    .foregroundColor(Theme.Colors.textSecondary)
            }

            // Main card
            SoftCard {
                VStack(spacing: Theme.Spacing.lg) {
                    // Audio player
                    AudioPlaybackView(isPlaying: $isPlaying, progress: $playbackProgress)

                    Divider()
                        .foregroundColor(Theme.Colors.border)

                    // Transcript
                    Text(entry.transcript)
                        .font(Theme.Typography.body())
                        .foregroundColor(Theme.Colors.textPrimary)
                        .lineSpacing(6)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    // Mood and time
                    HStack {
                        Text(entry.moodLabel)
                            .font(Theme.Typography.captionMedium())
                            .foregroundColor(Theme.Colors.moodAccents[entry.mood])
                            .padding(.horizontal, Theme.Spacing.md)
                            .padding(.vertical, Theme.Spacing.xs + 2)
                            .background(
                                Capsule()
                                    .fill(Theme.Colors.moodAccentBackground(for: entry.mood))
                            )

                        Spacer()

                        Text(entry.formattedTime)
                            .font(Theme.Typography.caption())
                            .foregroundColor(Theme.Colors.textTertiary)
                    }
                }
            }
            .padding(.horizontal, Theme.Spacing.lg)
        }
    }
}

// MARK: - Audio Playback View

struct AudioPlaybackView: View {
    @Binding var isPlaying: Bool
    @Binding var progress: Double

    var body: some View {
        VStack(spacing: Theme.Spacing.md) {
            // Waveform-style progress
            GeometryReader { geo in
                HStack(spacing: 2) {
                    ForEach(0..<30, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 1)
                            .fill(
                                Double(index) / 30.0 < progress
                                ? Theme.Colors.accent
                                : Theme.Colors.border
                            )
                            .frame(width: (geo.size.width - 58) / 30, height: CGFloat.random(in: 8...24))
                    }
                }
            }
            .frame(height: 24)

            // Controls
            HStack {
                Text("0:45")
                    .font(Theme.Typography.caption())
                    .foregroundColor(Theme.Colors.textTertiary)

                Spacer()

                Button(action: { isPlaying.toggle() }) {
                    AppIconImage(icon: isPlaying ? .pauseCircle : .playCircle, isSelected: true, size: 48)
                        .foregroundColor(Theme.Colors.accent)
                }
                .buttonStyle(.plain)

                Spacer()

                Text("1:30")
                    .font(Theme.Typography.caption())
                    .foregroundColor(Theme.Colors.textTertiary)
            }
        }
    }
}

// MARK: - Preview

#Preview("Today - Mood Selection") {
    let vm = JournalViewModel()
    vm.hasCompletedOnboarding = true
    vm.entries.removeAll { $0.isToday }
    return TodayView(viewModel: vm)
}

#Preview("Today - Starting Prompt") {
    let vm = JournalViewModel()
    vm.hasCompletedOnboarding = true
    vm.entries.removeAll { $0.isToday }
    vm.flowState = .startingPrompt
    return TodayView(viewModel: vm)
}

#Preview("Today - With Entry") {
    let vm = JournalViewModel()
    vm.hasCompletedOnboarding = true
    return TodayView(viewModel: vm)
}
