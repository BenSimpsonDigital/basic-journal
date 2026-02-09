//
//  Entry.swift
//  Remin
//
//  One Thing - Daily Voice Journal
//  Front-end prototype only
//

import Foundation

/// Represents a single journal entry
/// - Note: In production, this would be persisted to Core Data or similar
struct Entry: Identifiable, Equatable {
    let id: UUID
    var date: Date
    var transcript: String
    var hasAudio: Bool
    var isSample: Bool

    init(
        id: UUID = UUID(),
        date: Date,
        transcript: String,
        hasAudio: Bool = true,
        isSample: Bool = false
    ) {
        self.id = id
        self.date = date
        self.transcript = transcript
        self.hasAudio = hasAudio
        self.isSample = isSample
    }
}

// MARK: - Mock Data

extension Entry {
    /// Generate showcase entries for Journal design iteration.
    /// Includes 18 samples across the last 3 weeks, excluding today.
    static func generateJournalShowcaseEntries(referenceDate: Date = Date()) -> [Entry] {
        let calendar = Calendar.current
        let startOfToday = calendar.startOfDay(for: referenceDate)

        let transcripts = [
            "Morning coffee on the balcony with Maya and a 15-minute reset before meetings. I felt calm and grateful.",
            "Prototype review with Jordan went cleaner than expected. I left proud of the spacing decisions.",
            "Took a long walk after dinner and listened to the rain. Felt peaceful by the time I got home.",
            "Heavy focus day. Finished the migration task but felt overwhelmed tracking follow-up bugs.",
            "Met Alex for lunch and talked about interview prep. Left feeling confident and hopeful.",
            "Woke up anxious, but the run helped. Still tired, but my head feels less noisy now.",
            "Read three chapters tonight and stayed off social apps. That made me happy and relieved.",
            "Late call with Priya and the team in Europe. Good momentum, but I felt stressed by the timeline.",
            "Spent an hour organizing photos and found old travel clips from Lisbon. A nostalgic wave hit me.",
            "Journaled right before bed and noticed how much better I sleep when I unload the day. I feel calm.",
            "Quick gym session, then deep work block. Energy stayed steady and I felt joyful all afternoon.",
            "Had a hard conversation with Sam and it went better than I feared. Nervous at first, relieved after.",
            "Tried a new recipe and absolutely over-salted it. I was frustrated, then laughed and felt happy.",
            "Search test: saved ideas for birthday plan, gift list, and coffee spots near downtown with Emma.",
            "Reminder worked today. Recorded right when the notification popped and felt proud about consistency.",
            "Spent too much time in meetings, not enough time making progress. I felt angry and burned out.",
            "Watched the sunset from the car park after errands with Noah. Unexpectedly beautiful and peaceful.",
            "Interview follow-up email sent to Dana. Nervous, hopeful, and trying not to refresh inbox every hour."
        ]

        var entries: [Entry] = []
        let daysAgo = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 14, 15, 17, 18, 20, 21]
        let hours = [8, 21, 7, 20, 9, 22, 6, 19, 10, 18, 11, 17, 7, 21, 8, 20, 9, 19]

        for index in 0..<daysAgo.count {
            guard let date = calendar.date(byAdding: .day, value: -daysAgo[index], to: startOfToday) else {
                continue
            }

            let minute = index.isMultiple(of: 3) ? 12 : 41
            let adjustedDate = calendar.date(
                bySettingHour: hours[index],
                minute: minute,
                second: 0,
                of: date
            ) ?? date

            entries.append(
                Entry(
                    date: adjustedDate,
                    transcript: transcripts[index],
                    hasAudio: true,
                    isSample: true
                )
            )
        }

        return entries.sorted { $0.date > $1.date }
    }

    /// Backward-compatible alias used by existing previews.
    static func generateMockEntries() -> [Entry] {
        generateJournalShowcaseEntries()
    }
}

// MARK: - Date Formatting

extension Entry {
    /// Format date for display in timeline
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }

    /// Format time for display
    var formattedTime: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }

    /// Check if entry is from today
    var isToday: Bool {
        Calendar.current.isDateInToday(date)
    }

    /// Relative date string (Today, Yesterday, or date)
    var relativeDateString: String {
        if Calendar.current.isDateInToday(date) {
            return "Today"
        } else if Calendar.current.isDateInYesterday(date) {
            return "Yesterday"
        } else {
            return formattedDate
        }
    }

    /// Search support text for date queries in timeline.
    var searchableDateText: String {
        let calendar = Calendar.current
        if calendar.isDateInToday(date) {
            return "today \(Self.timelineDateFormatter.string(from: date))"
        }
        if calendar.isDateInYesterday(date) {
            return "yesterday \(Self.timelineDateFormatter.string(from: date))"
        }
        return Self.timelineDateFormatter.string(from: date)
    }

    private static let timelineDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.setLocalizedDateFormatFromTemplate("EEE d MMM yyyy")
        return formatter
    }()
}
