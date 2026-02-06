//
//  Theme.swift
//  Remin
//
//  One Thing - Daily Voice Journal
//  Minimal design system — editorial, clean, intentional
//

import SwiftUI

// MARK: - App Icons (Heroicons)

enum AppIcon: String {
    // Tab bar icons
    case sun = "heroicon-sun"
    case calendar = "heroicon-calendar"
    case magnifyingGlass = "heroicon-magnifying-glass"
    case cog = "heroicon-cog-6-tooth"

    // Common UI icons
    case check = "heroicon-check"
    case checkCircle = "heroicon-check-circle"
    case chevronLeft = "heroicon-chevron-left"
    case chevronRight = "heroicon-chevron-right"
    case xCircle = "heroicon-x-circle"
    case xMark = "heroicon-x-mark"
    case bell = "heroicon-bell"
    case clock = "heroicon-clock"
    case informationCircle = "heroicon-information-circle"
    case shieldCheck = "heroicon-shield-check"
    case microphone = "heroicon-microphone"
    case play = "heroicon-play"
    case playCircle = "heroicon-play-circle"
    case pause = "heroicon-pause"
    case pauseCircle = "heroicon-pause-circle"
    case trash = "heroicon-trash"
    case heart = "heroicon-heart"
    case listBullet = "heroicon-list-bullet"
    case chevronLeftMini = "heroicon-chevron-left-mini"
    case chevronRightMini = "heroicon-chevron-right-mini"
    case documentText = "heroicon-document-text"
    case documentMagnifyingGlass = "heroicon-document-magnifying-glass"
    case wrench = "heroicon-wrench"

    // Profile icons
    case user = "heroicon-user"

    // Mood icons
    case cloud = "heroicon-cloud"
    case sparkles = "heroicon-sparkles"

    /// Returns the outline version of the icon name
    var outline: String {
        "\(rawValue)-outline"
    }

    /// Returns the solid version of the icon name
    var solid: String {
        "\(rawValue)-solid"
    }

    /// Returns the appropriate icon name based on selection state
    func name(selected: Bool) -> String {
        selected ? solid : outline
    }
}

// MARK: - Icon Image View

struct AppIconImage: View {
    let icon: AppIcon
    var isSelected: Bool = false
    var size: CGFloat = 24

    var body: some View {
        Image(icon.name(selected: isSelected))
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size, height: size)
    }
}

// MARK: - Design Tokens

enum Theme {

    // MARK: - Colors

    struct Colors {
        // Backgrounds
        static let background = Color("Background")
        static let card = Color("CardBackground")
        static let surface = Color("Surface")

        // Borders & dividers
        static let border = Color("Border")

        // Text hierarchy
        static let textPrimary = Color("TextPrimary")
        static let textSecondary = Color("TextSecondary")
        static let textTertiary = Color("TextTertiary")

        // Accent
        static let accent = Color("AccentPrimary")
        static let accentSoft = Color("AccentSoft")

        // Muted mood accent colors (watercolor tones)
        static let moodAccents: [Color] = [
            Color(red: 0.561, green: 0.639, blue: 0.749),  // #8FA3BF - Low (steel blue)
            Color(red: 0.639, green: 0.710, blue: 0.788),  // #A3B5C9 - Down (powder blue)
            Color(red: 0.769, green: 0.725, blue: 0.659),  // #C4B9A8 - Okay (taupe)
            Color(red: 0.788, green: 0.663, blue: 0.431),  // #C9A96E - Happy (ochre)
            Color(red: 0.769, green: 0.569, blue: 0.431),  // #C4916E - Amazing (terracotta)
        ]

        /// Mood accent at reduced opacity for card/pill backgrounds
        static func moodAccentBackground(for mood: Int) -> Color {
            guard mood >= 0 && mood < moodAccents.count else { return surface }
            return moodAccents[mood].opacity(0.12)
        }
    }

    // MARK: - Typography

    struct Typography {
        // Large display titles - serif for editorial warmth
        static func displayLarge() -> Font {
            .system(.largeTitle, design: .serif, weight: .regular)
        }

        static func displayMedium() -> Font {
            .system(.title, design: .serif, weight: .regular)
        }

        static func displaySmall() -> Font {
            .system(.title2, design: .serif, weight: .regular)
        }

        // Headlines
        static func headline() -> Font {
            .system(.headline, design: .default, weight: .semibold)
        }

        static func subheadline() -> Font {
            .system(.subheadline, design: .default, weight: .medium)
        }

        // Body text
        static func body() -> Font {
            .system(.body, design: .default, weight: .regular)
        }

        static func bodySmall() -> Font {
            .system(.callout, design: .default, weight: .regular)
        }

        // Captions
        static func caption() -> Font {
            .system(.caption, design: .default, weight: .regular)
        }

        static func captionMedium() -> Font {
            .system(.caption, design: .default, weight: .medium)
        }

        // Monospace for timers
        static func timer() -> Font {
            .system(size: 48, weight: .ultraLight, design: .monospaced)
        }
    }

    // MARK: - Spacing

    struct Spacing {
        static let xs: CGFloat = 4
        static let sm: CGFloat = 8
        static let md: CGFloat = 16
        static let lg: CGFloat = 24
        static let xl: CGFloat = 32
        static let xxl: CGFloat = 48
        static let dockButtonHeight: CGFloat = 52
    }

    // MARK: - Opacity

    struct Opacity {
        static let disabled: CGFloat = 0.4
    }

    // MARK: - Radius

    struct Radius {
        static let small: CGFloat = 8
        static let medium: CGFloat = 12
        static let large: CGFloat = 16
        static let pill: CGFloat = 100
    }
}

// MARK: - Primary Dock Button Style

