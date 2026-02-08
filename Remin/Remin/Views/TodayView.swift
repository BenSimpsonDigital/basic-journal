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
    @State private var hasStartingDockAppeared = false

    private let calendar = Calendar.current

    private var isPendingDateToday: Bool {
        calendar.isDateInToday(viewModel.pendingEntryDate)
    }

    private var shouldPresentFlow: Bool {
        if viewModel.flowState == .startingPrompt || viewModel.flowState == .recording || viewModel.flowState == .preview {
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

    private var isTodayStartingPrompt: Bool {
        viewModel.flowState == .startingPrompt && isPendingDateToday
    }

    private var shouldShowDock: Bool {
        viewModel.flowState == .startingPrompt || viewModel.flowState == .preview
    }

    private var isRecordingScreen: Bool {
        viewModel.flowState == .recordPrompt || viewModel.flowState == .recording
    }

    var body: some View {
        ZStack {
            Theme.Colors.background
                .ignoresSafeArea()

            TodayBottomGradientView()

            ScrollView(showsIndicators: false) {
                VStack(spacing: isTodayStartingPrompt ? Theme.Spacing.lg : Theme.Spacing.xl) {
                    if !isTodayStartingPrompt && !isRecordingScreen {
                        ScreenHeaderView(
                            title: formattedDate(for: referenceDate),
                            subtitle: formattedWeekday(for: referenceDate),
                            alignment: .center
                        )
                        .padding(.top, Theme.Spacing.md)
                    }

                    if shouldPresentFlow {
                        TodayRecordingView(viewModel: viewModel)
                    } else if let todayEntry = viewModel.todayEntry {
                        TodayEntryCardView(entry: todayEntry)
                    }
                }
            }
        }
        .onAppear {
            if isTodayStartingPrompt {
                triggerStartingDockAnimation()
            }
        }
        .onChange(of: isTodayStartingPrompt) { _, isStartingPrompt in
            if isStartingPrompt {
                triggerStartingDockAnimation()
            } else {
                hasStartingDockAppeared = false
            }
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            if shouldPresentFlow && shouldShowDock {
                todayDock
                    .zIndex(1)
            }
        }
        .confirmationDialog(
            "Delete this recording and try again?",
            isPresented: $showDiscardConfirmation,
            titleVisibility: .visible
        ) {
            Button("Delete and try again", role: .destructive) {
                UINotificationFeedbackGenerator().notificationOccurred(.warning)
                viewModel.tryAgainFromPreview()
            }
            Button("Keep Preview", role: .cancel) { }
        }
    }

    // MARK: - Bottom Dock

    @ViewBuilder
    private var todayDock: some View {
        switch viewModel.flowState {
        case .startingPrompt:
            BottomActionDock {
                VStack(spacing: Theme.Spacing.lg) {
                    Button("I'm Ready") {
                        viewModel.beginJournalingFromPrompt()
                    }
                    .buttonStyle(PrimaryDockButtonStyle())
                    .opacity(hasStartingDockAppeared ? 1.0 : 0.0)
                    .offset(y: hasStartingDockAppeared ? 0 : 14)
                    .animation(.easeOut(duration: 0.45).delay(0.24), value: hasStartingDockAppeared)
                }
            } secondary: {
                Button("Later") {
                    viewModel.dismissStartingPrompt()
                }
                .buttonStyle(SecondaryDockButtonStyle())
                .opacity(hasStartingDockAppeared ? 1.0 : 0.0)
                .offset(y: hasStartingDockAppeared ? 0 : 14)
                .animation(.easeOut(duration: 0.45).delay(0.32), value: hasStartingDockAppeared)
            }

        case .recordPrompt:
            EmptyView()

        case .recording:
            EmptyView()

        case .preview:
            BottomActionDock {
                Button("Save Entry") {
                    viewModel.confirmPreviewEntrySave()
                }
                .buttonStyle(PrimaryDockButtonStyle())
            } secondary: {
                Button("Try Again") {
                    showDiscardConfirmation = true
                }
                .buttonStyle(SecondaryDockButtonStyle())
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

    private func triggerStartingDockAnimation() {
        hasStartingDockAppeared = false
        DispatchQueue.main.async {
            hasStartingDockAppeared = true
        }
    }
}

private struct TodayBottomGradientView: View {
    @State private var isDrifting = false

    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            let height = proxy.size.height
            let bottomBandHeight = max(320, height * 0.62)

            ZStack(alignment: .bottom) {
                // Base warm wash so the gradient continuously fills the full bottom area.
                LinearGradient(
                    stops: [
                        .init(color: Color(red: 1.00, green: 0.94, blue: 0.88).opacity(0.00), location: 0.00),
                        .init(color: Color(red: 1.00, green: 0.91, blue: 0.79).opacity(0.10), location: 0.62),
                        .init(color: Color(red: 1.00, green: 0.85, blue: 0.73).opacity(0.18), location: 1.00)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(width: width * 1.05, height: bottomBandHeight + 80)
                .offset(y: 30)

                Circle()
                    .fill(Color(red: 1.00, green: 0.90, blue: 0.42).opacity(0.20))
                    .frame(width: width * 0.95, height: width * 0.95)
                    .offset(
                        x: isDrifting ? -22 : -8,
                        y: isDrifting ? 86 : 72
                    )
                    .blur(radius: 56)

                Circle()
                    .fill(Color(red: 1.00, green: 0.74, blue: 0.73).opacity(0.18))
                    .frame(width: width * 1.05, height: width * 1.05)
                    .offset(
                        x: isDrifting ? 26 : 12,
                        y: isDrifting ? 82 : 66
                    )
                    .blur(radius: 58)

                Circle()
                    .fill(Color(red: 1.00, green: 0.82, blue: 0.68).opacity(0.08))
                    .frame(width: width * 0.75, height: width * 0.75)
                    .offset(
                        x: isDrifting ? 2 : -2,
                        y: isDrifting ? 72 : 62
                    )
                    .blur(radius: 44)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .mask(
                LinearGradient(
                    stops: [
                        .init(color: .clear, location: 0.00),
                        .init(color: .clear, location: 0.34),
                        .init(color: .black.opacity(0.82), location: 0.66),
                        .init(color: .black, location: 1.00)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
        .allowsHitTesting(false)
        .ignoresSafeArea(edges: [.bottom, .horizontal])
        .onAppear {
            guard !isDrifting else { return }
            withAnimation(
                .easeInOut(duration: 17.0)
                .repeatForever(autoreverses: true)
            ) {
                isDrifting = true
            }
        }
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

            case .recordPrompt, .recording:
                RecordingStateView(viewModel: viewModel)
                    .transition(.opacity)

            case .preview:
                PreviewStateView(viewModel: viewModel)
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

    private var compactDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d"
        return formatter.string(from: viewModel.pendingEntryDate).uppercased()
    }

    private var minimumCenteredHeight: CGFloat {
        max(420, UIScreen.main.bounds.height - 220)
    }

    var body: some View {
        VStack(spacing: 0) {
            Spacer(minLength: 0)

            VStack(spacing: Theme.Spacing.md) {
                Text(compactDate)
                    .font(Theme.Typography.bodySmall())
                    .foregroundColor(Theme.Colors.textTertiary)
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
                    .fixedSize(horizontal: true, vertical: false)
                    .opacity(hasAppeared ? 1.0 : 0.0)
                    .offset(y: hasAppeared ? 0 : 10)
                    .animation(.easeOut(duration: 0.45).delay(0.05), value: hasAppeared)

                VStack(spacing: Theme.Spacing.lg) {
                    Text(greetingLine)
                        .font(Theme.Typography.displayXL())
                        .foregroundColor(Theme.Colors.textPrimary)
                        .multilineTextAlignment(.center)
                        .opacity(hasAppeared ? 1.0 : 0.0)
                        .offset(y: hasAppeared ? 0 : 12)
                        .animation(.easeOut(duration: 0.5).delay(0.12), value: hasAppeared)

                    Text("Ready to record today's entry?")
                        .font(Theme.Typography.bodySmall())
                        .foregroundColor(Theme.Colors.textSecondary)
                        .multilineTextAlignment(.center)
                        .padding(.top, Theme.Spacing.sm)
                        .opacity(hasAppeared ? 1.0 : 0.0)
                        .offset(y: hasAppeared ? 0 : 14)
                        .animation(.easeOut(duration: 0.5).delay(0.2), value: hasAppeared)
                }
            }
            .frame(maxWidth: .infinity)
            .lineSpacing(2)

            Spacer(minLength: 0)
        }
        .frame(maxWidth: .infinity, minHeight: minimumCenteredHeight)
        .padding(.horizontal, Theme.Spacing.lg)
        .onAppear {
            hasAppeared = false
            DispatchQueue.main.async {
                hasAppeared = true
            }
        }
        .onDisappear {
            hasAppeared = false
        }
    }
}

// MARK: - Recording State

struct RecordingStateView: View {
    @ObservedObject var viewModel: JournalViewModel

    private var isRecording: Bool {
        viewModel.flowState == .recording
    }

    private var compactDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d"
        return formatter.string(from: viewModel.pendingEntryDate).uppercased()
    }

    private var statusTitle: String {
        isRecording ? "Recording in progress" : "Ready to record"
    }

    var body: some View {
        VStack(spacing: Theme.Spacing.lg) {
            Text(compactDate)
                .font(Theme.Typography.bodySmall())
                .foregroundColor(Theme.Colors.textTertiary)
                .tracking(1.2)
                .padding(.top, Theme.Spacing.lg)

            Text(statusTitle)
                .font(Theme.Typography.displaySmall())
                .foregroundColor(Theme.Colors.textPrimary)
                .multilineTextAlignment(.center)

            Spacer(minLength: Theme.Spacing.xl)

            RecordingBlobView(isRecording: isRecording, micLevel: viewModel.recordingInputLevel)

            if isRecording {
                Text(viewModel.formattedRecordingTime())
                    .font(Theme.Typography.timer())
                    .foregroundColor(Theme.Colors.textPrimary)
                    .monospacedDigit()
            }

            Button(action: {
                UINotificationFeedbackGenerator().notificationOccurred(.success)
                if isRecording {
                    viewModel.stopRecording()
                } else {
                    viewModel.startRecording()
                }
            }) {
                ZStack {
                    Circle()
                        .fill(Theme.Colors.textPrimary)
                        .frame(width: 72, height: 72)
                        .shadow(color: Color.black.opacity(0.08), radius: 12, y: 6)

                    if isRecording {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.white)
                            .frame(width: 18, height: 18)
                    } else {
                        AppIconImage(icon: .play, isSelected: true, size: 22)
                            .foregroundColor(.white)
                            .offset(x: 1)
                    }
                }
            }
            .buttonStyle(.plain)
            .accessibilityLabel(isRecording ? "Stop recording" : "Start recording")

            Text(isRecording ? "Tap to Stop" : "Tap to Start")
                .font(Theme.Typography.caption())
                .foregroundColor(Theme.Colors.textTertiary)

            Spacer(minLength: Theme.Spacing.xxl)
        }
        .padding(.horizontal, Theme.Spacing.lg)
        .frame(maxWidth: .infinity, minHeight: 520)
    }
}

// MARK: - Preview State

struct PreviewStateView: View {
    @ObservedObject var viewModel: JournalViewModel
    @State private var isPlaying = false
    @State private var playbackProgress: Double = 0.0
    @State private var showFullTranscript = false

    private var previewEntry: Entry? {
        viewModel.previewEntryDraft
    }

    var body: some View {
        VStack(spacing: Theme.Spacing.lg) {
            Text("Preview")
                .font(Theme.Typography.displaySmall())
                .foregroundColor(Theme.Colors.textPrimary)

            SoftCard {
                VStack(spacing: Theme.Spacing.lg) {
                    AudioPlaybackView(isPlaying: $isPlaying, progress: $playbackProgress)

                    Divider()
                        .foregroundColor(Theme.Colors.border)

                    if let entry = previewEntry {
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
                                .foregroundColor(Theme.Colors.textPrimary)
                            }
                        }

                        Text("Transcript updates while you review")
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
                        Text("Preparing your preview...")
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
                        .foregroundColor(Theme.Colors.textPrimary)
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

#Preview("Today - Preview State") {
    let vm = JournalViewModel()
    vm.hasCompletedOnboarding = true
    vm.entries.removeAll()
    vm.pendingEntryDate = Date()
    vm.flowState = .preview
    vm.previewEntryDraft = Entry(
        date: Date(),
        transcript: "Preview transcript text appears here before saving.",
        hasAudio: true
    )
    return TodayView(viewModel: vm)
}
