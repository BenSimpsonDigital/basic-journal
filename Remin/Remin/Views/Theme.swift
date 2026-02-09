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
    case listBullet = "heroicon-list-bullet"
    case chevronLeftMini = "heroicon-chevron-left-mini"
    case chevronRightMini = "heroicon-chevron-right-mini"
    case documentText = "heroicon-document-text"
    case documentMagnifyingGlass = "heroicon-document-magnifying-glass"
    case wrench = "heroicon-wrench"

    // Profile icons
    case user = "heroicon-user"

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
    }

    // MARK: - Blob Palette

    struct BlobPalette {
        static let cloud = Color(red: 0.98, green: 0.98, blue: 1.00)
        static let powderBlue = Color(red: 0.86, green: 0.93, blue: 1.00)
        static let skyBlue = Color(red: 0.63, green: 0.74, blue: 1.00)
        static let iceBlue = Color(red: 0.70, green: 0.84, blue: 1.00)
        static let cobalt = Color(red: 0.46, green: 0.58, blue: 0.96)
        static let lavender = Color(red: 0.87, green: 0.83, blue: 0.99)
        static let lilac = Color(red: 0.83, green: 0.74, blue: 1.00)
        static let blush = Color(red: 0.93, green: 0.85, blue: 0.99)
        static let rose = Color(red: 0.95, green: 0.74, blue: 0.88)
        static let peach = Color(red: 1.00, green: 0.86, blue: 0.76)
        static let mist = Color(red: 0.98, green: 0.95, blue: 0.98)
    }

    // MARK: - Typography

    struct Typography {
        static let instrumentSerif = "InstrumentSerif-Regular"

        // Display titles — Instrument Serif
        static func displayLarge() -> Font {
            .custom(instrumentSerif, size: 38, relativeTo: .largeTitle)
        }

        static func displayXL() -> Font {
            .custom(instrumentSerif, size: 46, relativeTo: .largeTitle)
        }

        static func displayMedium() -> Font {
            .custom(instrumentSerif, size: 30, relativeTo: .title)
        }

        static func displaySmall() -> Font {
            .custom(instrumentSerif, size: 26, relativeTo: .title2)
        }

        // Display body — Instrument Serif at body scale
        static func displayBody() -> Font {
            .custom(instrumentSerif, size: 20, relativeTo: .title3)
        }

        // UI text — San Francisco
        static func headline() -> Font {
            .system(.headline, design: .default, weight: .semibold)
        }

        static func subheadline() -> Font {
            .system(.subheadline, design: .default, weight: .semibold)
        }

        static func body() -> Font {
            .system(.body, design: .default, weight: .light)
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

        // Labels
        static func labelSmall() -> Font {
            .system(.caption2, design: .default, weight: .medium)
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
            .padding(.horizontal, Theme.Spacing.lg)
            .frame(height: Theme.Spacing.dockButtonHeight)
            .frame(minWidth: 220, maxWidth: 320)
            .background(
                Capsule()
                    .fill(Theme.Colors.textPrimary)
            )
            .frame(maxWidth: .infinity)
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
            .foregroundColor(Theme.Colors.textSecondary)
            .padding(.vertical, Theme.Spacing.xs)
            .frame(maxWidth: .infinity)
            .frame(minHeight: 44)
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
        .padding(.bottom, Theme.Spacing.lg)
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

// MARK: - Breathing Circle (Recording Animation)

struct BreathingCircle: View {
    @State private var pulseExpanded = false
    var size: CGFloat = 120
    var color: Color = Theme.Colors.accent
    var isActive: Bool = true

    var body: some View {
        ZStack {
            Circle()
                .stroke(color.opacity(0.14), lineWidth: 1)
                .frame(width: size, height: size)

            Circle()
                .stroke(color.opacity(isActive ? 0.26 : 0.14), lineWidth: 2)
                .frame(width: size * 0.68, height: size * 0.68)
                .scaleEffect(isActive && pulseExpanded ? 1.22 : 1.0)
                .opacity(isActive && pulseExpanded ? 0.10 : 0.34)

            Circle()
                .fill(color.opacity(isActive ? 0.24 : 0.12))
                .frame(
                    width: isActive ? size * 0.18 : size * 0.14,
                    height: isActive ? size * 0.18 : size * 0.14
                )
        }
        .onAppear {
            updatePulseAnimation()
        }
        .onChange(of: isActive) { _, _ in
            updatePulseAnimation()
        }
    }

    private func updatePulseAnimation() {
        if isActive {
            pulseExpanded = false
            withAnimation(.easeInOut(duration: 1.8).repeatForever(autoreverses: true)) {
                pulseExpanded = true
            }
        } else {
            withAnimation(.easeOut(duration: 0.2)) {
                pulseExpanded = false
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
