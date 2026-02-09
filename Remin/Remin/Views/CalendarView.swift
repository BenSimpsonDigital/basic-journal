//
//  CalendarView.swift
//  Remin
//
//  One Thing - Daily Voice Journal
//  Calendar grid with recording presence indicators.
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
            monthHeader
            weekdayHeader
            calendarGrid
        }
        .padding(.horizontal, Theme.Spacing.md)
        .padding(.vertical, Theme.Spacing.sm)
    }

    private var monthHeader: some View {
        HStack {
            Button(action: previousMonth) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(Theme.Colors.textPrimary)
                    .frame(width: 34, height: 34)
                    .background(
                        Circle()
                            .fill(Color.white.opacity(0.80))
                            .overlay(
                                Circle()
                                    .stroke(Color.white.opacity(0.94), lineWidth: 1)
                            )
                    )
            }
            .buttonStyle(.plain)

            Spacer()

            Text(monthYearString)
                .font(Theme.Typography.subheadline())
                .foregroundColor(Theme.Colors.textPrimary)

            Spacer()

            Button(action: nextMonth) {
                Image(systemName: "chevron.right")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(Theme.Colors.textPrimary)
                    .frame(width: 34, height: 34)
                    .background(
                        Circle()
                            .fill(Color.white.opacity(0.80))
                            .overlay(
                                Circle()
                                    .stroke(Color.white.opacity(0.94), lineWidth: 1)
                            )
                    )
            }
            .buttonStyle(.plain)
        }
    }

    private var weekdayHeader: some View {
        HStack(spacing: 6) {
            ForEach(weekdaySymbols, id: \.self) { symbol in
                Text(symbol)
                    .font(Theme.Typography.captionMedium())
                    .foregroundColor(Theme.Colors.textTertiary)
                    .frame(maxWidth: .infinity)
            }
        }
    }

    private var calendarGrid: some View {
        let days = daysInMonth(for: displayedMonth)

        return LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 6), count: 7), spacing: 6) {
            ForEach(Array(days.enumerated()), id: \.offset) { _, date in
                if let date {
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

    private func daysInMonth(for date: Date) -> [Date?] {
        guard let monthInterval = calendar.dateInterval(of: .month, for: date) else {
            return []
        }

        let firstWeekday = calendar.component(.weekday, from: monthInterval.start)
        let firstWeekdayOfLocale = calendar.firstWeekday
        let leadingPadding = (firstWeekday - firstWeekdayOfLocale + 7) % 7

        guard let range = calendar.range(of: .day, in: .month, for: date) else {
            return []
        }

        var days: [Date?] = Array(repeating: nil, count: leadingPadding)

        for day in range {
            if let dayDate = calendar.date(byAdding: .day, value: day - 1, to: monthInterval.start) {
                days.append(dayDate)
            }
        }

        let trailingPadding = (7 - (days.count % 7)) % 7
        days.append(contentsOf: Array(repeating: nil as Date?, count: trailingPadding))

        return days
    }

    private func entry(for date: Date) -> Entry? {
        entries.first { calendar.isDate($0.date, inSameDayAs: date) }
    }
}

struct CalendarDayCell: View {
    let date: Date
    let entry: Entry?
    let isToday: Bool
    let action: () -> Void

    private let calendar = Calendar.current

    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(Color.white.opacity(entry == nil ? 0.52 : 0.74))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .stroke(Color.white.opacity(0.92), lineWidth: 1)
                    )

                if isToday {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .strokeBorder(Theme.Colors.accent, lineWidth: 1.5)
                }

                VStack(spacing: 4) {
                    Text("\(calendar.component(.day, from: date))")
                        .font(isToday ? Theme.Typography.captionMedium() : Theme.Typography.caption())
                        .foregroundColor(Theme.Colors.textPrimary)

                    Capsule()
                        .fill(entryDotColor)
                        .frame(width: entry == nil ? 4 : 12, height: 4)
                        .opacity(entry == nil ? 0.30 : 1)
                }
                .padding(.vertical, 4)
            }
            .aspectRatio(1, contentMode: .fit)
        }
        .buttonStyle(.plain)
    }

    private var entryDotColor: Color {
        guard let entry else {
            return Theme.Colors.textTertiary.opacity(0.4)
        }
        return entry.isSample ? Theme.Colors.textSecondary : Theme.Colors.accent
    }
}

#Preview {
    ZStack {
        ReminLuminousBackdrop().ignoresSafeArea()

        ReminSectionCard(title: "Calendar") {
            CalendarView(
                entries: Entry.generateJournalShowcaseEntries(),
                onSelectDate: { date in
                    print("Selected: \(date)")
                }
            )
            .padding(.horizontal, Theme.Spacing.sm)
            .padding(.vertical, Theme.Spacing.sm)
        }
        .padding(.horizontal, Theme.Spacing.lg)
    }
}
