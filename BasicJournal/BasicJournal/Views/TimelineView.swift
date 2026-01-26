//
//  TimelineView.swift
//  BasicJournal
//
//  One Thing - Daily Voice Journal
//  Timeline with soft cards and elegant typography
//

import SwiftUI

struct TimelineView: View {
    @ObservedObject var viewModel: JournalViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                Theme.Colors.background
                    .ignoresSafeArea()

                // Subtle decorative orb
                GeometryReader { geo in
                    GradientOrb(size: 200, opacity: 0.25, blur: 80)
                        .offset(x: geo.size.width * 0.7, y: geo.size.height * 0.1)
                }
                .ignoresSafeArea()

                if viewModel.entries.isEmpty {
                    EmptyTimelineStateView()
                } else {
                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                            // Header
                            VStack(alignment: .leading, spacing: Theme.Spacing.sm) {
                                Text("Your")
                                    .font(Theme.Typography.caption())
                                    .foregroundColor(Theme.Colors.textTertiary)
                                    .textCase(.uppercase)
                                    .tracking(1.2)

                                Text("Timeline")
                                    .font(Theme.Typography.displayLarge())
                                    .foregroundColor(Theme.Colors.textPrimary)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, Theme.Spacing.lg)
                            .padding(.top, Theme.Spacing.md)
                            .padding(.bottom, Theme.Spacing.lg)

                            ForEach(viewModel.entriesByDate, id: \.date) { group in
                                Section {
                                    ForEach(group.entries) { entry in
                                        NavigationLink(destination: EntryDetailView(entry: entry, viewModel: viewModel)) {
                                            TimelineEntryRow(entry: entry)
                                        }
                                        .buttonStyle(.plain)
                                    }
                                } header: {
                                    TimelineSectionHeader(title: group.date)
                                }
                            }
                        }
                        .padding(.horizontal, Theme.Spacing.lg)
                        .padding(.bottom, 120)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

// MARK: - Section Header

struct TimelineSectionHeader: View {
    let title: String

    var body: some View {
        HStack {
            Text(title)
                .font(Theme.Typography.captionMedium())
                .foregroundColor(Theme.Colors.textSecondary)
                .textCase(.uppercase)
                .tracking(0.8)

            Spacer()
        }
        .padding(.vertical, Theme.Spacing.md)
        .padding(.horizontal, Theme.Spacing.xs)
        .background(Theme.Colors.background)
    }
}

// MARK: - Entry Row

struct TimelineEntryRow: View {
    let entry: Entry

    private let moodGradients: [[Color]] = [
        [Color(red: 0.70, green: 0.78, blue: 0.88), Color(red: 0.60, green: 0.70, blue: 0.82)],
        [Color(red: 0.75, green: 0.80, blue: 0.90), Color(red: 0.68, green: 0.75, blue: 0.85)],
        [Color(red: 0.90, green: 0.88, blue: 0.80), Color(red: 0.85, green: 0.82, blue: 0.75)],
        [Color(red: 0.95, green: 0.88, blue: 0.72), Color(red: 0.90, green: 0.82, blue: 0.65)],
        [Color(red: 0.98, green: 0.92, blue: 0.70), Color(red: 0.95, green: 0.88, blue: 0.60)]
    ]

    var body: some View {
        HStack(spacing: Theme.Spacing.md) {
            // Mood gradient circle
            Circle()
                .fill(
                    LinearGradient(
                        colors: moodGradients[entry.mood],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 48, height: 48)
                .overlay(
                    AppIconImage(icon: entry.moodAppIcon, isSelected: true, size: 20)
                        .foregroundColor(.white.opacity(0.9))
                )
                .shadow(color: moodGradients[entry.mood][0].opacity(0.3), radius: 6, y: 3)

            // Content
            VStack(alignment: .leading, spacing: Theme.Spacing.xs) {
                Text(entry.formattedTime)
                    .font(Theme.Typography.caption())
                    .foregroundColor(Theme.Colors.textTertiary)

                Text(entry.transcript)
                    .font(Theme.Typography.body())
                    .foregroundColor(Theme.Colors.textPrimary)
                    .lineLimit(2)
                    .lineSpacing(2)
            }

            Spacer()

            // Chevron
            AppIconImage(icon: .chevronRight, isSelected: false, size: 14)
                .foregroundColor(Theme.Colors.textTertiary)
        }
        .padding(Theme.Spacing.md)
        .background(Theme.Colors.card)
        .clipShape(RoundedRectangle(cornerRadius: Theme.Radius.medium))
        .shadow(color: .black.opacity(0.03), radius: 8, x: 0, y: 2)
        .padding(.vertical, Theme.Spacing.xs)
    }
}

// MARK: - Empty State

struct EmptyTimelineStateView: View {
    var body: some View {
        VStack(spacing: Theme.Spacing.lg) {
            AnimatedGradientOrb(size: 120)

            Text("No entries yet")
                .font(Theme.Typography.displaySmall())
                .foregroundColor(Theme.Colors.textPrimary)

            Text("Your journal entries will appear here")
                .font(Theme.Typography.body())
                .foregroundColor(Theme.Colors.textSecondary)
        }
        .padding(Theme.Spacing.xxl)
    }
}

// MARK: - Preview

#Preview {
    TimelineView(viewModel: JournalViewModel())
}
