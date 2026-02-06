# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build Commands

```bash
# Build for simulator (Debug)
xcodebuild -project BasicJournal.xcodeproj -scheme Remin -sdk iphonesimulator -configuration Debug build

# Build for device (Release)
xcodebuild -project BasicJournal.xcodeproj -scheme Remin -sdk iphoneos -configuration Release build

# Run in simulator (opens Xcode, then run)
open BasicJournal.xcodeproj
```

No tests are currently configured in the scheme.

## Architecture Overview

BasicJournal (app target: "Remin") is a SwiftUI iOS app for daily voice journaling with audio recording and on-device transcription.

### MVVM Structure

- **Models/** - `Entry.swift` defines the journal entry with date, mood (0-4), transcript, and audio flag
- **ViewModels/** - `JournalViewModel` is the single source of truth managing:
  - Flow state machine: `startingPrompt → selectMood → recordPrompt → recording → saved`
  - User settings persisted to UserDefaults (userName, daily prompt state)
  - Services coordination (audio + transcription)
- **Services/** - Isolated system integrations:
  - `AudioRecordingService`: AVAudioRecorder wrapper, handles app backgrounding auto-save
  - `TranscriptionService`: SFSpeechRecognizer wrapper, prefers on-device recognition
- **Views/** - SwiftUI views organized by feature (TodayView, CalendarView, TimelineView, etc.)

### Design System (Theme.swift)

All UI styling is centralized in `Theme.swift`:
- `Theme.Colors` - Named colors from asset catalog, mood gradients, mesh gradient colors
- `Theme.Typography` - Semantic font styles using Dynamic Type
- `Theme.Spacing` / `Theme.Radius` - Layout constants
- `AppIcon` enum - Heroicons mapping (outline/solid variants in Assets.xcassets)
- Reusable components: `MoodPill`, `SoftCard`, `BottomActionDock`, `PrimaryDockButtonStyle`, `SecondaryDockButtonStyle`, `GradientOrb`, `AnimatedGradientOrb`, `BottomMeshGradient` (iOS 18+)

### Tab Navigation

`ContentView.swift` hosts a custom `LiquidGlassTabBar` with four tabs:
1. Today (TodayView) - Daily check-in flow
2. Timeline (TimelineView) - Past entries
3. Search (SearchView) - Transcript search
4. Settings (SettingsView)

### Audio Flow

1. User taps "I'm ready" → `JournalViewModel.startRecording()` checks mic permission
2. `AudioRecordingService.startRecording(entryID:)` records to Documents/recordings/{uuid}.m4a
3. On stop, `TranscriptionService.transcribe(audioFileURL:)` runs async
4. Entry is created with "Transcribing..." placeholder, updated when transcription completes

## Key Design Constraints

Per [Docs/new-entry-workflow.md](Remin/Docs/new-entry-workflow.md):
- One entry per local calendar day
- Voice-only (no text input)
- Transcripts are read-only
- No editing, no streaks, no gamification
- Minimal friction, emotionally calm UX
- Required Info.plist keys: `NSMicrophoneUsageDescription`, `NSSpeechRecognitionUsageDescription`
