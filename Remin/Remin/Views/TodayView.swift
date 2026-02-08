//
//  TodayView.swift
//  Remin
//
//  One Thing - Daily Voice Journal
//  Daily greeting flow with direct recording
//

import SwiftUI

struct TodayView: View {
    @ObservedObject var viewModel: JournalViewModel
    @State private var showDiscardConfirmation = false

    private let calendar = Calendar.current

    private var isPendingDateToday: Bool {
        calendar.isDateInToday(viewModel.pendingEntryDate)
    }

    private var shouldPresentFlow: Bool {
        if viewModel.flowState == .startingPrompt || viewModel.flowState == .recording || viewModel.flowState == .saved {
            return true
        }

        if viewModel.todayEntry == nil {
            return true
        }

        return viewModel.flowState == .recordPrompt && !isPendingDateToday
    }

    private var referenceDate: Date {
        if shouldPresentFlow && !isPendingDateToday {
            return viewModel.pendingEntryDate
        }

        return Date()
    }

    var body: some View {
        ZStack {
            Theme.Colors.background
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: Theme.Spacing.xl) {
                    ScreenHeaderView(
                        title: formattedDate(for: referenceDate),
                        subtitle: formattedWeekday(for: referenceDate),
                        alignment: .center
                    )
                    .padding(.top, Theme.Spacing.md)

                    if shouldPresentFlow {
                        TodayRecordingView(viewModel: viewModel)
                    } else if let todayEntry = viewModel.todayEntry {
                        TodayEntryCardView(entry: todayEntry)
                    }
                }
            }
            .safeAreaInset(edge: .bottom) {
                if shouldPresentFlow {
                    todayDock
                }
            }
        }
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

    // MARK: - Bottom Dock

    @ViewBuilder
    private var todayDock: some View {
        switch viewModel.flowState {
        case .startingPrompt:
            BottomActionDock {
                Button("Continue") {
                    viewModel.beginJournalingFromPrompt()
                }
                .buttonStyle(PrimaryDockButtonStyle())
            } secondary: {
                Button("Later") {
                    viewModel.dismissStartingPrompt()
                }
                .buttonStyle(SecondaryDockButtonStyle())
            }

        case .recordPrompt:
            BottomActionDock {
                Button("Start recording") {
                    viewModel.startRecording()
                }
                .buttonStyle(PrimaryDockButtonStyle())
            }

        case .recording:
            BottomActionDock {
                Button("Stop & try again") {
                    viewModel.cancelRecording()
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

    private func formattedWeekday(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: date)
    }

    private func formattedDate(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM"
        return formatter.string(from: date)
    }
}

// MARK: - Recording View (Main interaction area)

struct TodayRecordingView: View {
    @ObservedObject var viewModel: JournalViewModel

    var body: some View {
        ZStack {
            switch viewModel.flowState {
            case .startingPrompt:
                StartingPromptView(viewModel: viewModel)
                    .transition(.opacity)

            case .recordPrompt:
                RecordPromptStepView(viewModel: viewModel)
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

    private var greeting: String {
        let hour = Calendar.current.component(.hour, from: Date())

        switch hour {
        case 5..<12:
            return "Good morning"
        case 12..<17:
            return "Good afternoon"
        default:
            return "Good evening"
        }
    }

    private var greetingLine: String {
        let name = viewModel.userName.trimmingCharacters(in: .whitespacesAndNewlines)
        return name.isEmpty ? "\(greeting)." : "\(greeting), \(name)."
    }

    var body: some View {
        VStack(spacing: Theme.Spacing.xl) {
            Spacer()

            VStack(spacing: Theme.Spacing.lg) {
                Text(greetingLine)
                    .font(Theme.Typography.displayLarge())
                    .foregroundColor(Theme.Colors.textPrimary)
                    .multilineTextAlignment(.center)

                VStack(spacing: Theme.Spacing.md) {
                    Text("Suggested prompt")
                        .font(Theme.Typography.captionMedium())
                        .foregroundColor(Theme.Colors.textTertiary)
                        .textCase(.uppercase)
                        .tracking(1.2)

                    Text(viewModel.dailyPrompt)
                        .font(Theme.Typography.displaySmall())
                        .foregroundColor(Theme.Colors.textPrimary)
                        .multilineTextAlignment(.center)
                        .lineSpacing(4)
                }
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

// MARK: - Record Prompt

struct RecordPromptStepView: View {
    @ObservedObject var viewModel: JournalViewModel

    private var isToday: Bool {
        Calendar.current.isDateInToday(viewModel.pendingEntryDate)
    }

    private var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: viewModel.pendingEntryDate)
    }

    var body: some View {
        VStack(spacing: Theme.Spacing.md) {
            Spacer()

            Text("Ready to record")
                .font(Theme.Typography.displayLarge())
                .foregroundColor(Theme.Colors.textPrimary)
                .multilineTextAlignment(.center)

            Text(isToday ? "Capture today's note when you're ready." : "Recording for \(formattedDate)")
                .font(Theme.Typography.body())
                .foregroundColor(Theme.Colors.textSecondary)
                .multilineTextAlignment(.center)

            Spacer()
        }
        .padding(.horizontal, Theme.Spacing.lg)
    }
}

// MARK: - Recording State

struct RecordingStateView: View {
    @ObservedObject var viewModel: JournalViewModel

    var body: some View {
        VStack(spacing: Theme.Spacing.xl) {
            Spacer()

            BreathingCircle(size: 160, color: Theme.Colors.accent)

            Text(viewModel.formattedRecordingTime())
                .font(Theme.Typography.timer())
                .foregroundColor(Theme.Colors.textPrimary)
                .monospacedDigit()

            Text("Recording")
                .font(Theme.Typography.captionMedium())
                .foregroundColor(Theme.Colors.textSecondary)
                .textCase(.uppercase)
                .tracking(1.2)

            Spacer()

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
        viewModel.entry(for: viewModel.pendingEntryDate)
    }

    var body: some View {
        VStack(spacing: Theme.Spacing.lg) {
            Text("Saved")
                .font(Theme.Typography.displaySmall())
                .foregroundColor(Theme.Colors.textPrimary)

            SoftCard {
                VStack(spacing: Theme.Spacing.lg) {
                    AudioPlaybackView(isPlaying: $isPlaying, progress: $playbackProgress)

                    Divider()
                        .foregroundColor(Theme.Colors.border)

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

                        HStack {
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
    @State private var isPlaying = false
    @State private var playbackProgress: Double = 0.3

    var body: some View {
        VStack(spacing: Theme.Spacing.lg) {
            HStack(spacing: Theme.Spacing.sm) {
                AppIconImage(icon: .checkCircle, isSelected: true, size: 18)
                    .foregroundColor(Theme.Colors.accent)
                Text("Today's reflection")
                    .font(Theme.Typography.captionMedium())
                    .foregroundColor(Theme.Colors.textSecondary)
            }

            SoftCard {
                VStack(spacing: Theme.Spacing.lg) {
                    AudioPlaybackView(isPlaying: $isPlaying, progress: $playbackProgress)

                    Divider()
                        .foregroundColor(Theme.Colors.border)

                    Text(entry.transcript)
                        .font(Theme.Typography.body())
                        .foregroundColor(Theme.Colors.textPrimary)
                        .lineSpacing(6)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    HStack {
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

#Preview("Today - Starting Prompt") {
    let vm = JournalViewModel()
    vm.hasCompletedOnboarding = true
    vm.entries.removeAll { $0.isToday }
    vm.flowState = .startingPrompt
    return TodayView(viewModel: vm)
}

#Preview("Today - Ready To Record") {
    let vm = JournalViewModel()
    vm.hasCompletedOnboarding = true
    vm.entries.removeAll { $0.isToday }
    vm.flowState = .recordPrompt
    return TodayView(viewModel: vm)
}

#Preview("Today - With Entry") {
    let vm = JournalViewModel()
    vm.hasCompletedOnboarding = true
    return TodayView(viewModel: vm)
}
