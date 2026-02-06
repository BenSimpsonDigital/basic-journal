//
//  JournalView.swift
//  Remin
//
//  One Thing - Daily Voice Journal
//  Combined timeline + search view — minimal, editorial
//

import SwiftUI

struct JournalView: View {
    @ObservedObject var viewModel: JournalViewModel
    @State private var showCalendar = false
    @State private var navigationPath = NavigationPath()
    @FocusState private var isSearchFocused: Bool

    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack {
                Theme.Colors.background.ignoresSafeArea()

                VStack(spacing: 0) {
                    // Header with calendar toggle
                    ScreenHeaderView(
                        title: "Journal",
                        subtitle: "",
                        alignment: .leading,
                        trailingIcon: showCalendar ? .listBullet : .calendar,
                        trailingAction: {
                            withAnimation(.easeInOut(duration: 0.25)) {
                                showCalendar.toggle()
                            }
                        }
                    )

                    // Search bar
                    SearchInputBar(
                        text: $viewModel.searchQuery,
                        isFocused: $isSearchFocused
                    )
                    .padding(.horizontal, Theme.Spacing.lg)
                    .padding(.bottom, Theme.Spacing.md)

                    // Collapsible calendar
                    if showCalendar {
                        CalendarView(
                            entries: viewModel.entries,
                            onSelectDate: handleDateTap
                        )
                        .transition(.opacity.combined(with: .move(edge: .top)))
                        .padding(.bottom, Theme.Spacing.md)
                    }

                    // Entry feed or search results
                    if viewModel.searchQuery.isEmpty {
                        if viewModel.entries.isEmpty {
                            JournalEmptyState()
                        } else {
                            entryFeed
                        }
                    } else if viewModel.filteredEntries.isEmpty {
                        SearchNoResultsView(query: viewModel.searchQuery)
                    } else {
                        searchResultsFeed
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

    // MARK: - Entry Feed

    private var entryFeed: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                ForEach(viewModel.entriesByDate, id: \.date) { group in
                    Section {
                        ForEach(group.entries) { entry in
                            NavigationLink(value: entry.id) {
                                JournalEntryRow(entry: entry)
                            }
                            .buttonStyle(.plain)
                        }
                    } header: {
                        JournalSectionHeader(title: group.date)
                    }
                }
            }
            .padding(.horizontal, Theme.Spacing.lg)
            .padding(.bottom, 100)
        }
        .scrollDismissesKeyboard(.interactively)
    }

    // MARK: - Search Results Feed

    private var searchResultsFeed: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: Theme.Spacing.sm) {
                Text("\(viewModel.filteredEntries.count) \(viewModel.filteredEntries.count == 1 ? "result" : "results")")
                    .font(Theme.Typography.caption())
                    .foregroundColor(Theme.Colors.textTertiary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, Theme.Spacing.lg)

                ForEach(viewModel.filteredEntries) { entry in
                    NavigationLink(value: entry.id) {
                        JournalEntryRow(entry: entry, highlightQuery: viewModel.searchQuery)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, Theme.Spacing.lg)
            .padding(.bottom, 100)
        }
        .scrollDismissesKeyboard(.interactively)
    }

    // MARK: - Calendar Date Tap Handler

    private func handleDateTap(date: Date) {
        if let entry = viewModel.entry(for: date) {
            navigationPath.append(entry.id)
        } else {
            viewModel.startEntryForDate(date)
        }
    }
}

// MARK: - Journal Entry Row

struct JournalEntryRow: View {
    let entry: Entry
    var highlightQuery: String? = nil

