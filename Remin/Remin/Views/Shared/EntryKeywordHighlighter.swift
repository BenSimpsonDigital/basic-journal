//
//  EntryKeywordHighlighter.swift
//  Remin
//
//  Detects people and emotion keywords for timeline transcript highlights.
//

import Foundation
import NaturalLanguage

struct EntryKeywordHighlighter {
    enum HighlightCategory {
        case person
        case emotion
    }

    struct Highlight: Equatable {
        let category: HighlightCategory
        let range: NSRange
    }

    private static let emotionLexicon: Set<String> = [
        "happy", "joyful", "grateful", "excited", "hopeful", "calm", "peaceful", "content",
        "proud", "relieved", "sad", "lonely", "anxious", "anxiety", "stressed", "overwhelmed",
        "angry", "frustrated", "guilty", "nervous", "tired", "burned", "burnout",
        "confident", "nostalgic", "afraid"
    ]

    static func highlights(in text: String, maxCount: Int = 3) -> [Highlight] {
        guard !text.isEmpty, maxCount > 0 else {
            return []
        }

        let peopleHighlights = detectPeople(in: text)
        let emotionHighlights = detectEmotionWords(in: text)
        let mergedHighlights = mergeAndDedupeOverlapping(peopleHighlights + emotionHighlights)
        return Array(mergedHighlights.prefix(maxCount))
    }

    private static func detectPeople(in text: String) -> [Highlight] {
        let tagger = NLTagger(tagSchemes: [.nameType])
        tagger.string = text

        var highlights: [Highlight] = []
        let fullRange = text.startIndex..<text.endIndex
        let options: NLTagger.Options = [.omitWhitespace, .omitPunctuation, .joinNames]

        tagger.enumerateTags(in: fullRange, unit: .word, scheme: .nameType, options: options) { tag, range in
            guard tag == .personalName else {
                return true
            }

            highlights.append(
                Highlight(
                    category: .person,
                    range: NSRange(range, in: text)
                )
            )
            return true
        }

        return highlights
    }

    private static func detectEmotionWords(in text: String) -> [Highlight] {
        let tagger = NLTagger(tagSchemes: [.tokenType])
        tagger.string = text

        var highlights: [Highlight] = []
        let fullRange = text.startIndex..<text.endIndex
        let options: NLTagger.Options = [.omitWhitespace, .omitPunctuation, .joinContractions]

        tagger.enumerateTags(in: fullRange, unit: .word, scheme: .tokenType, options: options) { _, range in
            let token = String(text[range])
                .trimmingCharacters(in: .punctuationCharacters)
                .lowercased()

            guard emotionLexicon.contains(token) else {
                return true
            }

            highlights.append(
                Highlight(
                    category: .emotion,
                    range: NSRange(range, in: text)
                )
            )
            return true
        }

        return highlights
    }

    private static func mergeAndDedupeOverlapping(_ highlights: [Highlight]) -> [Highlight] {
        guard !highlights.isEmpty else {
            return []
        }

        let sorted = highlights.sorted { lhs, rhs in
            if lhs.range.location == rhs.range.location {
                return lhs.range.length > rhs.range.length
            }
            return lhs.range.location < rhs.range.location
        }

        var merged: [Highlight] = []

        for highlight in sorted {
            if let last = merged.last,
               overlapsOrTouches(last.range, highlight.range) {
                let unionRange = NSUnionRange(last.range, highlight.range)
                let mergedCategory = mergedCategory(last.category, highlight.category)
                merged[merged.count - 1] = Highlight(category: mergedCategory, range: unionRange)
                continue
            }

            if merged.contains(where: { $0.range == highlight.range && $0.category == highlight.category }) {
                continue
            }

            merged.append(highlight)
        }

        return merged
    }

    private static func overlapsOrTouches(_ lhs: NSRange, _ rhs: NSRange) -> Bool {
        let lhsEnd = lhs.location + lhs.length
        let rhsEnd = rhs.location + rhs.length
        return rhs.location <= lhsEnd && lhs.location <= rhsEnd
    }

    private static func mergedCategory(_ lhs: HighlightCategory, _ rhs: HighlightCategory) -> HighlightCategory {
        if lhs == .emotion || rhs == .emotion {
            return .emotion
        }
        return .person
    }
}
