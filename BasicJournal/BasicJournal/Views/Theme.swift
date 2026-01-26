//
//  Theme.swift
//  BasicJournal
//
//  One Thing - Daily Voice Journal
//  Centralized design system inspired by modern wellness apps
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
    case documentText = "heroicon-document-text"
    case documentMagnifyingGlass = "heroicon-document-magnifying-glass"
    case wrench = "heroicon-wrench"

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

        // Text hierarchy
        static let textPrimary = Color("TextPrimary")
        static let textSecondary = Color("TextSecondary")
        static let textTertiary = Color("TextTertiary")

        // Accent
        static let accent = Color("AccentPrimary")
        static let accentSoft = Color("AccentSoft")

        // Mood gradient colors - soft pastels (legacy, unused)
        static let moodColors: [Color] = [
            Color(red: 0.75, green: 0.82, blue: 0.88), // Soft blue-gray (Low)
            Color(red: 0.80, green: 0.85, blue: 0.92), // Soft periwinkle (Down)
            Color(red: 0.90, green: 0.88, blue: 0.82), // Soft cream (Okay)
            Color(red: 0.92, green: 0.88, blue: 0.78), // Soft gold (Good)
            Color(red: 0.95, green: 0.90, blue: 0.75)  // Warm yellow (Great)
        ]

        // Enhanced mood pill gradients - rich, vibrant multi-color gradients
        static let moodPillGradients: [[Color]] = [
            // Low - Cool blue with indigo depth
            [
                Color(red: 0.55, green: 0.68, blue: 0.92),  // Bright periwinkle
                Color(red: 0.45, green: 0.58, blue: 0.88),  // Rich blue
                Color(red: 0.38, green: 0.50, blue: 0.82)   // Deep indigo
            ],
            // Down - Periwinkle to violet
            [
                Color(red: 0.70, green: 0.68, blue: 0.95),  // Soft periwinkle
                Color(red: 0.60, green: 0.62, blue: 0.90),  // Periwinkle
                Color(red: 0.52, green: 0.55, blue: 0.85),  // Muted violet
                Color(red: 0.45, green: 0.48, blue: 0.78)   // Deep violet
            ],
            // Okay - Warm cream to soft rose
            [
                Color(red: 0.96, green: 0.92, blue: 0.78),  // Warm cream
                Color(red: 0.94, green: 0.88, blue: 0.72),  // Soft peach
                Color(red: 0.92, green: 0.84, blue: 0.70),  // Pale rose
                Color(red: 0.90, green: 0.80, blue: 0.75)   // Light rose
            ],
            // Good - Vibrant gold to coral
            [
                Color(red: 0.98, green: 0.88, blue: 0.55),   // Vibrant gold
                Color(red: 0.96, green: 0.82, blue: 0.48),   // Warm amber
                Color(red: 0.94, green: 0.75, blue: 0.50),  // Coral-orange
                Color(red: 0.92, green: 0.70, blue: 0.55)    // Soft coral
            ],
            // Great - Bright yellow to vibrant pink
            [
                Color(red: 1.0, green: 0.94, blue: 0.50),    // Bright yellow
                Color(red: 0.98, green: 0.88, blue: 0.45),   // Warm gold
                Color(red: 0.96, green: 0.80, blue: 0.48),  // Coral-orange
                Color(red: 0.94, green: 0.72, blue: 0.55)    // Vibrant pink
            ]
        ]

        // Gradient orb colors
        static let orbGradient1 = LinearGradient(
            colors: [
                Color(red: 0.95, green: 0.92, blue: 0.75),
                Color(red: 0.75, green: 0.88, blue: 0.85),
                Color(red: 0.70, green: 0.80, blue: 0.90)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )

        static let orbGradient2 = LinearGradient(
            colors: [
                Color(red: 0.92, green: 0.85, blue: 0.80),
                Color(red: 0.88, green: 0.82, blue: 0.90),
                Color(red: 0.82, green: 0.88, blue: 0.92)
            ],
            startPoint: .top,
            endPoint: .bottom
        )

        // Mood-based orb gradients for background effects - rich, vibrant multi-color gradients
        static func moodBasedOrbGradient(for mood: Int?) -> LinearGradient {
            guard let mood = mood else { return orbGradient1 }

            let colors: [Color]
            switch mood {
            case 0: // Low - Deep indigo → rich blue → periwinkle → soft lavender (cool, calming)
                colors = [
                    Color(red: 0.35, green: 0.45, blue: 0.75),  // Deep indigo
                    Color(red: 0.45, green: 0.58, blue: 0.85),   // Rich blue
                    Color(red: 0.55, green: 0.68, blue: 0.92),   // Bright periwinkle
                    Color(red: 0.65, green: 0.75, blue: 0.95),   // Soft lavender
                    Color(red: 0.70, green: 0.80, blue: 0.96),   // Pale lavender
                    Color(red: 0.75, green: 0.82, blue: 0.97)    // Very light lavender
                ]
            case 1: // Down - Soft lavender → periwinkle → muted violet → deep purple (contemplative)
                colors = [
                    Color(red: 0.78, green: 0.75, blue: 0.95),   // Soft lavender
                    Color(red: 0.70, green: 0.68, blue: 0.92),   // Periwinkle
                    Color(red: 0.65, green: 0.62, blue: 0.88),  // Muted violet
                    Color(red: 0.58, green: 0.55, blue: 0.82),  // Deeper violet
                    Color(red: 0.50, green: 0.48, blue: 0.75),  // Deep purple
                    Color(red: 0.45, green: 0.42, blue: 0.70)    // Rich purple
                ]
            case 2: // Okay - Warm cream → soft peach → pale rose → light lavender (balanced, warm)
                colors = [
                    Color(red: 0.98, green: 0.95, blue: 0.88),   // Warm cream
                    Color(red: 0.96, green: 0.90, blue: 0.82),  // Soft peach
                    Color(red: 0.94, green: 0.85, blue: 0.78),  // Pale rose
                    Color(red: 0.92, green: 0.82, blue: 0.80),  // Light rose
                    Color(red: 0.88, green: 0.80, blue: 0.85),  // Soft mauve
                    Color(red: 0.85, green: 0.78, blue: 0.88)    // Light lavender
                ]
            case 3: // Good - Vibrant gold → warm amber → coral → soft pink (energetic, warm)
                colors = [
                    Color(red: 1.0, green: 0.92, blue: 0.55),    // Vibrant gold
                    Color(red: 0.98, green: 0.88, blue: 0.50),  // Bright gold
                    Color(red: 0.96, green: 0.82, blue: 0.45),  // Warm amber
                    Color(red: 0.94, green: 0.75, blue: 0.50),  // Coral-orange
                    Color(red: 0.92, green: 0.70, blue: 0.55),   // Soft coral
                    Color(red: 0.90, green: 0.68, blue: 0.65)    // Soft pink
                ]
            case 4: // Great - Bright yellow → warm gold → coral-orange → vibrant pink (energetic, celebratory)
                colors = [
                    Color(red: 1.0, green: 0.95, blue: 0.50),   // Bright yellow
                    Color(red: 1.0, green: 0.92, blue: 0.45),    // Vibrant yellow
                    Color(red: 0.98, green: 0.88, blue: 0.42),   // Warm gold
                    Color(red: 0.96, green: 0.80, blue: 0.45),  // Coral-orange
                    Color(red: 0.94, green: 0.72, blue: 0.50),  // Vibrant coral
                    Color(red: 0.92, green: 0.68, blue: 0.60)    // Vibrant pink
                ]
            default:
                return orbGradient1
            }

            return LinearGradient(
                colors: colors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        }

        // Mood-based radial orb colors for AnimatedGradientOrb (center → middle → outer → edge)
        static func moodBasedRadialOrbColors(for mood: Int?) -> [Color] {
            guard let mood = mood else {
                // Default: warm cream → pale mint → soft blue → light lavender
                return [
                    Color(red: 0.98, green: 0.95, blue: 0.88),   // Warm cream (center)
                    Color(red: 0.90, green: 0.92, blue: 0.85),   // Pale mint
                    Color(red: 0.80, green: 0.88, blue: 0.85),    // Soft mint-blue
                    Color(red: 0.70, green: 0.82, blue: 0.90),   // Soft blue
                    Color(red: 0.75, green: 0.80, blue: 0.92)    // Light lavender (edge)
                ]
            }

            switch mood {
            case 0: // Low - Light sky blue → bright periwinkle → muted blue → deeper indigo
                return [
                    Color(red: 0.75, green: 0.85, blue: 0.98),  // Light sky blue (center)
                    Color(red: 0.65, green: 0.78, blue: 0.95),  // Bright periwinkle
                    Color(red: 0.55, green: 0.70, blue: 0.92),  // Muted blue
                    Color(red: 0.45, green: 0.60, blue: 0.88),  // Deeper blue
                    Color(red: 0.38, green: 0.50, blue: 0.82)    // Deep indigo (edge)
                ]
            case 1: // Down - Soft lavender → periwinkle → muted violet → deep purple
                return [
                    Color(red: 0.82, green: 0.78, blue: 0.96),  // Soft lavender (center)
                    Color(red: 0.75, green: 0.72, blue: 0.94),  // Periwinkle
                    Color(red: 0.68, green: 0.65, blue: 0.90),  // Muted violet
                    Color(red: 0.60, green: 0.58, blue: 0.85),  // Deeper violet
                    Color(red: 0.52, green: 0.50, blue: 0.78)   // Deep purple (edge)
                ]
            case 2: // Okay - Warm cream → soft peach → pale rose → light lavender
                return [
                    Color(red: 0.98, green: 0.95, blue: 0.88),  // Warm cream (center)
                    Color(red: 0.96, green: 0.90, blue: 0.82),  // Soft peach
                    Color(red: 0.94, green: 0.85, blue: 0.78),  // Pale rose
                    Color(red: 0.90, green: 0.80, blue: 0.80),  // Light rose
                    Color(red: 0.85, green: 0.78, blue: 0.85)  // Light lavender (edge)
                ]
            case 3: // Good - Vibrant gold → warm amber → coral → soft pink
                return [
                    Color(red: 1.0, green: 0.94, blue: 0.60),   // Vibrant gold (center)
                    Color(red: 0.98, green: 0.88, blue: 0.52),  // Bright gold
                    Color(red: 0.96, green: 0.82, blue: 0.48),  // Warm amber
                    Color(red: 0.94, green: 0.75, blue: 0.52),  // Coral-orange
                    Color(red: 0.92, green: 0.70, blue: 0.58)   // Soft pink (edge)
                ]
            case 4: // Great - Bright yellow → warm gold → coral-orange → vibrant pink
                return [
                    Color(red: 1.0, green: 0.96, blue: 0.55),   // Bright yellow (center)
                    Color(red: 1.0, green: 0.92, blue: 0.48),    // Vibrant yellow
                    Color(red: 0.98, green: 0.88, blue: 0.45),   // Warm gold
                    Color(red: 0.96, green: 0.80, blue: 0.48),  // Coral-orange
                    Color(red: 0.94, green: 0.72, blue: 0.55)   // Vibrant pink (edge)
                ]
            default:
                return [
                    Color(red: 0.98, green: 0.95, blue: 0.88),
                    Color(red: 0.90, green: 0.92, blue: 0.85),
                    Color(red: 0.80, green: 0.88, blue: 0.85),
                    Color(red: 0.70, green: 0.82, blue: 0.90),
                    Color(red: 0.75, green: 0.80, blue: 0.92)
                ]
            }
        }
    }

    // MARK: - Typography

    struct Typography {
        // Large display titles - serif for elegance
        static func displayLarge() -> Font {
            .system(size: 34, weight: .regular, design: .serif)
        }

        static func displayMedium() -> Font {
            .system(size: 28, weight: .regular, design: .serif)
        }

        static func displaySmall() -> Font {
            .system(size: 24, weight: .regular, design: .serif)
        }

        // Headlines
        static func headline() -> Font {
            .system(size: 20, weight: .semibold, design: .default)
        }

        static func subheadline() -> Font {
            .system(size: 15, weight: .medium, design: .default)
        }

        // Body text
        static func body() -> Font {
            .system(size: 17, weight: .regular, design: .default)
        }

        static func bodySmall() -> Font {
            .system(size: 15, weight: .regular, design: .default)
        }

        // Captions
        static func caption() -> Font {
            .system(size: 13, weight: .regular, design: .default)
        }

        static func captionMedium() -> Font {
            .system(size: 13, weight: .medium, design: .default)
        }

        // Monospace for timers
        static func timer() -> Font {
            .system(size: 56, weight: .light, design: .monospaced)
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
    }

    // MARK: - Radius

    struct Radius {
        static let small: CGFloat = 12
        static let medium: CGFloat = 16
        static let large: CGFloat = 24
        static let pill: CGFloat = 100
    }
}

// MARK: - Decorative Gradient Orb

struct GradientOrb: View {
    var size: CGFloat = 200
    var opacity: Double = 0.6
    var blur: CGFloat = 60
    var mood: Int? = nil
    var showTexture: Bool = true
    var textureIntensity: Double = 0.12

    var body: some View {
        Circle()
            .fill(Theme.Colors.moodBasedOrbGradient(for: mood))
            .frame(width: size, height: size)
            .overlay(
                Group {
                    if showTexture {
                        GrainOverlay(intensity: textureIntensity, grainSize: 2.0)
                    }
                }
            )
            .blur(radius: blur)
            .opacity(opacity)
    }
}

// MARK: - Animated Gradient Orb (for Today screen)

struct AnimatedGradientOrb: View {
    @State private var animate = false
    var size: CGFloat = 180
    var mood: Int? = nil
    var showTexture: Bool = true
    var textureIntensity: Double = 0.15

    private var orbColors: [Color] {
        Theme.Colors.moodBasedRadialOrbColors(for: mood)
    }

    var body: some View {
        ZStack {
            // Inner orb with subtle breathing
            Circle()
                .fill(
                    RadialGradient(
                        colors: orbColors,
                        center: .center,
                        startRadius: 0,
                        endRadius: size * 0.5
                    )
                )
                .frame(width: size, height: size)
                .overlay(
                    Group {
                        if showTexture {
                            GrainOverlay(intensity: textureIntensity, grainSize: 2.0)
                        }
                    }
                )
                .blur(radius: animate ? 30 : 18)
                .scaleEffect(animate ? 1.05 : 0.9)

            // Animated outer glow
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            orbColors.first?.opacity(0.5) ?? Color.clear,
                            Color.clear
                        ],
                        center: .center,
                        startRadius: size * 0.3,
                        endRadius: size * 0.7
                    )
                )
                .frame(width: size * 1.4, height: size * 1.4)
                .scaleEffect(animate ? 1.05 : 0.95)
                .opacity(animate ? 0.5 : 0.8)
        }
        .onAppear {
            // Slower, organic breathing animation
            withAnimation(.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
                animate = true
            }
        }
    }
}

