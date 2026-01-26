# One Thing — Daily Voice Journal

[![Swift](https://img.shields.io/badge/Swift-5.9+-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/Platform-iOS%2017.0+-black.svg)](https://developer.apple.com/ios/)
[![SwiftUI](https://img.shields.io/badge/Framework-SwiftUI-blue.svg)](https://developer.apple.com/xcode/swiftui/)

**One Thing** is a warm, minimal voice-first journaling app designed to help you capture the most important reflection of your day. Built with a focus on mindfulness and simplicity, it strips away the friction of traditional text journaling, allowing you to speak your mind freely.

![App Mockup](https://raw.githubusercontent.com/BenSimpsonDigital/basic-journal/main/Screenshots/banner.png) *(Note: Add your own banner here)*

## ✨ Key Features

- **🎙️ Voice-First Recording**: Capture your thoughts as they come. No typing, no pressure.
- **🎭 Mood Tracking**: Start every reflection by acknowledging how you feel with a beautiful, color-coded mood selector.
- **💡 Daily Prompts**: Never stare at a blank screen. Get a new, thoughtful prompt every day to guide your reflection.
- **🌅 Dynamic Aesthetics**: Experience a "living" interface with breathing gradient orbs that shift color based on your mood.
- **📅 Visual Timeline**: Browse your past entries in a clean, card-based timeline.
- **🔊 Audio Playback**: Listen back to your memories with an integrated audio player and waveform visualization.
- **🔍 Smart Search**: Easily find past reflections using the powerful built-in search.

## 🎨 Design Philosophy

Inspired by modern wellness apps, **One Thing** uses a "Zen" design system:
- **Warm Minimalism**: A soft cream palette (`#F9F7F2`) combined with serif typography for an elegant, premium feel.
- **Dynamic Feedback**: Organic, animating background elements (orbs) that react to user state.
- **Heroicons**: Clean, consistent iconography throughout the app.

## 🛠️ Technology Stack

- **Framework**: SwiftUI 
- **Architecture**: MVVM (Model-View-ViewModel)
- **Icons**: Custom SVG implementation of Heroicons
- **Theming**: Centralized Design System (`Theme.swift`) for tokens and components

## 🚀 Getting Started

### Prerequisites
- Xcode 15.0+
- iOS 17.0+ (for some of the latest SwiftUI features and animations)

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/BenSimpsonDigital/basic-journal.git
   ```
2. Open `BasicJournal.xcodeproj` in Xcode.
3. Select an iOS Simulator or connected device.
4. Press `Cmd + R` to build and run.

## 📂 Project Structure

- `Views/`: All SwiftUI view components, organized by feature (Today, Timeline, Search, Settings).
- `Models/`: Data structures, including the core `Entry` model.
- `ViewModels/`: Business logic and state management via `JournalViewModel`.
- `Assets.xcassets/`: Custom color sets and Heroicon assets.
- `Views/Theme.swift`: The heart of the app's visual identity, containing all design tokens.

---

*Developed by [Ben Simpson](https://github.com/BenSimpsonDigital)*