    var body: some View {
        HStack(spacing: Theme.Spacing.md) {
            // Mood accent bar
            RoundedRectangle(cornerRadius: 2)
                .fill(Theme.Colors.moodAccents[entry.mood])
                .frame(width: 3, height: 40)

            // Content
            VStack(alignment: .leading, spacing: Theme.Spacing.xs) {
                HStack(spacing: Theme.Spacing.sm) {
                    Text(entry.formattedTime)
                        .font(Theme.Typography.caption())
                        .foregroundColor(Theme.Colors.textTertiary)

                    Text(entry.moodLabel)
                        .font(Theme.Typography.caption())
                        .foregroundColor(Theme.Colors.moodAccents[entry.mood])
                }

                if let query = highlightQuery {
                    SearchHighlightedText(text: entry.transcript, highlight: query)
                        .font(Theme.Typography.body())
                        .lineLimit(2)
                } else {
                    Text(entry.transcript)
                        .font(Theme.Typography.body())
                        .foregroundColor(Theme.Colors.textPrimary)
                        .lineLimit(2)
                        .lineSpacing(2)
                }
            }

            Spacer()

            AppIconImage(icon: .chevronRight, isSelected: false, size: 12)
                .foregroundColor(Theme.Colors.textTertiary)
        }
        .padding(Theme.Spacing.md)
        .background(Theme.Colors.card)
        .clipShape(RoundedRectangle(cornerRadius: Theme.Radius.medium))
        .overlay(
            RoundedRectangle(cornerRadius: Theme.Radius.medium)
                .strokeBorder(Theme.Colors.border, lineWidth: 1)
        )
        .padding(.vertical, Theme.Spacing.xs)
    }
}

// MARK: - Section Header

struct JournalSectionHeader: View {
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

// MARK: - Empty State

struct JournalEmptyState: View {
    var body: some View {
        VStack(spacing: Theme.Spacing.lg) {
            Spacer()

            AppIconImage(icon: .documentText, isSelected: false, size: 40)
                .foregroundColor(Theme.Colors.textTertiary)

            Text("No entries yet")
                .font(Theme.Typography.displaySmall())
                .foregroundColor(Theme.Colors.textPrimary)

            Text("Your journal entries will appear here")
                .font(Theme.Typography.body())
                .foregroundColor(Theme.Colors.textSecondary)

            Spacer()
        }
    }
}

// MARK: - Search Input Bar

struct SearchInputBar: View {
    @Binding var text: String
    var isFocused: FocusState<Bool>.Binding

    var body: some View {
        HStack(spacing: Theme.Spacing.md) {
            AppIconImage(icon: .magnifyingGlass, isSelected: false, size: 18)
                .foregroundColor(Theme.Colors.textTertiary)

            TextField("Search your entries...", text: $text)
                .focused(isFocused)
                .font(Theme.Typography.body())
                .foregroundColor(Theme.Colors.textPrimary)
                .submitLabel(.search)

            if !text.isEmpty {
                Button(action: { text = "" }) {
                    AppIconImage(icon: .xCircle, isSelected: true, size: 18)
                        .foregroundColor(Theme.Colors.textTertiary)
                }
            }
        }
        .padding(.horizontal, Theme.Spacing.lg)
        .padding(.vertical, Theme.Spacing.md + 2)
        .background(Theme.Colors.surface)
        .clipShape(RoundedRectangle(cornerRadius: Theme.Radius.medium))
        .overlay(
            RoundedRectangle(cornerRadius: Theme.Radius.medium)
                .strokeBorder(Theme.Colors.border, lineWidth: 1)
        )
    }
}

// MARK: - No Results

struct SearchNoResultsView: View {
    let query: String

    var body: some View {
        VStack(spacing: Theme.Spacing.lg) {
            Spacer()

            AppIconImage(icon: .documentMagnifyingGlass, isSelected: false, size: 40)
                .foregroundColor(Theme.Colors.textTertiary)

            Text("No results")
                .font(Theme.Typography.displaySmall())
                .foregroundColor(Theme.Colors.textPrimary)

            Text("No entries match \"\(query)\"")
                .font(Theme.Typography.body())
                .foregroundColor(Theme.Colors.textSecondary)
                .multilineTextAlignment(.center)

            Spacer()
        }
        .padding(.horizontal, Theme.Spacing.xxl)
    }
}

// MARK: - Highlighted Text

struct SearchHighlightedText: View {
    let text: String
    let highlight: String

    var body: some View {
        if let range = text.lowercased().range(of: highlight.lowercased()) {
            let before = String(text[..<range.lowerBound])
            let match = String(text[range])
            let after = String(text[range.upperBound...])

            return Text(before)
                .foregroundColor(Theme.Colors.textPrimary)
            + Text(match)
                .foregroundColor(Theme.Colors.accent)
                .fontWeight(.semibold)
            + Text(after)
                .foregroundColor(Theme.Colors.textPrimary)
        } else {
            return Text(text)
                .foregroundColor(Theme.Colors.textPrimary)
        }
    }
}

// MARK: - Preview

#Preview {
    JournalView(viewModel: JournalViewModel())
}