// MARK: - Grain Overlay (Texture Effect)

struct GrainOverlay: View {
    var intensity: Double = 0.15
    var grainSize: CGFloat = 2.0
    
    var body: some View {
        Canvas { context, size in
            let cols = Int(size.width / grainSize) + 1
            let rows = Int(size.height / grainSize) + 1
            
            for row in 0..<rows {
                for col in 0..<cols {
                    let x = CGFloat(col) * grainSize
                    let y = CGFloat(row) * grainSize
                    
                    // Use deterministic pseudo-random based on position for stable pattern
                    let seed = UInt32(row * cols + col)
                    let randomValue = pseudoRandom(seed: seed)
                    let opacity = (0.3 + randomValue * 0.4) * intensity
                    
                    context.fill(
                        Path(ellipseIn: CGRect(x: x, y: y, width: grainSize, height: grainSize)),
                        with: .color(.white.opacity(opacity))
                    )
                }
            }
        }
        .blendMode(.overlay)
    }
    
    // Deterministic pseudo-random function for stable grain pattern
    private func pseudoRandom(seed: UInt32) -> Double {
        var hash = seed
        hash ^= hash << 13
        hash ^= hash >> 17
        hash ^= hash << 5
        return Double(hash % 1000) / 1000.0
    }
}

// MARK: - Pill Button Style

