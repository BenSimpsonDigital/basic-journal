//
//  AudioRecordingService.swift
//  Remin
//
//  One Thing - Daily Voice Journal
//  Manages audio recording via AVAudioRecorder
//

import Foundation
import AVFoundation
import Combine
import UIKit

@MainActor
class AudioRecordingService: ObservableObject {

    // MARK: - Published State

    @Published private(set) var isRecording = false
    @Published private(set) var recordingDuration: TimeInterval = 0

    // MARK: - Private Properties

    private var audioRecorder: AVAudioRecorder?
    private var recordingTimer: Timer?
    private var currentFileURL: URL?
    private var backgroundObserver: Any?

    // MARK: - Initialization

    init() {
        observeAppBackgrounding()
    }

    deinit {
        if let observer = backgroundObserver {
            NotificationCenter.default.removeObserver(observer)
        }
    }

    // MARK: - Permission

    /// Check current microphone permission status
    var permissionStatus: AVAudioSession.RecordPermission {
        AVAudioSession.sharedInstance().recordPermission
    }

    /// Request microphone permission. Returns true if granted.
    func requestPermission() async -> Bool {
        await withCheckedContinuation { continuation in
            AVAudioSession.sharedInstance().requestRecordPermission { granted in
                continuation.resume(returning: granted)
            }
        }
    }

    // MARK: - Recording

    /// Start recording audio to a file for the given entry ID
    func startRecording(entryID: UUID) throws {
        let session = AVAudioSession.sharedInstance()
        try session.setCategory(.playAndRecord, mode: .default, options: [.defaultToSpeaker])
        try session.setActive(true)

        let fileURL = audioFileURL(for: entryID)
        currentFileURL = fileURL

        let settings: [String: Any] = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 44100,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]

        audioRecorder = try AVAudioRecorder(url: fileURL, settings: settings)
        audioRecorder?.record()
        isRecording = true
        recordingDuration = 0

        // Start timer for duration tracking
        recordingTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            Task { @MainActor in
                self?.recordingDuration += 1
            }
        }
    }

    /// Stop recording and return the saved file URL
    @discardableResult
    func stopRecording() -> URL? {
        recordingTimer?.invalidate()
        recordingTimer = nil
        audioRecorder?.stop()
        audioRecorder = nil
        isRecording = false

        // Deactivate audio session
        try? AVAudioSession.sharedInstance().setActive(false, options: .notifyOthersOnDeactivation)

        let url = currentFileURL
        currentFileURL = nil
        return url
    }

    /// Cancel recording and delete the file
    func cancelRecording() {
        let url = currentFileURL
        stopRecording()
        if let url {
            try? FileManager.default.removeItem(at: url)
        }
    }

    // MARK: - File Management

    /// Get the file URL for an entry's audio
    func audioFileURL(for entryID: UUID) -> URL {
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let audioDir = documentsPath.appendingPathComponent("recordings", isDirectory: true)
        try? FileManager.default.createDirectory(at: audioDir, withIntermediateDirectories: true)
        return audioDir.appendingPathComponent("\(entryID.uuidString).m4a")
    }

    /// Check if an audio file exists for an entry
    func hasAudioFile(for entryID: UUID) -> Bool {
        FileManager.default.fileExists(atPath: audioFileURL(for: entryID).path)
    }

    /// Delete the audio file for an entry
    func deleteAudioFile(for entryID: UUID) {
        let url = audioFileURL(for: entryID)
        try? FileManager.default.removeItem(at: url)
    }

    // MARK: - Formatted Duration

    /// Format recording duration as MM:SS
    var formattedDuration: String {
        let minutes = Int(recordingDuration) / 60
        let seconds = Int(recordingDuration) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    // MARK: - Background Handling

    private nonisolated func observeAppBackgrounding() {
        Task { @MainActor in
            backgroundObserver = NotificationCenter.default.addObserver(
                forName: UIApplication.willResignActiveNotification,
                object: nil,
                queue: .main
            ) { [weak self] _ in
                Task { @MainActor in
                    self?.handleAppBackgrounded()
                }
            }
        }
    }

    private func handleAppBackgrounded() {
        guard isRecording else { return }
        // Auto-save: stop recording but keep the file
        stopRecording()
    }
}
