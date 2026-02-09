//
//  ReminSurfaceStyle.swift
//  Remin
//
//  Shared luminous backdrop and glass card primitives.
//

import SwiftUI

enum ReminSurfaceLayout {
    static let maxContentWidth: CGFloat = 500
    static let horizontalGutter: CGFloat = Theme.Spacing.lg
}

struct ReminLuminousBackdrop: View {
    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            let height = proxy.size.height

            ZStack {
                LinearGradient(
                    colors: [
                        Color(red: 0.94, green: 0.94, blue: 0.95),
                        Color(red: 0.96, green: 0.96, blue: 0.97),
                        Color(red: 0.98, green: 0.98, blue: 0.99),
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )

                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color.white.opacity(0.64),
                                Color.white.opacity(0.00),
                            ],
                            center: .center,
                            startRadius: 16,
                            endRadius: width * 0.62
                        )
                    )
                    .frame(width: width * 1.1, height: width * 1.1)
                    .offset(x: -width * 0.33, y: -height * 0.30)
                    .blur(radius: 10)

                Ellipse()
                    .fill(
                        LinearGradient(
                            colors: [
                                Color.white.opacity(0.52),
                                Color.white.opacity(0.06),
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: width * 1.35, height: height * 0.46)
                    .rotationEffect(.degrees(-11))
                    .offset(x: width * 0.18, y: -height * 0.34)
                    .blur(radius: 1.4)

                Ellipse()
                    .stroke(Color.white.opacity(0.26), lineWidth: 1)
                    .frame(width: width * 1.38, height: height * 0.49)
                    .rotationEffect(.degrees(-11))
                    .offset(x: width * 0.18, y: -height * 0.34)
                    .blur(radius: 0.4)

                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color.white.opacity(0.18),
                                Color.white.opacity(0.00),
                            ],
                            center: .center,
                            startRadius: 10,
                            endRadius: width * 0.6
                        )
                    )
                    .frame(width: width * 1.05, height: width * 1.05)
                    .offset(x: width * 0.30, y: height * 0.30)
                    .blur(radius: 18)
            }
            .ignoresSafeArea()
        }
    }
}

struct ReminSectionCard<Content: View>: View {
    let title: String
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: Theme.Spacing.sm) {
            Text(title)
                .font(Theme.Typography.captionMedium())
                .foregroundColor(Theme.Colors.textPrimary.opacity(0.58))
                .textCase(.uppercase)
                .tracking(1.4)
                .padding(.horizontal, Theme.Spacing.sm)
                .frame(maxWidth: .infinity, alignment: .leading)

            content
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .fill(Color.white.opacity(0.80))
                )
                .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .stroke(Color.black.opacity(0.08), lineWidth: 1)
                )
                .shadow(color: Color.black.opacity(0.08), radius: 14, x: 0, y: 6)
        }
    }
}
