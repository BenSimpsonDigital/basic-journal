//
//  OnboardingView.swift
//  Remin
//
//  One Thing - Daily Voice Journal
//  Editorial onboarding — clean typography, minimal geometric accents
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel: JournalViewModel
    @State private var currentPage = 0
    @State private var nameInput: String = ""
    @FocusState private var isNameFieldFocused: Bool

    private let totalPages = 3

    var body: some View {
        ZStack {
            Theme.Colors.background
                .ignoresSafeArea()

            VStack(spacing: 0) {
                Spacer()

                // Page content
                TabView(selection: $currentPage) {
                    OnboardingPageView(
                        title: "One moment,\neach day",
                        subtitle: "Capture a quick voice note about your day.\nNo pressure, no structure.",
                        icon: .microphone
                    )
                    .tag(0)

                    OnboardingPageView(
                        title: "Your words,\npreserved",
                        subtitle: "Your recordings are transcribed and saved\nprivately on your device.",
                        icon: .shieldCheck
                    )
                    .tag(1)

                    OnboardingNamePageView(
                        nameInput: $nameInput,
                        isNameFieldFocused: $isNameFieldFocused
                    )
                    .tag(2)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))

                Spacer()

                // Page indicators
                HStack(spacing: Theme.Spacing.sm) {
                    ForEach(0..<totalPages, id: \.self) { index in
                        Capsule()
                            .fill(currentPage == index
                                  ? Theme.Colors.accent
                                  : Theme.Colors.border)
                            .frame(width: currentPage == index ? 24 : 8, height: 8)
                            .animation(.easeOut(duration: 0.25), value: currentPage)
                    }
                }
                .padding(.bottom, Theme.Spacing.lg)
            }
            .safeAreaInset(edge: .bottom) {
                BottomActionDock {
                    Button(currentPage < totalPages - 1 ? "Continue" : "Get Started") {
                        if currentPage < totalPages - 1 {
                            withAnimation(.easeOut(duration: 0.3)) {
                                currentPage += 1
                            }
                        } else {
                            let trimmed = nameInput.trimmingCharacters(in: .whitespacesAndNewlines)
                            if !trimmed.isEmpty {
                                viewModel.userName = trimmed
                            }
                            viewModel.completeOnboarding()
                        }
                    }
                    .buttonStyle(PrimaryDockButtonStyle())
                } secondary: {
                    if currentPage == totalPages - 1 {
                        Button("Skip") {
                            viewModel.completeOnboarding()
                        }
                        .buttonStyle(SecondaryDockButtonStyle())
                    }
                }
            }
        }
    }
}

// MARK: - Onboarding Page

struct OnboardingPageView: View {
    let title: String
    let subtitle: String
    var icon: AppIcon? = nil

    var body: some View {
        VStack(spacing: Theme.Spacing.xl) {
            // Icon
            if let icon = icon {
                AppIconImage(icon: icon, isSelected: false, size: 32)
                    .foregroundColor(Theme.Colors.textTertiary)
                    .padding(.bottom, Theme.Spacing.md)
            }

            // Title
            Text(title)
                .font(Theme.Typography.displayLarge())
                .foregroundColor(Theme.Colors.textPrimary)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .padding(.horizontal, Theme.Spacing.lg)

            // Subtitle
            Text(subtitle)
                .font(Theme.Typography.body())
                .foregroundColor(Theme.Colors.textSecondary)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .padding(.horizontal, Theme.Spacing.lg)
        }
    }
}

// MARK: - Onboarding Name Page

struct OnboardingNamePageView: View {
    @Binding var nameInput: String
    var isNameFieldFocused: FocusState<Bool>.Binding

    var body: some View {
        VStack(spacing: Theme.Spacing.xl) {
            AppIconImage(icon: .user, isSelected: false, size: 32)
                .foregroundColor(Theme.Colors.textTertiary)
                .padding(.bottom, Theme.Spacing.md)

            Text("What should\nwe call you?")
                .font(Theme.Typography.displayLarge())
                .foregroundColor(Theme.Colors.textPrimary)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .padding(.horizontal, Theme.Spacing.lg)

            Text("This is just for your greeting.\nYou can change it later in Settings.")
                .font(Theme.Typography.body())
                .foregroundColor(Theme.Colors.textSecondary)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .padding(.horizontal, Theme.Spacing.lg)

            // Name input field
            TextField("Your name", text: $nameInput)
                .font(Theme.Typography.headline())
                .foregroundColor(Theme.Colors.textPrimary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, Theme.Spacing.lg)
                .padding(.vertical, Theme.Spacing.md)
                .background(Theme.Colors.surface)
                .clipShape(RoundedRectangle(cornerRadius: Theme.Radius.medium))
                .overlay(
                    RoundedRectangle(cornerRadius: Theme.Radius.medium)
                        .strokeBorder(Theme.Colors.border, lineWidth: 1)
                )
                .padding(.horizontal, Theme.Spacing.xxl)
                .focused(isNameFieldFocused)
                .textContentType(.givenName)
                .autocorrectionDisabled()
                .submitLabel(.done)
        }
    }
}

// MARK: - Preview

#Preview {
    OnboardingView(viewModel: JournalViewModel())
}
