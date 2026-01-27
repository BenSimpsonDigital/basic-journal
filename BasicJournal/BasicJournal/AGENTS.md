# AGENTS.md - Development Guidelines for Remin iOS App

## Project Overview
Remin is a voice-based journaling iOS app built with SwiftUI, featuring mood tracking, voice recording, and timeline visualization. This is a frontend prototype using MVVM architecture with comprehensive design system.

## Build & Development Commands

### Xcode Build Commands
```bash
# Build the project
xcodebuild -project BasicJournal.xcodeproj -scheme Remin -destination 'platform=iOS Simulator,name=iPhone 15' build

# Run on simulator
xcodebuild -project BasicJournal.xcodeproj -scheme Remin -destination 'platform=iOS Simulator,name=iPhone 15' run

# Clean build
xcodebuild -project BasicJournal.xcodeproj -scheme Remin clean
```

### Testing Commands
```bash
# Currently no test suite exists - this is a prototype
# When adding tests, use:
xcodebuild test -project BasicJournal.xcodeproj -scheme Remin -destination 'platform=iOS Simulator,name=iPhone 15'

# Run specific test (when added)
xcodebuild test -project BasicJournal.xcodeproj -scheme Remin -destination 'platform=iOS Simulator,name=iPhone 15' -only-testing:ReminTests/ViewModelTests
```

### Development Workflow
- Use Xcode 15+ for iOS 17/18 development
- Target iOS 17.0+ (with iOS 18+ enhancements)
- Test on iPhone 15 simulator and physical devices

## Code Style Guidelines

### Swift Conventions
- **File Organization**: Use `// MARK: -` comments for logical sections
- **Naming**: Descriptive, camelCase names for variables and functions
- **Types**: Use `struct` for data models, `class` for ViewModels
- **Access Control**: Prefer `private` and `internal`, limit `public`

### SwiftUI Architecture
- **MVVM Pattern**: Separate Models, ViewModels, and Views
- **State Management**: 
  - Use `@StateObject` for ViewModels owned by views
  - Use `@ObservedObject` for injected ViewModels
  - Use `@State` for view-local state
  - Use `@Published` for ObservableObject properties
- **View Composition**: Create small, reusable view components

### Import Organization
```swift
import SwiftUI
import Foundation
// Other system imports
// Then third-party imports (if any)
```

### File Structure
```
Remin/
├── ReminApp.swift                # App entry point
├── Models/
│   └── Entry.swift                # Data models
├── ViewModels/
│   └── JournalViewModel.swift     # State management
├── Views/
│   ├── Theme.swift                # Design system
│   ├── TodayView.swift            # Main views
│   └── [OtherViews].swift
```

## Design System Guidelines

### Theme Usage
- **Centralized Design**: All styling in `Theme.swift`
- **Colors**: Use theme colors (e.g., `Theme.Colors.textPrimary`)
- **Typography**: Use theme fonts (e.g., `Theme.Typography.displayFont`)
- **Spacing**: Use theme spacing tokens (e.g., `Theme.Spacing.medium`)

### Mood System
- **5 Moods**: Terrible, Bad, Neutral, Good, Amazing
- **Color Mapping**: Each mood has associated gradient colors
- **Visual Feedback**: Mood-based UI elements and animations

### Component Guidelines
- **SoftCard**: Use for content containers with glassmorphism
- **PillButtonStyle**: Primary button style with mood colors
- **ScreenHeaderView**: Standardized header for all screens

## Code Quality Standards

### Documentation
- Add file headers describing purpose
- Document complex logic with inline comments
- Use `// MARK: -` for section organization

### Error Handling
- Implement graceful error states
- Use `Result<Success, Failure>` for async operations
- Show user-friendly error messages

### Performance
- Use `@State` vs `@StateObject` appropriately
- Implement lazy loading for large lists
- Optimize animations for battery life

## Testing Guidelines

### When Adding Tests
- **Unit Tests**: Test ViewModels and business logic
- **UI Tests**: Test critical user flows
- **Mock Data**: Use existing mock data generators
- **Test Organization**: Group tests by feature

### Test Structure
```swift
import XCTest
@testable import Remin

class JournalViewModelTests: XCTestCase {
    var viewModel: JournalViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = JournalViewModel()
    }
    
    func testMoodSelection() {
        // Test implementation
    }
}
```

## Development Best Practices

### SwiftUI Specific
- **View Modifiers**: Chain modifiers logically
- **Animations**: Use theme animation states (subtle, hyped, calm)
- **Accessibility**: Support `reduceMotion` preferences
- **Safe Areas**: Handle safe areas properly

### State Management
- Keep ViewModels lightweight
- Use `@Published` for reactive updates
- Implement proper data flow (parent → child)

### UI/UX Considerations
- **Micro-interactions**: Add thoughtful animations
- **Visual Hierarchy**: Use typography and spacing effectively
- **Responsive Design**: Adapt to different screen sizes
- **Liquid Glass Design**: Maintain consistent glassmorphism aesthetic

## Platform-Specific Guidelines

### iOS 17+ Features
- Use modern SwiftUI components
- Implement proper navigation patterns
- Support Dynamic Type and accessibility

### iOS 18+ Enhancements
- **Mesh Gradients**: Use for mood-based backgrounds
- **New SwiftUI Features**: Adopt when beneficial
- **Performance**: Consider impact on older devices

## Git & Version Control

### Commit Style
- Use descriptive commit messages
- Follow conventional commit format if desired
- Include relevant context in commit descriptions

### Branch Strategy
- `main`: Stable production code
- `develop`: Integration branch
- Feature branches: `feature/feature-name`

## Production Readiness
- ✅ Frontend UI complete, ✅ Design system implemented
- ❌ No backend integration, ❌ No test suite, ❌ No production error handling

### Production TODOs
- Add comprehensive test suite, implement backend API integration
- Add proper error handling, implement data persistence
- Add analytics and crash reporting, set up CI/CD pipeline

## Tools & Configuration
- **SwiftLint**: For code consistency (add when ready)
- **GitHub Actions**: For CI/CD, **Fastlane**: For automated builds
- Xcode Settings: Swift 5.9+, iOS 17.0+, ARC enabled

## Notes for AI Agents
- **Key Context**: This is a prototype/frontend-only app
- **UI/UX Playbook**: Follow `PROJECT_PLAYBOOK.md` for layout/hierarchy rules and UI consistency
- Focus on UI/UX excellence and modern SwiftUI practices
- Maintain the liquid glass design aesthetic and mood system
- **Common Tasks**: Follow MVVM pattern, use Theme.swift tokens
- **Constraints**: No external dependencies, iOS 17.0+, pure SwiftUI
