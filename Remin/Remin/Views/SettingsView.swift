//
//  SettingsView.swift
//  Remin
//
//  One Thing - Daily Voice Journal
//  Settings presented as a sheet with clean, minimal design
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: JournalViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                Theme.Colors.background
                    .ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(spacing: Theme.Spacing.md) {
                        // Profile Section
                        SettingsSectionCard(title: "Profile") {
                            SettingsNameRow(
                                userName: $viewModel.userName
                            )
                        }
                        .padding(.horizontal, Theme.Spacing.lg)

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
                                        .foregroundColor(Theme.Colors.border)
                                        .padding(.leading, 60)

                                    SettingsTimeDisplay(
                                        icon: .clock,
                                        title: "Reminder Time",
                                        time: viewModel.reminderTime
                                    )
                                }
                            }
                        }
                        .padding(.horizontal, Theme.Spacing.lg)

                        // Privacy Section
                        SettingsSectionCard(title: "Privacy") {
                            SettingsPrivacyRow()
                        }
                        .padding(.horizontal, Theme.Spacing.lg)

                        // About Section
                        SettingsSectionCard(title: "About") {
                            VStack(spacing: 0) {
                                SettingsInfoRow(
                                    icon: .informationCircle,
                                    title: "Version",
                                    value: "1.0.0"
                                )

                                Divider()
                                    .foregroundColor(Theme.Colors.border)
                                    .padding(.leading, 60)

                                SettingsInfoRow(
                                    icon: .wrench,
                                    title: "Build",
                                    value: "Prototype"
                                )
                            }
                        }
                        .padding(.horizontal, Theme.Spacing.lg)
                    }
                    .padding(.top, Theme.Spacing.md)
                    .padding(.bottom, Theme.Spacing.xxl)
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundColor(Theme.Colors.accent)
                }
            }
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
                .tracking(1.2)
                .padding(.leading, Theme.Spacing.xs)

            content
                .background(Theme.Colors.card)
                .clipShape(RoundedRectangle(cornerRadius: Theme.Radius.large))
                .overlay(
                    RoundedRectangle(cornerRadius: Theme.Radius.large)
                        .strokeBorder(Theme.Colors.border, lineWidth: 1)
                )
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
            ZStack {
                Circle()
                    .fill(Theme.Colors.surface)
                    .frame(width: 40, height: 40)

                AppIconImage(icon: icon, isSelected: true, size: 16)
                    .foregroundColor(Theme.Colors.accent)
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(Theme.Typography.body())
                    .foregroundColor(Theme.Colors.textPrimary)

                Text(subtitle)
                    .font(Theme.Typography.caption())
                    .foregroundColor(Theme.Colors.textTertiary)
            }

            Spacer()

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
            ZStack {
                Circle()
                    .fill(Theme.Colors.surface)
                    .frame(width: 40, height: 40)

                AppIconImage(icon: icon, isSelected: true, size: 16)
                    .foregroundColor(Theme.Colors.accent)
            }

            Text(title)
                .font(Theme.Typography.body())
                .foregroundColor(Theme.Colors.textPrimary)

            Spacer()

            Text(formattedTime)
                .font(Theme.Typography.captionMedium())
                .foregroundColor(Theme.Colors.textSecondary)
                .padding(.horizontal, Theme.Spacing.md)
                .padding(.vertical, Theme.Spacing.sm)
                .background(Theme.Colors.surface)
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
            ZStack {
                Circle()
                    .fill(Theme.Colors.surface)
                    .frame(width: 40, height: 40)

                AppIconImage(icon: icon, isSelected: true, size: 16)
                    .foregroundColor(Theme.Colors.accent)
            }

            Text(title)
                .font(Theme.Typography.body())
                .foregroundColor(Theme.Colors.textPrimary)

            Spacer()

            Text(value)
                .font(Theme.Typography.body())
                .foregroundColor(Theme.Colors.textTertiary)
        }
        .padding(.horizontal, Theme.Spacing.md)
        .padding(.vertical, Theme.Spacing.md)
    }
}

// MARK: - Name Row

struct SettingsNameRow: View {
    @Binding var userName: String

    var body: some View {
        HStack(spacing: Theme.Spacing.md) {
            ZStack {
                Circle()
                    .fill(Theme.Colors.surface)
                    .frame(width: 40, height: 40)

                AppIconImage(icon: .user, isSelected: true, size: 16)
                    .foregroundColor(Theme.Colors.accent)
            }

            VStack(alignment: .leading, spacing: 2) {
                Text("Name")
                    .font(Theme.Typography.body())
                    .foregroundColor(Theme.Colors.textPrimary)

                TextField("Your name", text: $userName)
                    .font(Theme.Typography.caption())
                    .foregroundColor(Theme.Colors.textSecondary)
                    .textContentType(.givenName)
                    .autocorrectionDisabled()
                    .submitLabel(.done)
            }

            Spacer()
        }
        .padding(.horizontal, Theme.Spacing.md)
        .padding(.vertical, Theme.Spacing.md)
    }
}

// MARK: - Privacy Row

struct SettingsPrivacyRow: View {
    var body: some View {
        HStack(spacing: Theme.Spacing.md) {
            ZStack {
                Circle()
                    .fill(Theme.Colors.surface)
                    .frame(width: 40, height: 40)

                AppIconImage(icon: .shieldCheck, isSelected: true, size: 16)
                    .foregroundColor(Theme.Colors.accent)
            }

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
