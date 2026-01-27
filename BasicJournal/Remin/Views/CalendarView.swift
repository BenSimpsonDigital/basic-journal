//
//  CalendarView.swift
//  Remin
//
//  One Thing - Daily Voice Journal
//  Calendar grid component for mood history visualization
//

import SwiftUI

struct CalendarView: View {
    let entries: [Entry]
    let onSelectDate: (Date) -> Void

    @State private var displayedMonth: Date = Date()

    private let calendar = Calendar.current
    private let weekdaySymbols: [String] = {
        let calendar = Calendar.current
        let symbols = calendar.veryShortWeekdaySymbols
        let firstWeekday = calendar.firstWeekday - 1
        return Array(symbols[firstWeekday...]) + Array(symbols[..<firstWeekday])
    }()

    var body: some View {
        VStack(spacing: Theme.Spacing.md) {
            // Month/Year header with navigation
            monthHeader

            // Weekday labels
            weekdayHeader

            // Calendar grid
            calendarGrid
        }
        .padding(.horizontal, Theme.Spacing.lg)
    }

    // MARK: - Month Header

    private var monthHeader: some View {
        HStack {
            Button(action: previousMonth) {
                AppIconImage(icon: .chevronLeft, isSelected: false, size: 20)
                    .foregroundColor(Theme.Colors.textSecondary)
                    .frame(width: 44, height: 44)
            }

            Spacer()

            Text(monthYearString)
                .font(Theme.Typography.headline())
                .foregroundColor(Theme.Colors.textPrimary)

            Spacer()

            Button(action: nextMonth) {
                AppIconImage(icon: .chevronRight, isSelected: false, size: 20)
                    .foregroundColor(Theme.Colors.textSecondary)
                    .frame(width: 44, height: 44)
            }
        }
        .padding(.vertical, Theme.Spacing.sm)
    }

    // MARK: - Weekday Header

    private var weekdayHeader: some View {
        HStack(spacing: 0) {
            ForEach(weekdaySymbols, id: \.self) { symbol in
                Text(symbol)
                    .font(Theme.Typography.captionMedium())
                    .foregroundColor(Theme.Colors.textTertiary)
                    .frame(maxWidth: .infinity)
            }
        }
    }

    // MARK: - Calendar Grid

    private var calendarGrid: some View {
        let days = daysInMonth(for: displayedMonth)
        let rows = days.chunked(into: 7)

        return LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 4), count: 7), spacing: 4) {
            ForEach(Array(days.enumerated()), id: \.offset) { index, date in
                if let date = date {
                    CalendarDayCell(
                        date: date,
                        entry: entry(for: date),
                        isToday: calendar.isDateInToday(date),
                        action: { onSelectDate(date) }
                    )
                } else {
                    Color.clear
                        .aspectRatio(1, contentMode: .fit)
                }
            }
        }
    }

    // MARK: - Helpers

    private var monthYearString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: displayedMonth)
    }

    private func previousMonth() {
        withAnimation(.easeInOut(duration: 0.2)) {
            displayedMonth = calendar.date(byAdding: .month, value: -1, to: displayedMonth) ?? displayedMonth
        }
    }

    private func nextMonth() {
        withAnimation(.easeInOut(duration: 0.2)) {
            displayedMonth = calendar.date(byAdding: .month, value: 1, to: displayedMonth) ?? displayedMonth
        }
    }

    /// Returns array of dates for the month, with nil padding for grid alignment
    private func daysInMonth(for date: Date) -> [Date?] {
        guard let monthInterval = calendar.dateInterval(of: .month, for: date) else {
            return []
        }

        // Get the weekday of the first day (adjusted for locale's first weekday)
        let firstWeekday = calendar.component(.weekday, from: monthInterval.start)
        let firstWeekdayOfLocale = calendar.firstWeekday
        let leadingPadding = (firstWeekday - firstWeekdayOfLocale + 7) % 7

        // Get number of days in the month
        guard let range = calendar.range(of: .day, in: .month, for: date) else {
            return []
        }

        var days: [Date?] = Array(repeating: nil, count: leadingPadding)

        // Add all days of the month
        for day in range {
            if let dayDate = calendar.date(byAdding: .day, value: day - 1, to: monthInterval.start) {
                days.append(dayDate)
            }
        }

        // Add trailing padding to complete the last row
        let trailingPadding = (7 - (days.count % 7)) % 7
        days.append(contentsOf: Array(repeating: nil as Date?, count: trailingPadding))

        return days
    }

    /// Lookup entry for a specific calendar date (ignoring time)
    private func entry(for date: Date) -> Entry? {
        entries.first { calendar.isDate($0.date, inSameDayAs: date) }
    }
}

// MARK: - Calendar Day Cell

struct CalendarDayCell: View {
    let date: Date
    let entry: Entry?
    let isToday: Bool
    let action: () -> Void

    private let calendar = Calendar.current

    var body: some View {
        Button(action: action) {
            ZStack {
                // Background - mood gradient if entry exists
                if let entry = entry {
                    RoundedRectangle(cornerRadius: Theme.Radius.small)
                        .fill(
                            LinearGradient(
                                colors: Theme.Colors.moodPillGradients[entry.mood],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                } else {
                    RoundedRectangle(cornerRadius: Theme.Radius.small)
                        .fill(Theme.Colors.card.opacity(0.5))
                }

                // Today indicator - border ring
                if isToday {
                    RoundedRectangle(cornerRadius: Theme.Radius.small)
                        .strokeBorder(Theme.Colors.textPrimary.opacity(0.4), lineWidth: 2)
                }

                // Day number
                Text("\(calendar.component(.day, from: date))")
                    .font(isToday ? Theme.Typography.captionMedium() : Theme.Typography.caption())
                    .fontWeight(isToday ? .bold : .regular)
                    .foregroundColor(entry != nil ? .white : Theme.Colors.textPrimary)
            }
            .aspectRatio(1, contentMode: .fit)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Array Extension for Chunking

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}

// MARK: - Preview

#Preview {
    ZStack {
        Theme.Colors.background.ignoresSafeArea()

        CalendarView(
            entries: Entry.generateMockEntries(),
            onSelectDate: { date in
                print("Selected: \(date)")
            }
        )
    }
}
