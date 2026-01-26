//
//  TodayView.swift
//  BasicJournal
//
//  One Thing - Daily Voice Journal
//  Redesigned with warm, minimal aesthetic inspired by modern wellness apps
//

import SwiftUI

struct TodayView: View {
    @ObservedObject var viewModel: JournalViewModel
    @State private var animateBackground = false

    var body: some View {
        NavigationStack {
            ZStack {
                // Warm cream background
                Theme.Colors.background
                    .ignoresSafeArea()

                // State for background animation
                Color.clear
                    .onAppear { animateBackground = true }



                // Decorative gradient orbs
                // Decorative gradient orbs with breathing animation
                GeometryReader { geo in
                    // Top right - warm
                    GradientOrb(size: 350, opacity: 0.35, blur: 90)
                        .offset(x: geo.size.width * 0.5, y: -80)
                        .scaleEffect(animateBackground ? 1.1 : 1.0)
                        .animation(.easeInOut(duration: 8).repeatForever(autoreverses: true), value: animateBackground)

                    // Bottom left - cool
                    GradientOrb(size: 300, opacity: 0.3, blur: 80)
                        .offset(x: -80, y: geo.size.height * 0.55)
                        .scaleEffect(animateBackground ? 1.15 : 1.0)
                        .animation(.easeInOut(duration: 7).repeatForever(autoreverses: true).delay(1), value: animateBackground)

                    // Center floating - soft
                    GradientOrb(size: 200, opacity: 0.2, blur: 60)
                        .offset(x: geo.size.width * 0.2, y: geo.size.height * 0.3)
                        .scaleEffect(animateBackground ? 1.2 : 0.9)
                        .animation(.easeInOut(duration: 10).repeatForever(autoreverses: true).delay(2), value: animateBackground)
                }
                .onAppear {
                    animateBackground = true
                }
                .ignoresSafeArea()

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
                            TodayRecordingView(viewModel: viewModel)
                        }

                        Spacer(minLength: 120)
                    }
                    .padding(.horizontal, Theme.Spacing.lg)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
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


    var body: some View {
        ZStack {
            switch viewModel.flowState {
            case .selectMood:
                MoodSelectionStepView(viewModel: viewModel)
                    .transition(.asymmetric(
                        insertion: .move(edge: .leading).combined(with: .opacity),
                        removal: .move(edge: .leading).combined(with: .opacity)
                    ))

            case .recordPrompt:
                RecordPromptStepView(viewModel: viewModel)
                    .transition(.asymmetric(
                        insertion: .move(edge: .trailing).combined(with: .opacity),
                        removal: .move(edge: .trailing).combined(with: .opacity)
                    ))

            case .recording:
                RecordingStateView(viewModel: viewModel)
                    .transition(.opacity)

            case .saved:
                SimpleSavedStateView(viewModel: viewModel)
                    .transition(.opacity.combined(with: .scale(scale: 0.9)))
            }
        }
        .animation(.spring(response: 0.5, dampingFraction: 0.8), value: viewModel.flowState)
    }
}

// MARK: - Step 1: Mood Selection

struct MoodSelectionStepView: View {
    @ObservedObject var viewModel: JournalViewModel
    @State private var hasAppeared = false

    var body: some View {
        VStack(spacing: Theme.Spacing.lg) {
            Spacer()

            // Main question - serif typography
            Text("How are you\nfeeling today?")
                .font(Theme.Typography.displayLarge())
                .foregroundColor(Theme.Colors.textPrimary)
                .multilineTextAlignment(.center)
                .lineSpacing(4)

            // Horizontal mood selector with centering
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: Theme.Spacing.lg) {
                        ForEach(0..<5) { index in
                            MoodPill(
                                index: index,
                                isSelected: viewModel.selectedMood == index,
                                action: {
                                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                                        viewModel.selectedMood = index
                                    }
                                }
                            )
                            .id(index)
                        }
                    }
                    .padding(.horizontal, Theme.Spacing.xxl)
                    .padding(.top, Theme.Spacing.md)
                    .padding(.bottom, Theme.Spacing.xl)
                }
                .onAppear {
                    // Center on "Okay" mood (index 2) when first appearing
                    if !hasAppeared {
                        hasAppeared = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                proxy.scrollTo(2, anchor: .center)
                            }
                        }
                    }
                }
                .onChange(of: viewModel.selectedMood) { _, newValue in
                    if let selected = newValue {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                            proxy.scrollTo(selected, anchor: .center)
                        }
                    }
                }
            }


            // Next button (appears when mood selected)
            if viewModel.selectedMood != nil {
                Button("Next") {
                    viewModel.advanceToRecordPrompt()
                }
                .buttonStyle(PillButtonStyle())
                .transition(.opacity.combined(with: .move(edge: .bottom)))
            }

            Spacer()
        }
        .animation(.spring(response: 0.3), value: viewModel.selectedMood != nil)
    }
}

