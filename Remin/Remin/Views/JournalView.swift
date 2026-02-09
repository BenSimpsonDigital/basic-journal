//
//  JournalView.swift
//  Remin
//
//  One Thing - Daily Voice Journal
//  Day-first timeline with one entry per day.
//

import SwiftUI

private enum JournalLayout {
    static let dayHeaderTopPadding: CGFloat = 18
    static let dayHeaderBottomPadding: CGFloat = 9
    static let cardCornerRadius: CGFloat = 20
}

struct JournalView: View {
    @ObservedObject var viewModel: JournalViewModel

    @State private var navigationPath = NavigationPath()
    @State private var showCalendar = false
    @State private var showDateFilterSheet = false
    @State private var pendingDeleteEntry: Entry?

    @State private var customDateStart = Calendar.current.date(byAdding: .month, value: -1, to: Date()) ?? Date()
    @State private var customDateEnd = Date()

    @State private var lastOpenedEntryID: Entry.ID?
    @State private var highlightedEntryID: Entry.ID?
    @State private var highlightResetTask: Task<Void, Never>?

    @FocusState private var isSearchFocused: Bool

    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack {
                ReminLuminousBackdrop()
                    .ignoresSafeArea()

                GeometryReader { proxy in
                    let contentWidth = max(
                        0,
                        min(
                            ReminSurfaceLayout.maxContentWidth,
                            proxy.size.width - (ReminSurfaceLayout.horizontalGutter * 2)
                        )
                    )

                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: Theme.Spacing.md) {
                            topBar
                                .padding(.top, Theme.Spacing.lg)

                            searchAndFilterArea

                            if showCalendar {
                                ReminSectionCard(title: "Calendar") {
                                    CalendarView(
                                        entries: viewModel.entries,
                                        onSelectDate: handleDateTap
                                    )
                                    .padding(.horizontal, Theme.Spacing.sm)
                                    .padding(.vertical, Theme.Spacing.sm)
                                }
                                .padding(.horizontal, Theme.Spacing.xs)
                                .transition(.opacity.combined(with: .move(edge: .top)))
                            }

                            timelineContent
                        }
                        .frame(width: contentWidth)
                        .frame(maxWidth: .infinity)
                        .padding(.top, Theme.Spacing.xs)
                        .padding(.bottom, 120)
                    }
                    .scrollDismissesKeyboard(.interactively)
                }
            }
            .navigationBarHidden(true)
            .navigationDestination(for: Entry.ID.self) { entryID in
                if let entry = viewModel.entries.first(where: { $0.id == entryID }) {
                    EntryDetailView(entry: entry, viewModel: viewModel)
                }
            }
            .sheet(isPresented: $showDateFilterSheet) {
                DateFilterSheet(
                    selectedPreset: viewModel.selectedDatePreset,
                    customStart: $customDateStart,
                    customEnd: $customDateEnd,
                    onPresetTap: { preset in
                        viewModel.applyDatePreset(preset)
                        showDateFilterSheet = false
                    },
                    onApplyCustom: {
                        viewModel.applyCustomDateRange(start: customDateStart, end: customDateEnd)
                        showDateFilterSheet = false
                    },
                    onClear: {
                        viewModel.clearDateFilter()
                        showDateFilterSheet = false
                    }
                )
                .presentationDetents([.medium])
            }
            .confirmationDialog(
                "Delete this entry?",
                isPresented: Binding(
                    get: { pendingDeleteEntry != nil },
                    set: { newValue in
                        if !newValue {
                            pendingDeleteEntry = nil
                        }
                    }
                ),
                titleVisibility: .visible,
                presenting: pendingDeleteEntry
            ) { entry in
                Button("Delete", role: .destructive) {
                    viewModel.deleteEntry(entry)
                    pendingDeleteEntry = nil
                }
                Button("Cancel", role: .cancel) {
                    pendingDeleteEntry = nil
                }
            } message: { _ in
                Text("This action cannot be undone.")
            }
            .onChange(of: navigationPath.count) { oldValue, newValue in
                if oldValue > 0 && newValue == 0 {
                    triggerReturnHighlightIfNeeded()
                }
            }
            .onDisappear {
                highlightResetTask?.cancel()
                highlightResetTask = nil
            }
        }
    }

    private var topBar: some View {
        HStack {
            Circle()
                .fill(Color.clear)
                .frame(width: 34, height: 34)
                .accessibilityHidden(true)

            Spacer()

            Text("Journal")
                .font(Theme.Typography.subheadline())
                .foregroundColor(Theme.Colors.textPrimary)

            Spacer()

            Button {
                withAnimation(.easeInOut(duration: 0.25)) {
                    showCalendar.toggle()
                }
            } label: {
                Image(systemName: showCalendar ? "list.bullet" : "calendar")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Theme.Colors.textPrimary)
                    .frame(width: 34, height: 34)
                    .background(
                        Circle()
                            .fill(Color.white.opacity(0.85))
                            .overlay(
                                Circle()
                                    .stroke(Color.white.opacity(0.95), lineWidth: 1)
                            )
                    )
            }
            .buttonStyle(.plain)
            .accessibilityLabel(showCalendar ? "Show list" : "Show calendar")
        }
        .padding(.horizontal, Theme.Spacing.xs)
    }

    private var searchAndFilterArea: some View {
        VStack(alignment: .leading, spacing: Theme.Spacing.sm) {
            SearchInputBar(
                text: $viewModel.searchQuery,
                isFocused: $isSearchFocused
            )

            if isSearchFocused {
                HStack(spacing: Theme.Spacing.sm) {
                    SearchFilterChip(
                        title: "People",
                        isSelected: viewModel.activeSearchChips.contains(.people),
                        action: { viewModel.toggleSearchChip(.people) }
                    )

                    SearchFilterChip(
                        title: "Dates",
                        isSelected: viewModel.activeSearchChips.contains(.dates),
                        action: {
                            configureDateFilterDefaults()
                            showDateFilterSheet = true
                        }
                    )

                    SearchFilterChip(
                        title: "Missing days",
                        isSelected: viewModel.activeSearchChips.contains(.missingDays),
                        action: { viewModel.toggleSearchChip(.missingDays) }
                    )
                }
                .transition(.opacity)
            }
        }
        .padding(.horizontal, Theme.Spacing.xs)
    }

    @ViewBuilder
    private var timelineContent: some View {
        if viewModel.timelineDays.isEmpty {
            JournalEmptyState()
                .padding(.top, Theme.Spacing.md)
                .padding(.horizontal, Theme.Spacing.xs)
        } else if viewModel.activeSearchChips.contains(.missingDays) {
            missingGapList
        } else if viewModel.filteredTimelineDays.isEmpty {
            SearchNoResultsView(query: viewModel.searchQuery)
                .padding(.top, Theme.Spacing.md)
                .padding(.horizontal, Theme.Spacing.xs)
        } else {
            timelineDayList(days: viewModel.filteredTimelineDays)
                .padding(.horizontal, Theme.Spacing.xs)
        }
    }

    private func timelineDayList(days: [TimelineDay]) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(Array(days.enumerated()), id: \.element.id) { index, day in
                VStack(alignment: .leading, spacing: 0) {
                    Text(day.dateHeader)
                        .font(.system(size: 15, weight: .semibold, design: .default))
                        .foregroundColor(Theme.Colors.textPrimary.opacity(0.86))
                        .padding(.top, JournalLayout.dayHeaderTopPadding)
                        .padding(.bottom, JournalLayout.dayHeaderBottomPadding)
                        .id(day.id)

                    JournalDayCard(
                        entry: day.entry,
                        isHighlighted: highlightedEntryID == day.entry.id,
                        onOpen: { openEntry(day.entry) },
                        onEdit: { viewModel.beginEditingEntryFromJournal(day.entry) },
                        onDelete: { pendingDeleteEntry = day.entry }
                    )
                }

                if index < days.count - 1,
                   let gap = viewModel.missingGap(between: day, and: days[index + 1]) {
                    MissingDaysInlineSeparator(label: gap.label) {
                        viewModel.beginTodayEntryFromJournal()
                    }
                    .padding(.top, 10)
                }
            }
        }
    }

    private var missingGapList: some View {
        let gaps = viewModel.filteredMissingDayGaps

        return VStack(alignment: .leading, spacing: Theme.Spacing.sm) {
            if gaps.isEmpty {
                SearchNoResultsView(query: viewModel.searchQuery)
                    .padding(.top, Theme.Spacing.md)
            } else {
                ForEach(gaps) { gap in
                    Button {
                        viewModel.beginTodayEntryFromJournal()
                    } label: {
                        HStack(spacing: Theme.Spacing.sm) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(gap.label)
                                    .font(.system(size: 15, weight: .semibold, design: .default))
                                    .foregroundColor(Theme.Colors.textPrimary)

                                Text(missingGapRangeText(for: gap))
                                    .font(.system(size: 13, weight: .regular, design: .default))
                                    .foregroundColor(Theme.Colors.textTertiary)
                            }

                            Spacer(minLength: Theme.Spacing.sm)

                            Image(systemName: "chevron.right")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(Theme.Colors.textTertiary.opacity(0.75))
                        }
                        .padding(.horizontal, 18)
                        .padding(.vertical, 14)
                        .background(
                            RoundedRectangle(cornerRadius: JournalLayout.cardCornerRadius, style: .continuous)
                                .fill(Color.white.opacity(0.82))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: JournalLayout.cardCornerRadius, style: .continuous)
                                .stroke(Color.black.opacity(0.06), lineWidth: 1)
                        )
                    }
                    .buttonStyle(JournalCardButtonStyle())
                }
            }
        }
        .padding(.horizontal, Theme.Spacing.xs)
    }

    private func openEntry(_ entry: Entry) {
        lastOpenedEntryID = entry.id
        navigationPath.append(entry.id)
    }

    private func triggerReturnHighlightIfNeeded() {
        guard let lastOpenedEntryID else { return }

        highlightResetTask?.cancel()
        highlightedEntryID = lastOpenedEntryID

        highlightResetTask = Task {
            try? await Task.sleep(nanoseconds: 750_000_000)
            guard !Task.isCancelled else { return }
            await MainActor.run {
                withAnimation(.easeOut(duration: 0.25)) {
                    highlightedEntryID = nil
                }
            }
        }
    }

    private func configureDateFilterDefaults() {
        if case let .custom(start, end) = viewModel.selectedDatePreset {
            customDateStart = start
            customDateEnd = end
            return
        }

        if let range = viewModel.activeDateRange {
            customDateStart = range.lowerBound
            customDateEnd = range.upperBound
            return
        }

        customDateStart = Calendar.current.date(byAdding: .month, value: -1, to: Date()) ?? Date()
        customDateEnd = Date()
    }

    private func handleDateTap(_ date: Date) {
        if let entry = viewModel.entry(for: date) {
            openEntry(entry)
        } else {
            viewModel.startEntryForDate(date)
        }
    }

    private func missingGapRangeText(for gap: MissingDayGap) -> String {
        "\(Self.dayRangeFormatter.string(from: gap.firstMissingDay)) – \(Self.dayRangeFormatter.string(from: gap.lastMissingDay))"
    }

    private static let dayRangeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.setLocalizedDateFormatFromTemplate("MMM d")
        return formatter
    }()
}