struct PillButtonStyle: ButtonStyle {
    var isProminent: Bool = true

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Theme.Typography.subheadline())
            .foregroundColor(isProminent ? .white : Theme.Colors.textPrimary)
            .padding(.horizontal, Theme.Spacing.lg)
            .padding(.vertical, Theme.Spacing.md)
            .background(
                Capsule()
                    .fill(isProminent ? Theme.Colors.accent : Theme.Colors.card)
            )
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
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
            .shadow(color: .black.opacity(0.04), radius: 12, x: 0, y: 4)
    }
}

// MARK: - Mood Pill (Horizontal scrolling mood selector)

struct MoodPill: View {
    let index: Int
    let isSelected: Bool
    let action: () -> Void

    private let moodIcons: [AppIcon] = [.cloud, .cloud, .sun, .sun, .sparkles]
    private let moodLabels = ["Low", "Down", "Okay", "Good", "Great"]

    var body: some View {
        Button(action: action) {
            VStack(spacing: Theme.Spacing.sm) {
                ZStack {
                    // Gradient background circle
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: gradientColors,
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 64, height: 64)
                        .scaleEffect(isSelected ? 1.1 : 1.0) // Scale up when selected
                        .shadow(color: gradientColors[0].opacity(0.4), radius: isSelected ? 12 : 6, y: isSelected ? 8 : 4)

                    // Icon
                    AppIconImage(icon: moodIcons[index], isSelected: true, size: 24)
                        .foregroundColor(.white.opacity(0.95))
                        .scaleEffect(isSelected ? 1.1 : 1.0)
                }

                // Label
                if isSelected {
                    Text(moodLabels[index])
                        .font(Theme.Typography.captionMedium())
                        .foregroundColor(Theme.Colors.textPrimary)
                        .transition(.opacity.combined(with: .scale))
                }
            }
            .animation(.spring(response: 0.4, dampingFraction: 0.7), value: isSelected)
        }
        .buttonStyle(.plain)
    }

    private var gradientColors: [Color] {
        guard index >= 0 && index < Theme.Colors.moodPillGradients.count else {
            return [.gray, .gray]
        }
        return Theme.Colors.moodPillGradients[index]
    }
}