// MARK: - Step 2: Record Prompt

struct RecordPromptStepView: View {
    @ObservedObject var viewModel: JournalViewModel


    var body: some View {
        ZStack(alignment: .topLeading) {
            // Main Content
            VStack(spacing: 0) {
                Spacer()
                
                // New prompt heading - centered
                VStack(spacing: Theme.Spacing.md) {
                    Text(viewModel.dailyPrompt)
                        .font(Theme.Typography.displayLarge())
                        .foregroundColor(Theme.Colors.textPrimary)
                        .multilineTextAlignment(.center)
                        .lineSpacing(4)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.horizontal, Theme.Spacing.lg)

                Spacer()
                    .frame(height: Theme.Spacing.xl)

                // Gradient orb decoration
                AnimatedGradientOrb(size: 160)
                    .padding(.vertical, Theme.Spacing.lg)

                Spacer()
                    .frame(height: Theme.Spacing.xl)

                // Voice input pill button
                VoiceInputPill(isRecording: false) {
                    viewModel.startRecording()
                }

                // Subtle hint
                Text("Tap to start recording")
                    .font(Theme.Typography.caption())
                    .foregroundColor(Theme.Colors.textTertiary)
                    .padding(.top, Theme.Spacing.md)
                
                Spacer()
                // Back button - pinned top-left via ZStack
                Button(action: { viewModel.goBackToMoodSelection() }) {
                    HStack(spacing: Theme.Spacing.xs) {
                        AppIconImage(icon: .chevronLeft, size: 16)
                        Text("Back")
                    }
                    .foregroundColor(Theme.Colors.textSecondary)
                    .padding(.horizontal, Theme.Spacing.md)
                    .padding(.vertical, Theme.Spacing.xxl)
                    .background(Theme.Colors.background.opacity(0.01)) // Touch target
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

           
            .padding(.top, Theme.Spacing.sm)
        }
    }
}

// MARK: - Recording State (Active recording)

struct RecordingStateView: View {
    @ObservedObject var viewModel: JournalViewModel
    @State private var pulseAnimation = false

    var body: some View {
        VStack(spacing: Theme.Spacing.xl) {
            // Recording label
            Text("Recording")
                .font(Theme.Typography.subheadline())
                .foregroundColor(Theme.Colors.textSecondary)
                .textCase(.uppercase)
                .tracking(1.5)

            // Timer display
            Text(viewModel.formattedRecordingTime())
                .font(Theme.Typography.timer())
                .foregroundColor(Theme.Colors.textPrimary)
                .monospacedDigit()

            // Animated waveform visualization
            WaveformVisualization()
                .frame(height: 60)
                .padding(.vertical, Theme.Spacing.md)

            // Pulsing recording indicator
            ZStack {
                // Pulse rings
                Circle()
                    .stroke(Theme.Colors.accent.opacity(0.2), lineWidth: 2)
                    .frame(width: 100, height: 100)
                    .scaleEffect(pulseAnimation ? 1.3 : 1.0)
                    .opacity(pulseAnimation ? 0 : 0.5)

                Circle()
                    .stroke(Theme.Colors.accent.opacity(0.15), lineWidth: 2)
                    .frame(width: 100, height: 100)
                    .scaleEffect(pulseAnimation ? 1.6 : 1.0)
                    .opacity(pulseAnimation ? 0 : 0.3)

                // Stop button
                Button(action: {
                    viewModel.stopRecording()
                }) {
                    ZStack {
                        Circle()
                            .fill(Theme.Colors.accent)
                            .frame(width: 80, height: 80)

                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color.white)
                            .frame(width: 24, height: 24)
                    }
                }
                .buttonStyle(.plain)
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: false)) {
                    pulseAnimation = true
                }
            }

            Text("Tap to stop")
                .font(Theme.Typography.caption())
                .foregroundColor(Theme.Colors.textTertiary)
        }
    }
}