// MARK: - Timeline Card

private struct JournalDayCard: View {
    let entry: Entry
    let isHighlighted: Bool
    let onOpen: () -> Void
    let onEdit: () -> Void
    let onDelete: () -> Void

    var body: some View {
        Button(action: onOpen) {
            HStack(spacing: Theme.Spacing.md) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(cardTitle)
                        .font(.system(size: 16, weight: .semibold, design: .default))
                        .foregroundColor(Theme.Colors.textPrimary)
                        .lineLimit(1)

                    Text(cardPreview)
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .foregroundColor(Theme.Colors.textSecondary)
                        .lineLimit(2)
                }

                Spacer(minLength: Theme.Spacing.sm)

                Image(systemName: "chevron.right")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(Theme.Colors.textTertiary.opacity(0.78))
            }
            .padding(.horizontal, 18)
            .padding(.vertical, 14)
            .background(
                RoundedRectangle(cornerRadius: JournalLayout.cardCornerRadius, style: .continuous)
                    .fill(
                        isHighlighted
                        ? Theme.Colors.accentSoft.opacity(0.5)
                        : Color.white.opacity(0.82)
                    )
            )
            .overlay(
                RoundedRectangle(cornerRadius: JournalLayout.cardCornerRadius, style: .continuous)
                    .stroke(Color.black.opacity(0.06), lineWidth: 1)
            )
            .contentShape(RoundedRectangle(cornerRadius: JournalLayout.cardCornerRadius, style: .continuous))
        }
        .buttonStyle(JournalCardButtonStyle())
        .contextMenu {
            Button("Open", action: onOpen)
            Button("Edit", action: onEdit)
            Button("Delete", role: .destructive, action: onDelete)
        }
    }

    private var cardTitle: String {
        let cleaned = cleanedTranscript
        guard !cleaned.isEmpty else { return "Entry" }

        if let punctuationRange = cleaned.range(of: #"[.!?](\s|$)"#, options: .regularExpression) {
            let sentence = String(cleaned[..<punctuationRange.upperBound]).trimmingCharacters(in: .whitespacesAndNewlines)
            if !sentence.isEmpty {
                return sentence
            }
        }

        return cleaned
    }

    private var cardPreview: String {
        let cleaned = cleanedTranscript
        guard !cleaned.isEmpty else { return "" }

        if let punctuationRange = cleaned.range(of: #"[.!?](\s|$)"#, options: .regularExpression) {
            let tail = String(cleaned[punctuationRange.upperBound...]).trimmingCharacters(in: .whitespacesAndNewlines)
            if !tail.isEmpty {
                return tail
            }
        }

        return cleaned
    }

    private var cleanedTranscript: String {
        entry.transcript
            .replacingOccurrences(of: "\n", with: " ")
            .replacingOccurrences(of: "  ", with: " ")
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

private struct JournalCardButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.985 : 1)
            .animation(.easeOut(duration: 0.12), value: configuration.isPressed)
    }
}