struct PrimaryDockButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Theme.Typography.subheadline())
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: Theme.Spacing.dockButtonHeight)
            .background(
                RoundedRectangle(cornerRadius: Theme.Radius.medium)
                    .fill(Theme.Colors.accent)
            )
            .opacity(isEnabled ? 1.0 : Theme.Opacity.disabled)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
}

// MARK: - Secondary Dock Button Style

struct SecondaryDockButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Theme.Typography.subheadline())
            .foregroundColor(Theme.Colors.textPrimary)
            .frame(maxWidth: .infinity)
            .frame(height: Theme.Spacing.dockButtonHeight)
            .background(
                RoundedRectangle(cornerRadius: Theme.Radius.medium)
                    .fill(Color.clear)
            )
            .overlay(
                RoundedRectangle(cornerRadius: Theme.Radius.medium)
                    .strokeBorder(Theme.Colors.border, lineWidth: 1)
            )
            .opacity(isEnabled ? 1.0 : Theme.Opacity.disabled)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
}

// MARK: - Bottom Action Dock

struct BottomActionDock<Primary: View, Secondary: View>: View {
    let primary: Primary
    let secondary: Secondary?

    init(
        @ViewBuilder primary: () -> Primary,
        @ViewBuilder secondary: () -> Secondary
    ) {
        self.primary = primary()
        self.secondary = secondary()
    }

    var body: some View {
        VStack(spacing: Theme.Spacing.md) {
            primary

            if let secondary = secondary {
                secondary
            }
        }
        .padding(.horizontal, Theme.Spacing.lg)
        .padding(.top, Theme.Spacing.sm)
        .padding(.bottom, Theme.Spacing.md)
    }
}

// Convenience initializer for primary-only dock
extension BottomActionDock where Secondary == EmptyView {
    init(@ViewBuilder primary: () -> Primary) {
        self.primary = primary()
        self.secondary = nil
    }
}

// MARK: - Soft Card Style

struct SoftCard<Content: View>: View {
    @ViewBuilder let content: Content

    var body: some View {
        content
            .padding(Theme.Spacing.lg)
            .background(Theme.Colors.card)
            .clipShape(RoundedRectangle(cornerRadius: Theme.Radius.large))
            .overlay(
                RoundedRectangle(cornerRadius: Theme.Radius.large)
                    .strokeBorder(Theme.Colors.border, lineWidth: 1)
            )
    }
}

// MARK: - Mood Pill

struct MoodPill: View {
    let index: Int
    let isSelected: Bool
    let action: () -> Void

    private let moodLabels = ["Low", "Down", "Okay", "Happy", "Amazing"]

    var body: some View {
        Button(action: action) {
            Text(moodLabels[index])
                .font(Theme.Typography.subheadline())
                .foregroundColor(
                    isSelected
                    ? Theme.Colors.moodAccents[index]
                    : Theme.Colors.textTertiary
                )
                .padding(.horizontal, Theme.Spacing.lg)
                .padding(.vertical, Theme.Spacing.sm + 4)
                .background(
                    Capsule()
                        .fill(isSelected ? Theme.Colors.moodAccentBackground(for: index) : Color.clear)
                )
                .overlay(
                    Capsule()
                        .strokeBorder(
                            isSelected
                            ? Theme.Colors.moodAccents[index].opacity(0.3)
                            : Theme.Colors.border,
                            lineWidth: 1
                        )
                )
                .animation(.easeOut(duration: 0.2), value: isSelected)
        }
        .buttonStyle(.plain)
        .accessibilityLabel("Mood: \(moodLabels[index])")
        .accessibilityAddTraits(isSelected ? .isSelected : [])
    }
}

// MARK: - Breathing Circle (Recording Animation)

struct BreathingCircle: View {
    @State private var scale: CGFloat = 1.0
    var size: CGFloat = 120
    var color: Color = Theme.Colors.accent

    var body: some View {
        ZStack {
            // Outer ring
            Circle()
                .stroke(color.opacity(0.15), lineWidth: 2)
                .frame(width: size, height: size)
                .scaleEffect(scale * 1.2)
                .opacity(2.0 - Double(scale))

            // Inner fill
            Circle()
                .fill(color.opacity(0.08))
                .frame(width: size, height: size)
                .scaleEffect(scale)

            // Core dot
            Circle()
                .fill(color.opacity(0.25))
                .frame(width: size * 0.3, height: size * 0.3)
                .scaleEffect(scale * 0.8 + 0.2)
        }
        .onAppear {
            withAnimation(
                .easeInOut(duration: 3.0)
                .repeatForever(autoreverses: true)
            ) {
                scale = 1.15
            }
        }
    }
}

// MARK: - Preview

#Preview("Theme Components") {
    ZStack {
        Theme.Colors.background.ignoresSafeArea()

        VStack(spacing: 40) {
            BreathingCircle()

            HStack(spacing: 8) {
                ForEach(0..<5) { i in
                    MoodPill(index: i, isSelected: i == 3, action: {})
                }
            }

            SoftCard {
                Text("This is a soft card")
                    .font(Theme.Typography.body())
            }
        }
        .padding()
    }
}

#Preview("Bottom Action Dock") {
    ZStack {
        Theme.Colors.background.ignoresSafeArea()

        VStack {
            Spacer()
            Text("Content goes here")
                .font(Theme.Typography.displayLarge())
            Spacer()
        }
        .safeAreaInset(edge: .bottom) {
            BottomActionDock {
                Button("Continue") {}
                    .buttonStyle(PrimaryDockButtonStyle())
            } secondary: {
                Button("Not right now") {}
                    .buttonStyle(SecondaryDockButtonStyle())
            }
        }
    }
}