// MARK: - Waveform Visualization

struct WaveformVisualization: View {
    @State private var animate = false

    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<12, id: \.self) { index in
                RoundedRectangle(cornerRadius: 2)
                    .fill(
                        LinearGradient(
                            colors: [
                                Theme.Colors.accentSoft,
                                Theme.Colors.accent.opacity(0.6)
                            ],
                            startPoint: .bottom,
                            endPoint: .top
                        )
                    )
                    .frame(width: 4, height: barHeight(for: index))
                    .animation(
                        .easeInOut(duration: 0.4 + Double(index % 3) * 0.1)
                        .repeatForever(autoreverses: true)
                        .delay(Double(index) * 0.05),
                        value: animate
                    )
            }
        }
        .onAppear { animate = true }
    }

    private func barHeight(for index: Int) -> CGFloat {
        let baseHeight: CGFloat = 20
        let variation: CGFloat = animate ? CGFloat.random(in: 15...40) : 20
        return variation
    }
}

// MARK: - Saved State (Simplified - mood already selected in Step 1)

struct SimpleSavedStateView: View {
    @ObservedObject var viewModel: JournalViewModel

    var body: some View {
        VStack(spacing: Theme.Spacing.xl) {
            // Success indicator
            ZStack {
                Circle()
                    .fill(Theme.Colors.accentSoft.opacity(0.3))
                    .frame(width: 100, height: 100)

                AppIconImage(icon: .check, isSelected: true, size: 40)
                    .foregroundColor(Theme.Colors.accent)
            }

            Text("Saved")
                .font(Theme.Typography.displaySmall())
                .foregroundColor(Theme.Colors.textPrimary)

            // Done button
            Button("Done") {
                viewModel.completeEntry()
            }
            .buttonStyle(PillButtonStyle())
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
                        .background(Theme.Colors.textTertiary.opacity(0.2))

                    // Transcript
                    Text(entry.transcript)
                        .font(Theme.Typography.body())
                        .foregroundColor(Theme.Colors.textPrimary)
                        .lineSpacing(6)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    // Mood and time
                    HStack {
                        // Mood indicator
                        HStack(spacing: Theme.Spacing.sm) {
                            AppIconImage(icon: entry.moodAppIcon, isSelected: true, size: 16)
                            Text(entry.moodLabel)
                                .font(Theme.Typography.caption())
                        }
                        .foregroundColor(Theme.Colors.textSecondary)
                        .padding(.horizontal, Theme.Spacing.md)
                        .padding(.vertical, Theme.Spacing.sm)
                        .background(Theme.Colors.accentSoft.opacity(0.2))
                        .clipShape(Capsule())

                        Spacer()

                        Text(entry.formattedTime)
                            .font(Theme.Typography.caption())
                            .foregroundColor(Theme.Colors.textTertiary)
                    }
                }
            }
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
                                : Theme.Colors.accentSoft.opacity(0.4)
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
    // Remove today's entry to show mood selection state
    vm.entries.removeAll { $0.isToday }
    return TodayView(viewModel: vm)
}

#Preview("Today - Record Prompt") {
    let vm = JournalViewModel()
    vm.hasCompletedOnboarding = true
    vm.entries.removeAll { $0.isToday }
    vm.selectedMood = 3
    vm.flowState = .recordPrompt
    return TodayView(viewModel: vm)
}

#Preview("Today - With Entry") {
    let vm = JournalViewModel()
    vm.hasCompletedOnboarding = true
    return TodayView(viewModel: vm)
}