private struct MissingDaysInlineSeparator: View {
    let label: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.system(size: 13, weight: .regular, design: .default))
                .foregroundColor(Theme.Colors.textTertiary)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 6)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Search

private struct SearchInputBar: View {
    @Binding var text: String
    var isFocused: FocusState<Bool>.Binding

    var body: some View {
        HStack(spacing: Theme.Spacing.md) {
            AppIconImage(icon: .magnifyingGlass, isSelected: false, size: 16)
                .foregroundColor(Theme.Colors.textTertiary)

            TextField("Search by text, people or date", text: $text)
                .focused(isFocused)
                .font(Theme.Typography.bodySmall())
                .foregroundColor(Theme.Colors.textPrimary)
                .submitLabel(.search)

            if !text.isEmpty {
                Button(action: { text = "" }) {
                    AppIconImage(icon: .xCircle, isSelected: true, size: 16)
                        .foregroundColor(Theme.Colors.textTertiary)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color.white.opacity(0.70))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(Color.white.opacity(0.90), lineWidth: 1)
        )
    }
}

private struct SearchFilterChip: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 13, weight: .medium, design: .default))
                .foregroundColor(isSelected ? Theme.Colors.textPrimary : Theme.Colors.textSecondary)
                .padding(.horizontal, 12)
                .padding(.vertical, 7)
                .background(
                    Capsule()
                        .fill(isSelected ? Color.white.opacity(0.84) : Color.white.opacity(0.56))
                )
                .overlay(
                    Capsule()
                        .stroke(Color.black.opacity(isSelected ? 0.09 : 0.05), lineWidth: 1)
                )
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Sheets
private struct DateFilterSheet: View {
    let selectedPreset: DatePreset?
    @Binding var customStart: Date
    @Binding var customEnd: Date

