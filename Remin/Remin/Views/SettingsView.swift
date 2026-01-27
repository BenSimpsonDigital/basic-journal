//
//  SettingsView.swift
//  Remin
//
//  One Thing - Daily Voice Journal
//  Settings with elegant design and soft cards
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: JournalViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                Theme.Colors.background
                    .ignoresSafeArea()

                // Decorative orb
                GeometryReader { geo in
                    GradientOrb(size: 200, opacity: 0.2, blur: 80)
                        .offset(x: -60, y: geo.size.height * 0.6)
                }
                .ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(spacing: Theme.Spacing.md) {
                        // Header
                        ScreenHeaderView(
                            title: "Settings",
                            subtitle: "",
                            alignment: .leading
                        )

                        // Reminder Section
                        SettingsSectionCard(title: "Reminders") {
                            VStack(spacing: 0) {
                                SettingsToggle(
                                    icon: .bell,
                                    title: "Daily Reminder",
                                    subtitle: "Get reminded to journal",
                                    isOn: $viewModel.reminderEnabled
                                )

                                if viewModel.reminderEnabled {
                                    Divider()
                                        .background(Theme.Colors.textTertiary.opacity(0.2))
                                        .padding(.leading, 60)

                                    SettingsTimeDisplay(
                                        icon: .clock,
                                        title: "Reminder Time",
                                        time: viewModel.reminderTime
                                    )
                                }
                            }
                        }  .padding(.horizontal, Theme.Spacing.lg)

                        // Privacy Section
                        SettingsSectionCard(title: "Privacy") {
                            SettingsPrivacyRow()
                        }  .padding(.horizontal, Theme.Spacing.lg)

                        // About Section
                        SettingsSectionCard(title: "About") {
                            VStack(spacing: 0) {
                                SettingsInfoRow(
                                    icon: .informationCircle,
                                    title: "Version",
                                    value: "1.0.0"
                                )

                                Divider()
                                    .background(Theme.Colors.textTertiary.opacity(0.2))
                                    .padding(.leading, 60)

                                SettingsInfoRow(
                                    icon: .wrench,
                                    title: "Build",
                                    value: "Prototype"
                                )
                            }
                        }  .padding(.horizontal, Theme.Spacing.lg)
                    }
                  
                }
            }
            .navigationBarHidden(true)
        }
    }
}

// MARK: - Settings Section Card

struct SettingsSectionCard<Content: View>: View {
    let title: String
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: Theme.Spacing.md) {
            Text(title)
                .font(Theme.Typography.captionMedium())
                .foregroundColor(Theme.Colors.textSecondary)
                .textCase(.uppercase)
                .tracking(0.8)
                .padding(.leading, Theme.Spacing.xs)

            content
                .background(Theme.Colors.card)
                .clipShape(RoundedRectangle(cornerRadius: Theme.Radius.large))
                .shadow(color: .black.opacity(0.03), radius: 10, x: 0, y: 3)
        }
    }
}

// MARK: - Settings Toggle

struct SettingsToggle: View {
    let icon: AppIcon
    let title: String
    let subtitle: String
    @Binding var isOn: Bool

    var body: some View {
        HStack(spacing: Theme.Spacing.md) {
            // Icon
            ZStack {
                Circle()
                    .fill(Theme.Colors.accentSoft.opacity(0.3))
                    .frame(width: 40, height: 40)

                AppIconImage(icon: icon, isSelected: true, size: 16)
                    .foregroundColor(Theme.Colors.accent)
            }

            // Text
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(Theme.Typography.body())
                    .foregroundColor(Theme.Colors.textPrimary)

                Text(subtitle)
                    .font(Theme.Typography.caption())
                    .foregroundColor(Theme.Colors.textTertiary)
            }

            Spacer()

            // Toggle
            Toggle("", isOn: $isOn)
                .labelsHidden()
                .tint(Theme.Colors.accent)
        }
        .padding(.horizontal, Theme.Spacing.md)
        .padding(.vertical, Theme.Spacing.md)
    }
}

// MARK: - Settings Time Display

struct SettingsTimeDisplay: View {
    let icon: AppIcon
    let title: String
    let time: Date

    private var formattedTime: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: time)
    }

    var body: some View {
        HStack(spacing: Theme.Spacing.md) {
            // Icon
            ZStack {
                Circle()
                    .fill(Theme.Colors.accentSoft.opacity(0.3))
                    .frame(width: 40, height: 40)

                AppIconImage(icon: icon, isSelected: true, size: 16)
                    .foregroundColor(Theme.Colors.accent)
            }

            // Text
            Text(title)
                .font(Theme.Typography.body())
                .foregroundColor(Theme.Colors.textPrimary)

            Spacer()

            // Time badge
            Text(formattedTime)
                .font(Theme.Typography.captionMedium())
                .foregroundColor(Theme.Colors.textSecondary)
                .padding(.horizontal, Theme.Spacing.md)
                .padding(.vertical, Theme.Spacing.sm)
                .background(Theme.Colors.accentSoft.opacity(0.2))
                .clipShape(Capsule())
        }
        .padding(.horizontal, Theme.Spacing.md)
        .padding(.vertical, Theme.Spacing.md)
    }
}

// MARK: - Settings Info Row

struct SettingsInfoRow: View {
    let icon: AppIcon
    let title: String
    let value: String

    var body: some View {
        HStack(spacing: Theme.Spacing.md) {
            // Icon
            ZStack {
                Circle()
                    .fill(Theme.Colors.accentSoft.opacity(0.3))
                    .frame(width: 40, height: 40)

                AppIconImage(icon: icon, isSelected: true, size: 16)
                    .foregroundColor(Theme.Colors.accent)
            }

            // Title
            Text(title)
                .font(Theme.Typography.body())
                .foregroundColor(Theme.Colors.textPrimary)

            Spacer()

            // Value
            Text(value)
                .font(Theme.Typography.body())
                .foregroundColor(Theme.Colors.textTertiary)
        }
        .padding(.horizontal, Theme.Spacing.md)
        .padding(.vertical, Theme.Spacing.md)
    }
}

// MARK: - Privacy Row

struct SettingsPrivacyRow: View {
    var body: some View {
        HStack(spacing: Theme.Spacing.md) {
            // Icon
            ZStack {
                Circle()
                    .fill(Theme.Colors.accentSoft.opacity(0.3))
                    .frame(width: 40, height: 40)

                AppIconImage(icon: .shieldCheck, isSelected: true, size: 16)
                    .foregroundColor(Theme.Colors.accent)
            }

            // Text
            VStack(alignment: .leading, spacing: 4) {
                Text("Your data stays private")
                    .font(Theme.Typography.body())
                    .foregroundColor(Theme.Colors.textPrimary)

                Text("All entries are stored on your device. Nothing is shared.")
                    .font(Theme.Typography.caption())
                    .foregroundColor(Theme.Colors.textTertiary)
                    .fixedSize(horizontal: false, vertical: true)
            }

            Spacer()
        }
        .padding(.horizontal, Theme.Spacing.md)
        .padding(.vertical, Theme.Spacing.md)
    }
}

// MARK: - Preview

#Preview {
    SettingsView(viewModel: JournalViewModel())
}
