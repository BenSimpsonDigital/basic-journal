//
//  EntryDetailView.swift
//  Remin
//
//  One Thing - Daily Voice Journal
//  Full entry view with elegant playback and mood editing
//

import SwiftUI

struct EntryDetailView: View {
    let entry: Entry
    @ObservedObject var viewModel: JournalViewModel
    @Environment(\.dismiss) private var dismiss

    @State private var isPlaying = false
    @State private var playbackProgress: Double = 0.0
    @State private var selectedMood: Int
    @State private var showDeleteConfirmation = false

    init(entry: Entry, viewModel: JournalViewModel) {
        self.entry = entry
        self.viewModel = viewModel
        self._selectedMood = State(initialValue: entry.mood)
    }

    var body: some View {
        ZStack {
            // Background
            Theme.Colors.background
                .ignoresSafeArea()

            // Decorative gradient (responds to mood)
            GeometryReader { geo in
                GradientOrb(size: 250, opacity: 0.45, blur: 90, mood: selectedMood)
                    .offset(x: geo.size.width * 0.6, y: -80)
            }
            .animation(.easeInOut(duration: 0.6), value: selectedMood)
            .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: Theme.Spacing.xl) {
                    // Date header - elegant serif
                    VStack(spacing: Theme.Spacing.xs) {
                        Text(entry.relativeDateString)
                            .font(Theme.Typography.displayMedium())
                            .foregroundColor(Theme.Colors.textPrimary)

                        Text(entry.formattedTime)
                            .font(Theme.Typography.caption())
                            .foregroundColor(Theme.Colors.textTertiary)
                            .textCase(.uppercase)
                            .tracking(1)
                    }
                    .padding(.top, Theme.Spacing.lg)

                    // Audio player card
                    if entry.hasAudio {
                        DetailAudioPlayerCard(isPlaying: $isPlaying, progress: $playbackProgress)
                    }

                    // Transcript card
                    VStack(alignment: .leading, spacing: Theme.Spacing.md) {
                        HStack {
                            AppIconImage(icon: .documentText, isSelected: false, size: 14)
                            Text("Transcript")
                        }
                        .font(Theme.Typography.captionMedium())
                        .foregroundColor(Theme.Colors.textTertiary)

                        Text(entry.transcript)
                            .font(Theme.Typography.body())
                            .foregroundColor(Theme.Colors.textPrimary)
                            .lineSpacing(8)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(Theme.Spacing.lg)
                    .background(Theme.Colors.card)
                    .clipShape(RoundedRectangle(cornerRadius: Theme.Radius.large))
                    .shadow(color: .black.opacity(0.03), radius: 12, x: 0, y: 4)

                    // Mood selector
                    VStack(alignment: .leading, spacing: Theme.Spacing.md) {
                        HStack {
                            AppIconImage(icon: .heart, isSelected: false, size: 14)
                            Text("Mood")
                        }
                        .font(Theme.Typography.captionMedium())
                        .foregroundColor(Theme.Colors.textTertiary)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: Theme.Spacing.md) {
                                ForEach(0..<5) { index in
                                    MoodPill(
                                        index: index,
                                        isSelected: selectedMood == index,
                                        action: {
                                            selectedMood = index
                                            viewModel.updateMood(for: entry, to: index)
                                        }
                                    )
                                }
                            }
                            .padding(.vertical, Theme.Spacing.sm)
                        }
                    }
                    .padding(.top, Theme.Spacing.sm)

                    Spacer(minLength: Theme.Spacing.xxl)

                    // Delete button
                    Button(action: {
                        showDeleteConfirmation = true
                    }) {
                        HStack(spacing: Theme.Spacing.sm) {
                            AppIconImage(icon: .trash, isSelected: false, size: 14)
                            Text("Delete Entry")
                        }
                        .font(Theme.Typography.caption())
                        .foregroundColor(.red.opacity(0.7))
                    }
                    .padding(.bottom, Theme.Spacing.xxl)
                }
                .padding(.horizontal, Theme.Spacing.lg)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .confirmationDialog(
            "Delete this entry?",
            isPresented: $showDeleteConfirmation,
            titleVisibility: .visible
        ) {
            Button("Delete", role: .destructive) {
                viewModel.deleteEntry(entry)
                dismiss()
            }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("This action cannot be undone.")
        }
    }
}

// MARK: - Detail Audio Player Card

struct DetailAudioPlayerCard: View {
    @Binding var isPlaying: Bool
    @Binding var progress: Double

    var body: some View {
        VStack(spacing: Theme.Spacing.lg) {
            // Waveform visualization
            GeometryReader { geo in
                HStack(spacing: 3) {
                    ForEach(0..<35, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 2)
                            .fill(
                                Double(index) / 35.0 < progress
                                ? Theme.Colors.accent
                                : Theme.Colors.accentSoft.opacity(0.5)
                            )
                            .frame(
                                width: (geo.size.width - 102) / 35,
                                height: waveformHeight(for: index)
                            )
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .frame(height: 36)

            // Progress bar
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(Theme.Colors.accentSoft.opacity(0.3))
                        .frame(height: 4)

                    Capsule()
                        .fill(Theme.Colors.accent)
                        .frame(width: geo.size.width * progress, height: 4)
                }
            }
            .frame(height: 4)

            // Controls
            HStack {
                Text("0:00")
                    .font(Theme.Typography.caption())
                    .foregroundColor(Theme.Colors.textTertiary)
                    .frame(width: 40, alignment: .leading)

                Spacer()

                // Skip back
                Button(action: { progress = max(0, progress - 0.1) }) {
                    Image(systemName: "gobackward.15")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(Theme.Colors.textSecondary)
                }

                Spacer()

                // Play/Pause
                Button(action: { isPlaying.toggle() }) {
                    ZStack {
                        Circle()
                            .fill(Theme.Colors.accent)
                            .frame(width: 56, height: 56)

                        AppIconImage(icon: isPlaying ? .pause : .play, isSelected: true, size: 20)
                            .foregroundColor(.white)
                            .offset(x: isPlaying ? 0 : 2)
                    }
                }
                .buttonStyle(.plain)

                Spacer()

                // Skip forward
                Button(action: { progress = min(1, progress + 0.1) }) {
                    Image(systemName: "goforward.15")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(Theme.Colors.textSecondary)
                }

                Spacer()

                Text("1:30")
                    .font(Theme.Typography.caption())
                    .foregroundColor(Theme.Colors.textTertiary)
                    .frame(width: 40, alignment: .trailing)
            }
        }
        .padding(Theme.Spacing.lg)
        .background(Theme.Colors.card)
        .clipShape(RoundedRectangle(cornerRadius: Theme.Radius.large))
        .shadow(color: .black.opacity(0.04), radius: 12, x: 0, y: 4)
    }

    private func waveformHeight(for index: Int) -> CGFloat {
        // Create a wave-like pattern
        let pattern: [CGFloat] = [12, 18, 24, 32, 28, 20, 14, 22, 30, 26, 16, 12, 20, 28, 24]
        return pattern[index % pattern.count]
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        EntryDetailView(
            entry: Entry.generateMockEntries().first!,
            viewModel: JournalViewModel()
        )
    }
}