    let onPresetTap: (DatePreset) -> Void
    let onApplyCustom: () -> Void
    let onClear: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: Theme.Spacing.md) {
            Text("Date filters")
                .font(Theme.Typography.subheadline())
                .foregroundColor(Theme.Colors.textPrimary)

            DatePresetRow(
                title: "This week",
                isSelected: selectedPreset == .thisWeek,
                action: { onPresetTap(.thisWeek) }
            )

            DatePresetRow(
                title: "This month",
                isSelected: selectedPreset == .thisMonth,
                action: { onPresetTap(.thisMonth) }
            )

            DatePresetRow(
                title: "Last 3 months",
                isSelected: selectedPreset == .last3Months,
                action: { onPresetTap(.last3Months) }
            )

            VStack(alignment: .leading, spacing: Theme.Spacing.sm) {
                Text("Custom range")
                    .font(.system(size: 14, weight: .semibold, design: .default))
                    .foregroundColor(Theme.Colors.textPrimary)

                DatePicker("Start", selection: $customStart, displayedComponents: .date)
                DatePicker("End", selection: $customEnd, displayedComponents: .date)

                Button("Apply custom", action: onApplyCustom)
                    .buttonStyle(.borderedProminent)
            }
            .padding(.top, Theme.Spacing.xs)

            Button("Clear date filter", role: .destructive, action: onClear)
                .font(.system(size: 14, weight: .regular, design: .default))
                .padding(.top, Theme.Spacing.xs)

            Spacer()
        }
        .padding(Theme.Spacing.lg)
    }
}

