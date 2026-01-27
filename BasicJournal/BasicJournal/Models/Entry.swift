//
//  Entry.swift
//  BasicJournal
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
    var mood: Int // 0-4 representing different moods
    var hasAudio: Bool

    init(id: UUID = UUID(), date: Date, transcript: String, mood: Int, hasAudio: Bool = true) {
        self.id = id
        self.date = date
        self.transcript = transcript
        self.mood = min(max(mood, 0), 4) // Clamp to valid range
        self.hasAudio = hasAudio
    }
}

// MARK: - Mood Helpers

extension Entry {
    /// Mood icons using SF Symbols for a calm, minimal aesthetic (legacy)
    static let moodIcons = ["cloud.rain", "cloud", "sun.haze", "sun.max", "sparkles"]

    /// Mood labels for accessibility and display
    static let moodLabels = ["Low", "Heavy", "Okay", "Happy", "Amazing"]

    /// Mood colors - soft, calming palette
    static let moodColors: [String] = [
        "MoodLow",      // Soft blue-gray
        "MoodDown",     // Soft blue
        "MoodOkay",     // Soft neutral
        "MoodGood",     // Soft warm
        "MoodGreat"     // Soft gold
    ]

    var moodIcon: String {
        Entry.moodIcons[mood]
    }

    var moodLabel: String {
        Entry.moodLabels[mood]
    }

    /// Mood icon using AppIcon enum for heroicons
    var moodAppIcon: AppIcon {
        switch mood {
        case 0: return .cloud   // Low - cloud for rain/gloom
        case 1: return .cloud   // Down - cloud
        case 2: return .sun     // Okay - sun with haze
        case 3: return .sun     // Good - bright sun
        case 4: return .sparkles // Great - sparkles
        default: return .sun
        }
    }
}

// MARK: - Mock Data

extension Entry {
    /// Generate mock entries for UI prototyping
    /// Entries span the last 2 weeks with realistic content
    static func generateMockEntries() -> [Entry] {
        let calendar = Calendar.current
        let today = Date()

        let transcripts = [
            "Had dinner with John and talked about work. He's thinking about changing jobs too, which was interesting to hear.",
            "Felt pretty flat today, work was stressful. The project deadline is looming and I'm not sure we'll make it.",
            "Saw mum, that was nice. We went for a walk in the park and she told me stories about grandpa.",
            "Quiet day, nothing special. Sometimes those days are needed though.",
            "Really productive morning! Finished that report I've been putting off for weeks.",
            "Couldn't sleep well last night, feeling a bit tired. Need to get back to a better routine.",
            "Coffee with Sarah was lovely. Haven't seen her in months and we caught up on everything.",
            "Started reading that book everyone's been talking about. Only a few chapters in but enjoying it so far.",
            "Went for a run this morning. First one in a while, felt good to move.",
            "Work meeting went better than expected. Got some positive feedback on the presentation.",
            "Lazy Sunday. Made pancakes, watched some movies. Exactly what I needed.",
            "Called dad for his birthday. He seemed really happy to hear from me.",
            "Feeling anxious about tomorrow's interview. Trying to stay calm and prepare.",
            "The interview went well! Should hear back next week.",
            "Just a regular day. Nothing remarkable but nothing bad either."
        ]

        let moods = [1, 0, 3, 2, 4, 1, 3, 3, 3, 4, 4, 3, 1, 3, 2]

        var entries: [Entry] = []

        // Create entries for various days in the past 2 weeks
        let daysAgo = [0, 1, 2, 3, 5, 6, 7, 8, 10, 11, 12, 13, 14, 15, 17]

        for (index, days) in daysAgo.enumerated() {
            if let date = calendar.date(byAdding: .day, value: -days, to: today) {
                // Set time to morning/evening for variety
                let hour = index % 2 == 0 ? 9 : 20
                let adjustedDate = calendar.date(bySettingHour: hour, minute: 30, second: 0, of: date) ?? date

                let entry = Entry(
                    date: adjustedDate,
                    transcript: transcripts[index % transcripts.count],
                    mood: moods[index % moods.count],
                    hasAudio: true
                )
                entries.append(entry)
            }
        }

        return entries.sorted { $0.date > $1.date }
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
}
