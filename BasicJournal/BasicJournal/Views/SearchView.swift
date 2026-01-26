//
//  SearchView.swift
//  BasicJournal
//
//  One Thing - Daily Voice Journal
//  Search with elegant design and text highlighting
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: JournalViewModel
    @FocusState private var isSearchFocused: Bool

    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                Theme.Colors.background
                    .ignoresSafeArea()

                // Decorative orb
                GeometryReader { geo in
                    GradientOrb(size: 180, opacity: 0.2, blur: 70)
                        .offset(x: geo.size.width * 0.7, y: geo.size.height * 0.3)
                }
                .ignoresSafeArea()

                VStack(spacing: 0) {
                    // Header
                    ScreenHeaderView(
                        title: "Search",
                        subtitle: "",
                        alignment: .leading
                    )

                    // Search bar
                    SearchInputBar(
                        text: $viewModel.searchQuery,
                        isFocused: $isSearchFocused
                    )
                    .padding(.horizontal, Theme.Spacing.lg)
                    .padding(.bottom, Theme.Spacing.lg)

                    // Results or empty state
                    if viewModel.searchQuery.isEmpty {
                        SearchEmptyPromptView()
                    } else if viewModel.filteredEntries.isEmpty {
                        SearchNoResultsView(query: viewModel.searchQuery)
                    } else {
                        SearchResultsList(
                            entries: viewModel.filteredEntries,
                            viewModel: viewModel,
                            query: viewModel.searchQuery
                        )
                    }

                    Spacer()
                }
            }
            .navigationBarHidden(true)
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
        .background(Theme.Colors.card)
        .clipShape(RoundedRectangle(cornerRadius: Theme.Radius.medium))
        .shadow(color: .black.opacity(0.03), radius: 8, x: 0, y: 2)
    }
}

// MARK: - Empty Prompt

struct SearchEmptyPromptView: View {
    var body: some View {
        VStack(spacing: Theme.Spacing.lg) {
            Spacer()

            AnimatedGradientOrb(size: 100)

            Text("Search your journal")
                .font(Theme.Typography.displaySmall())
                .foregroundColor(Theme.Colors.textPrimary)

            Text("Find entries by what you said")
                .font(Theme.Typography.body())
                .foregroundColor(Theme.Colors.textSecondary)

            Spacer()
        }
    }
}

// MARK: - No Results

struct SearchNoResultsView: View {
    let query: String

    var body: some View {
        VStack(spacing: Theme.Spacing.lg) {
            Spacer()

            AppIconImage(icon: .documentMagnifyingGlass, isSelected: false, size: 48)
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

// MARK: - Results List

struct SearchResultsList: View {
    let entries: [Entry]
    @ObservedObject var viewModel: JournalViewModel
    let query: String

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: Theme.Spacing.sm) {
                // Results count
                Text("\(entries.count) \(entries.count == 1 ? "result" : "results")")
                    .font(Theme.Typography.caption())
                    .foregroundColor(Theme.Colors.textTertiary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, Theme.Spacing.lg)
                    .padding(.bottom, Theme.Spacing.sm)

                ForEach(entries) { entry in
                    NavigationLink(destination: EntryDetailView(entry: entry, viewModel: viewModel)) {
                        SearchResultCard(entry: entry, query: query)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, Theme.Spacing.lg)
            .padding(.bottom, 120)
        }
    }
}

// MARK: - Search Result Card

struct SearchResultCard: View {
    let entry: Entry
    let query: String

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
                .frame(width: 44, height: 44)
                .overlay(
                    AppIconImage(icon: entry.moodAppIcon, isSelected: true, size: 18)
                        .foregroundColor(.white.opacity(0.9))
                )

            // Content
            VStack(alignment: .leading, spacing: Theme.Spacing.xs) {
                Text(entry.relativeDateString)
                    .font(Theme.Typography.caption())
                    .foregroundColor(Theme.Colors.textTertiary)

                SearchHighlightedText(text: entry.transcript, highlight: query)
                    .font(Theme.Typography.body())
                    .lineLimit(2)
            }

            Spacer()

            AppIconImage(icon: .chevronRight, isSelected: false, size: 14)
                .foregroundColor(Theme.Colors.textTertiary)
        }
        .padding(Theme.Spacing.md)
        .background(Theme.Colors.card)
        .clipShape(RoundedRectangle(cornerRadius: Theme.Radius.medium))
        .shadow(color: .black.opacity(0.02), radius: 6, x: 0, y: 2)
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
    SearchView(viewModel: JournalViewModel())
}