private struct DatePresetRow: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.system(size: 15, weight: .medium, design: .default))
                    .foregroundColor(Theme.Colors.textPrimary)

                Spacer()

                if isSelected {
                    Image(systemName: "checkmark")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(Theme.Colors.textPrimary)
                }
            }
            .padding(.horizontal, Theme.Spacing.md)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(isSelected ? Color.white.opacity(0.82) : Color.white.opacity(0.56))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .stroke(Color.black.opacity(0.06), lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Empty / No Results

private struct JournalEmptyState: View {
    var body: some View {
        VStack(spacing: Theme.Spacing.md) {
            AppIconImage(icon: .documentText, isSelected: false, size: 36)
                .foregroundColor(Theme.Colors.textTertiary)

            Text("No entries yet")
                .font(Theme.Typography.displaySmall())
                .foregroundColor(Theme.Colors.textPrimary)

            Text("Your journal entries will appear here once you start recording.")
                .font(Theme.Typography.body())
                .foregroundColor(Theme.Colors.textSecondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, Theme.Spacing.xl)
    }
}

private struct SearchNoResultsView: View {
    let query: String

    var body: some View {
        VStack(spacing: Theme.Spacing.md) {
            AppIconImage(icon: .documentMagnifyingGlass, isSelected: false, size: 36)
                .foregroundColor(Theme.Colors.textTertiary)

            Text("No results")
                .font(Theme.Typography.displaySmall())
                .foregroundColor(Theme.Colors.textPrimary)

            if query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                Text("No entries match your current filters.")
                    .font(Theme.Typography.body())
                    .foregroundColor(Theme.Colors.textSecondary)
                    .multilineTextAlignment(.center)
            } else {
                Text("No entries match \"\(query)\".")
                    .font(Theme.Typography.body())
                    .foregroundColor(Theme.Colors.textSecondary)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, Theme.Spacing.xl)
    }
}

#Preview("Journal - Seeded") {
    JournalView(viewModel: JournalViewModel())
}

#Preview("Journal - Search") {
    let viewModel = JournalViewModel()
    viewModel.searchQuery = "coffee"
    return JournalView(viewModel: viewModel)
}

#Preview("Journal - No Results") {
    let viewModel = JournalViewModel()
    viewModel.searchQuery = "volcano"
    return JournalView(viewModel: viewModel)
}
