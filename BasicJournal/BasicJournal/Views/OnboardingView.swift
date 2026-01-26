//
//  OnboardingView.swift
//  BasicJournal
//
//  One Thing - Daily Voice Journal
//  Elegant onboarding with soft gradients and serif typography
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel: JournalViewModel
    @State private var currentPage = 0

    var body: some View {
        ZStack {
            // Background
            Theme.Colors.background
                .ignoresSafeArea()

            // Decorative gradient orbs
            GeometryReader { geo in
                // Top-right orb
                GradientOrb(size: 350, opacity: 0.5, blur: 100)
                    .offset(x: geo.size.width * 0.5, y: -100)

                // Bottom-left orb
                GradientOrb(size: 280, opacity: 0.4, blur: 90)
                    .offset(x: -80, y: geo.size.height * 0.6)
            }
            .ignoresSafeArea()

            VStack(spacing: 0) {
                Spacer()

                // Page content
                TabView(selection: $currentPage) {
                    OnboardingPageView(
                        title: "One moment,\neach day",
                        subtitle: "Capture a quick voice note about your day.\nNo pressure, no structure.",
                        showOrb: true
                    )
                    .tag(0)

                    OnboardingPageView(
                        title: "Your words,\npreserved",
                        subtitle: "Your recordings are transcribed and saved\nprivately on your device.",
                        showOrb: true
                    )
                    .tag(1)

                    OnboardingPageView(
                        title: "Track how\nyou feel",
                        subtitle: "Add a simple mood to each entry.\nLook back anytime.",
                        showMoodSelector: true
                    )
                    .tag(2)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))

                Spacer()

                // Page indicators
                HStack(spacing: Theme.Spacing.sm) {
                    ForEach(0..<3) { index in
                        Capsule()
                            .fill(currentPage == index
                                  ? Theme.Colors.accent
                                  : Theme.Colors.textTertiary.opacity(0.3))
                            .frame(width: currentPage == index ? 24 : 8, height: 8)
                            .animation(.spring(response: 0.3), value: currentPage)
                    }
                }
                .padding(.bottom, Theme.Spacing.xl)

                // Bottom button
                Button(action: {
                    if currentPage < 2 {
                        withAnimation(.spring(response: 0.4)) {
                            currentPage += 1
                        }
                    } else {
                        viewModel.completeOnboarding()
                    }
                }) {
                    Text(currentPage < 2 ? "Continue" : "Get Started")
                }
                .buttonStyle(PillButtonStyle())
                .padding(.horizontal, Theme.Spacing.xxl)
                .padding(.bottom, Theme.Spacing.xxl)
            }
        }
    }
}

// MARK: - Onboarding Page

struct OnboardingPageView: View {
    let title: String
    let subtitle: String
    var showOrb: Bool = false
    var showMoodSelector: Bool = false

    @State private var selectedMoodPreview: Int? = 3

    var body: some View {
        VStack(spacing: Theme.Spacing.xl) {
            // Visual element
            if showOrb {
                AnimatedGradientOrb(size: 140)
                    .padding(.bottom, Theme.Spacing.lg)
            } else if showMoodSelector {
                // Preview mood selector
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: Theme.Spacing.md) {
                        ForEach(0..<5) { index in
                            MoodPill(
                                index: index,
                                isSelected: selectedMoodPreview == index,
                                action: { selectedMoodPreview = index }
                            )
                        }
                    }
                    .padding(.horizontal, Theme.Spacing.lg)
                }
                .padding(.bottom, Theme.Spacing.md)
            }

            // Title - elegant serif
            Text(title)
                .font(Theme.Typography.displayLarge())
                .foregroundColor(Theme.Colors.textPrimary)
                .multilineTextAlignment(.center)
                .lineSpacing(4)

            // Subtitle
            Text(subtitle)
                .font(Theme.Typography.body())
                .foregroundColor(Theme.Colors.textSecondary)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .padding(.horizontal, Theme.Spacing.lg)
        }
        .padding(.horizontal, Theme.Spacing.lg)
    }
}

// MARK: - Preview

#Preview {
    OnboardingView(viewModel: JournalViewModel())
}
