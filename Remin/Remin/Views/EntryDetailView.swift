//
//  EntryDetailView.swift
//  Remin
//
//  One Thing - Daily Voice Journal
//  Clean entry detail with border-based cards
//

import SwiftUI

struct EntryDetailView: View {
    let entry: Entry
    @ObservedObject var viewModel: JournalViewModel
    @Environment(\.dismiss) private var dismiss

    @State private var isPlaying = false
    @State private var playbackProgress: Double = 0.0
    @State private var showDeleteConfirmation = false

    var body: some View {
        ZStack {
            Theme.Colors.background
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: Theme.Spacing.xl) {
                    // Date header
                    VStack(spacing: Theme.Spacing.xs) {
                        Text(entry.relativeDateString)
                            .font(Theme.Typography.displayMedium())
                            .foregroundColor(Theme.Colors.textPrimary)

                        Text(entry.formattedTime)
                            .font(Theme.Typography.caption())
                            .foregroundColor(Theme.Colors.textTertiary)
                            .textCase(.uppercase)
                            .tracking(1.2)
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
                            .lineSpacing(6)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(Theme.Spacing.lg)
                    .background(Theme.Colors.card)
                    .clipShape(RoundedRectangle(cornerRadius: Theme.Radius.large))
                    .overlay(
                        RoundedRectangle(cornerRadius: Theme.Radius.large)
                            .strokeBorder(Theme.Colors.border, lineWidth: 1)
                    )

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
                                : Theme.Colors.border
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
                        .fill(Theme.Colors.border)
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

                Button(action: { progress = max(0, progress - 0.1) }) {
                    Image(systemName: "gobackward.15")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(Theme.Colors.textSecondary)
                }

                Spacer()

                Button(action: { isPlaying.toggle() }) {
                    ZStack {
                        Circle()
                            .fill(Theme.Colors.textPrimary)
                            .frame(width: 56, height: 56)

                        AppIconImage(icon: isPlaying ? .pause : .play, isSelected: true, size: 20)
                            .foregroundColor(.white)
                            .offset(x: isPlaying ? 0 : 2)
                    }
                }
                .buttonStyle(.plain)

                Spacer()

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
        .overlay(
            RoundedRectangle(cornerRadius: Theme.Radius.large)
                .strokeBorder(Theme.Colors.border, lineWidth: 1)
        )
    }

    private func waveformHeight(for index: Int) -> CGFloat {
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