// MARK: - Voice Input Pill Button

struct VoiceInputPill: View {
    var isRecording: Bool
    var action: () -> Void

    @State private var waveformPhase: Double = 0

    var body: some View {
        Button(action: action) {
            HStack(spacing: Theme.Spacing.md) {
                // Waveform or mic icon
                if isRecording {
                    HStack(spacing: 3) {
                        ForEach(0..<4, id: \.self) { i in
                            RoundedRectangle(cornerRadius: 1)
                                .fill(Theme.Colors.textPrimary)
                                .frame(width: 3, height: waveHeight(for: i))
                                .animation(
                                    .easeInOut(duration: 0.4)
                                    .repeatForever()
                                    .delay(Double(i) * 0.1),
                                    value: waveformPhase
                                )
                        }
                    }
                    .frame(width: 24)
                } else {
                    AppIconImage(icon: .microphone, isSelected: true, size: 18)
                        .foregroundColor(Theme.Colors.textPrimary)
                }

                Text(isRecording ? "Recording..." : "Voice Input")
                    .font(Theme.Typography.subheadline())
                    .foregroundColor(Theme.Colors.textPrimary)
            }
            .padding(.horizontal, Theme.Spacing.lg)
            .padding(.vertical, Theme.Spacing.md + 4)
            .background(
                Capsule()
                    .strokeBorder(Theme.Colors.textPrimary.opacity(0.3), lineWidth: 1.5)
                    .background(Capsule().fill(Theme.Colors.card.opacity(0.8)))
            )
        }
        .buttonStyle(.plain)
        .onAppear {
            waveformPhase = 1
        }
    }

    private func waveHeight(for index: Int) -> CGFloat {
        let baseHeight: CGFloat = 12
        let variation: CGFloat = 8
        return baseHeight + (sin(waveformPhase + Double(index)) * variation)
    }
}

// MARK: - Preview

#Preview("Theme Components") {
    ZStack {
        Theme.Colors.background.ignoresSafeArea()

        VStack(spacing: 40) {
            AnimatedGradientOrb()

            HStack(spacing: 16) {
                ForEach(0..<5) { i in
                    MoodPill(index: i, isSelected: i == 3, action: {})
                }
            }

            VoiceInputPill(isRecording: false, action: {})

            Button("Get Started") {}
                .buttonStyle(PillButtonStyle())
        }
    }
}
