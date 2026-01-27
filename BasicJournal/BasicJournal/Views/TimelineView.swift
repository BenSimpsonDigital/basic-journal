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
    @State private var isCalendarView = false
    @State private var navigationPath = NavigationPath()

    var body: some View {
        NavigationStack(path: $navigationPath) {
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

                if viewModel.entries.isEmpty && !isCalendarView {
                    EmptyTimelineStateView()
                } else {
                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                            // Header with toggle button
                            ScreenHeaderView(
                                title: "Timeline",
                                subtitle: "",
                                alignment: .leading,
                                trailingIcon: isCalendarView ? .listBullet : .calendar,
                                trailingAction: {
                                    withAnimation(.easeInOut(duration: 0.25)) {
                                        isCalendarView.toggle()
                                    }
                                }
                            )

                            // View content based on toggle state
                            if isCalendarView {
                                CalendarView(
                                    entries: viewModel.entries,
                                    onSelectDate: handleDateTap
                                )
                                .transition(.opacity)
                                .padding(.bottom, Theme.Spacing.lg)
                            } else {
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
                                .padding(.horizontal, Theme.Spacing.lg)
                                .transition(.opacity)
                            }
                        }

                        .padding(.bottom, 120)
                    }
                }
            }
            .navigationBarHidden(true)
            .navigationDestination(for: Entry.ID.self) { entryId in
                if let entry = viewModel.entries.first(where: { $0.id == entryId }) {
                    EntryDetailView(entry: entry, viewModel: viewModel)
                }
            }
        }
    }

    // MARK: - Calendar Date Tap Handler

    private func handleDateTap(date: Date) {
        if let entry = viewModel.entry(for: date) {
            // Entry exists - navigate to detail view
            navigationPath.append(entry.id)
        } else {
            // No entry - start new entry for that date
            viewModel.startEntryForDate(date)
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

    var body: some View {
        HStack(spacing: Theme.Spacing.md) {
            // Mood gradient circle
            Circle()
                .fill(
                    LinearGradient(
                        colors: Theme.Colors.moodPillGradients[entry.mood],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 48, height: 48)
                .overlay(
                    AppIconImage(icon: entry.moodAppIcon, isSelected: true, size: 20)
                        .foregroundColor(.white.opacity(0.9))
                )
                .shadow(color: Theme.Colors.moodPillGradients[entry.mood][0].opacity(0.3), radius: 6, y: 3)

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
