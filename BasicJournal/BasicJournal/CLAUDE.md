# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build Commands

```bash
# Build
xcodebuild -project ../BasicJournal.xcodeproj -scheme Remin -destination 'platform=iOS Simulator,name=iPhone 15' build

# Clean build
xcodebuild -project ../BasicJournal.xcodeproj -scheme Remin clean

# Run tests (when added)
xcodebuild test -project ../BasicJournal.xcodeproj -scheme Remin -destination 'platform=iOS Simulator,name=iPhone 15'
```

Requires Xcode 15+ targeting iOS 17.0+.

## Architecture

This is a **frontend prototype** for a voice-based journaling app using SwiftUI and MVVM. No backend, persistence, or tests exist yet.

### Key Files
- `ContentView.swift` - App root with custom tab bar navigation
- `ViewModels/JournalViewModel.swift` - Central state management (entries, flow state, mood selection, recording simulation)
- `Models/Entry.swift` - Journal entry data model with 5 moods (0-4: Low, Heavy, Okay, Happy, Amazing)
- `Views/Theme.swift` - Design system with all colors, typography, spacing, and reusable components

### Flow States
`JournalFlowState` in the ViewModel controls the Today screen: `startingPrompt` → `selectMood` → `recordPrompt` → `recording` → `saved`

### Design System (Theme.swift)
- **Colors**: `Theme.Colors.textPrimary`, `Theme.Colors.accent`, etc.
- **Typography**: `Theme.Typography.displayLarge()`, `Theme.Typography.body()`, etc.
- **Spacing**: `Theme.Spacing.sm` (8), `Theme.Spacing.md` (16), `Theme.Spacing.lg` (24)
- **Icons**: `AppIcon` enum with Heroicons (e.g., `AppIcon.microphone`, `AppIcon.calendar`)
- **Mood Gradients**: `Theme.Colors.moodBasedOrbGradient(for: mood)`, `Theme.Colors.moodBasedMeshColors(for: mood)`
- **Components**: `SoftCard`, `PillButtonStyle`, `MoodPill`, `GradientOrb`, `AnimatedGradientOrb`

### iOS 18+ Features
`BottomMeshGradient` uses `MeshGradient` (iOS 18+) for mood-reactive animated backgrounds. Falls back gracefully on iOS 17.

### State Management Patterns
- `@StateObject` for owned ViewModels in views
- `@ObservedObject` for injected ViewModels
- `@Published` for reactive ViewModel properties
- Use `// MARK: -` comments for section organization
