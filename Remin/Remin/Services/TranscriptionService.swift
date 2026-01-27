//
//  TranscriptionService.swift
//  Remin
//
//  One Thing - Daily Voice Journal
//  Transcribes audio files using Apple Speech framework (SFSpeechRecognizer)
//

import Foundation
import Speech
import Combine

@MainActor
class TranscriptionService: ObservableObject {

    // MARK: - Published State

    @Published private(set) var isTranscribing = false

    // MARK: - Permission

    /// Current speech recognition authorization status
    var authorizationStatus: SFSpeechRecognizerAuthorizationStatus {
        SFSpeechRecognizer.authorizationStatus()
    }

    /// Request speech recognition authorization. Returns true if authorized.
    func requestAuthorization() async -> Bool {
        await withCheckedContinuation { continuation in
            SFSpeechRecognizer.requestAuthorization { status in
                continuation.resume(returning: status == .authorized)
            }
        }
    }

    // MARK: - Transcription

    /// Transcribe an audio file and return the transcript text, or nil on failure
    func transcribe(audioFileURL: URL) async -> String? {
        guard FileManager.default.fileExists(atPath: audioFileURL.path) else {
            return nil
        }

        // Ensure authorization
        let status = authorizationStatus
        if status == .notDetermined {
            let authorized = await requestAuthorization()
            if !authorized { return nil }
        } else if status != .authorized {
            return nil
        }

        guard let recognizer = SFSpeechRecognizer(), recognizer.isAvailable else {
            return nil
        }

        isTranscribing = true
        defer { isTranscribing = false }

        let request = SFSpeechURLRecognitionRequest(url: audioFileURL)

        // Prefer on-device recognition for privacy
        if recognizer.supportsOnDeviceRecognition {
            request.requiresOnDeviceRecognition = true
        }

        do {
            let result = try await recognizer.recognitionTask(with: request)
            return result.bestTranscription.formattedString.isEmpty
                ? nil
                : result.bestTranscription.formattedString
        } catch {
            return nil
        }
    }
}

// MARK: - SFSpeechRecognizer async extension

private extension SFSpeechRecognizer {
    /// Async wrapper for speech recognition task
    func recognitionTask(with request: SFSpeechRecognitionRequest) async throws -> SFSpeechRecognitionResult {
        try await withCheckedThrowingContinuation { continuation in
            var hasResumed = false
            recognitionTask(with: request) { result, error in
                guard !hasResumed else { return }

                if let error {
                    hasResumed = true
                    continuation.resume(throwing: error)
                    return
                }

                if let result, result.isFinal {
                    hasResumed = true
                    continuation.resume(returning: result)
                }
            }
        }
    }
}
