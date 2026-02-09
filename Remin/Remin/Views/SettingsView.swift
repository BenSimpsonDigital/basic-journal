//
//  SettingsView.swift
//  Remin
//
//  One Thing - Daily Voice Journal
//  Settings presented as a sheet with a refined, soft-card visual language
//

import SwiftUI
import PhotosUI
import UIKit

private enum SettingsLayout {
    static let maxContentWidth: CGFloat = 500
    static let horizontalGutter: CGFloat = Theme.Spacing.lg
}

private enum SettingsRoute: Hashable {
    case profileDetail
}

struct SettingsView: View {
    @ObservedObject var viewModel: JournalViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                SettingsBackdrop()
                    .ignoresSafeArea()

                GeometryReader { proxy in
                    let contentWidth = max(
                        0,
                        min(SettingsLayout.maxContentWidth, proxy.size.width - (SettingsLayout.horizontalGutter * 2))
                    )

                    ScrollView(showsIndicators: false) {
                        VStack(spacing: Theme.Spacing.lg) {
                            topBar
                                .padding(.top, Theme.Spacing.lg)

                            SettingsSectionCard(title: "Profile") {
                                NavigationLink(value: SettingsRoute.profileDetail) {
                                    SettingsProfileSummaryRow(
                                        displayName: viewModel.profileDisplayName,
                                        profileImageData: viewModel.profileImageData
                                    )
                                }
                                .buttonStyle(.plain)
                            }

                            SettingsSectionCard(title: "Reminders") {
                                VStack(spacing: 0) {
                                    SettingsToggle(
                                        icon: .bell,
                                        title: "Daily Reminder",
                                        subtitle: "Get reminded to journal",
                                        isOn: $viewModel.reminderEnabled
                                    )

                                    if viewModel.reminderEnabled {
                                        SettingsSectionDivider()

                                        SettingsTimeDisplay(
                                            icon: .clock,
                                            title: "Reminder Time",
                                            time: viewModel.reminderTime
                                        )
                                    }
                                }
                            }

                            SettingsSectionCard(title: "Privacy") {
                                SettingsPrivacyRow()
                            }

                            SettingsSectionCard(title: "About") {
                                VStack(spacing: 0) {
                                    SettingsInfoRow(
                                        icon: .informationCircle,
                                        title: "Version",
                                        value: "1.0.0"
                                    )

                                    SettingsSectionDivider()

                                    SettingsInfoRow(
                                        icon: .wrench,
                                        title: "Build",
                                        value: "Prototype"
                                    )
                                }
                            }
                        }
                        .frame(width: contentWidth)
                        .frame(maxWidth: .infinity)
                        .padding(.top, Theme.Spacing.xs)
                        .padding(.bottom, Theme.Spacing.xxl)
                    }
                }
            }
            .navigationDestination(for: SettingsRoute.self) { route in
                switch route {
                case .profileDetail:
                    SettingsProfileDetailView(viewModel: viewModel)
                }
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }

    private var topBar: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Theme.Colors.textPrimary)
                    .frame(width: 34, height: 34)
                    .background(
                        Circle()
                            .fill(Color.white.opacity(0.85))
                            .overlay(
                                Circle()
                                    .stroke(Color.white.opacity(0.95), lineWidth: 1)
                            )
                    )
            }
            .buttonStyle(.plain)

            Spacer()

            Text("Settings")
                .font(Theme.Typography.subheadline())
                .foregroundColor(Theme.Colors.textPrimary)

            Spacer()

            Circle()
                .fill(Color.clear)
                .frame(width: 34, height: 34)
                .accessibilityHidden(true)
        }
        .padding(.horizontal, Theme.Spacing.xs)
    }
}

// MARK: - Backdrop

private struct SettingsBackdrop: View {
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

// MARK: - Settings Section Card

struct SettingsSectionCard<Content: View>: View {
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

private struct SettingsSectionDivider: View {
    var body: some View {
        Divider()
            .overlay(Color.black.opacity(0.12))
            .padding(.leading, 62)
    }
}

// MARK: - Icon Chip

private struct SettingsIconChip: View {
    let icon: AppIcon

    var body: some View {
        Circle()
            .fill(Color.white.opacity(0.80))
            .frame(width: 38, height: 38)
            .overlay(
                Circle()
                    .stroke(Color.white.opacity(0.92), lineWidth: 1)
            )
            .overlay(
                AppIconImage(icon: icon, isSelected: true, size: 16)
                    .foregroundColor(Theme.Colors.textSecondary)
            )
    }
}

// MARK: - Profile Summary

private struct SettingsProfileSummaryRow: View {
    let displayName: String
    let profileImageData: Data?

    var body: some View {
        HStack(spacing: Theme.Spacing.md) {
            ProfileAvatarView(imageData: profileImageData, size: 64)

            VStack(alignment: .leading, spacing: 2) {
                Text(displayName)
                    .font(Theme.Typography.displayBody())
                    .foregroundColor(Theme.Colors.textPrimary)
                    .lineLimit(1)

                Text("View Profile")
                    .font(Theme.Typography.bodySmall())
                    .foregroundColor(Theme.Colors.textSecondary)
            }

            Spacer(minLength: Theme.Spacing.sm)

            Image(systemName: "chevron.right")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(Theme.Colors.textSecondary.opacity(0.9))
        }
        .padding(.horizontal, Theme.Spacing.md)
        .padding(.vertical, Theme.Spacing.md)
        .contentShape(Rectangle())
    }
}

private struct ProfileAvatarView: View {
    let imageData: Data?
    let size: CGFloat

    private var avatarImage: UIImage? {
        guard let imageData, let image = UIImage(data: imageData) else {
            return nil
        }
        return image
    }

    var body: some View {
        Group {
            if let avatarImage {
                Image(uiImage: avatarImage)
                    .resizable()
                    .scaledToFill()
            } else {
                LinearGradient(
                    colors: [
                        Color(red: 0.98, green: 0.91, blue: 0.86),
                        Color(red: 0.89, green: 0.88, blue: 0.93),
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .overlay(
                    Image(systemName: "person.fill")
                        .font(.system(size: size * 0.42, weight: .light))
                        .foregroundColor(.white.opacity(0.96))
                )
            }
        }
        .frame(width: size, height: size)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(Color.white.opacity(0.85), lineWidth: 1)
        )
    }
}

private struct SettingsProfileDetailView: View {
    @ObservedObject var viewModel: JournalViewModel
    @Environment(\.dismiss) private var dismiss

    @State private var selectedPhotoItem: PhotosPickerItem?
    @State private var isLoadingPhoto = false

    var body: some View {
        ZStack {
            SettingsBackdrop()
                .ignoresSafeArea()

            GeometryReader { proxy in
                let contentWidth = max(
                    0,
                    min(SettingsLayout.maxContentWidth, proxy.size.width - (SettingsLayout.horizontalGutter * 2))
                )

                ScrollView(showsIndicators: false) {
                    VStack(spacing: Theme.Spacing.lg) {
                        topBar
                            .padding(.top, Theme.Spacing.lg)

                        SettingsSectionCard(title: "Profile Photo") {
                            VStack(spacing: Theme.Spacing.md) {
                                ProfileAvatarView(imageData: viewModel.profileImageData, size: 96)

                                PhotosPicker(selection: $selectedPhotoItem, matching: .images) {
                                    HStack(spacing: Theme.Spacing.sm) {
                                        Image(systemName: "photo")
                                            .font(.system(size: 14, weight: .medium))

                                        Text(isLoadingPhoto ? "Loading..." : "Change Photo")
                                            .font(Theme.Typography.bodySmall())
                                    }
                                    .foregroundColor(Theme.Colors.textPrimary)
                                    .padding(.horizontal, Theme.Spacing.md)
                                    .padding(.vertical, Theme.Spacing.sm)
                                    .background(
                                        Capsule()
                                            .fill(Color.white.opacity(0.82))
                                    )
                                    .overlay(
                                        Capsule()
                                            .stroke(Color.black.opacity(0.08), lineWidth: 1)
                                    )
                                }
                                .buttonStyle(.plain)
                                .disabled(isLoadingPhoto)

                                if viewModel.profileImageData != nil {
                                    Button {
                                        viewModel.profileImageData = nil
                                    } label: {
                                        Text("Remove Photo")
                                            .font(Theme.Typography.captionMedium())
                                            .foregroundColor(Theme.Colors.textSecondary)
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                            .padding(.horizontal, Theme.Spacing.md)
                            .padding(.vertical, Theme.Spacing.md)
                        }

                        SettingsSectionCard(title: "Name") {
                            VStack(spacing: Theme.Spacing.sm) {
                                SettingsProfileTextFieldRow(
                                    title: "First Name",
                                    placeholder: "First name",
                                    text: $viewModel.firstName,
                                    textContentType: .givenName
                                )

                                SettingsProfileTextFieldRow(
                                    title: "Last Name",
                                    placeholder: "Last name",
                                    text: $viewModel.lastName,
                                    textContentType: .familyName
                                )
                            }
                            .padding(.horizontal, Theme.Spacing.md)
                            .padding(.vertical, Theme.Spacing.md)
                        }
                    }
                    .frame(width: contentWidth)
                    .frame(maxWidth: .infinity)
                    .padding(.top, Theme.Spacing.xs)
                    .padding(.bottom, Theme.Spacing.xxl)
                }
            }
        }
        .toolbar(.hidden, for: .navigationBar)
        .onChange(of: selectedPhotoItem) { _, newValue in
            guard let newValue else { return }
            Task {
                await updateProfilePhoto(from: newValue)
            }
        }
    }

    private var topBar: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Theme.Colors.textPrimary)
                    .frame(width: 34, height: 34)
                    .background(
                        Circle()
                            .fill(Color.white.opacity(0.85))
                            .overlay(
                                Circle()
                                    .stroke(Color.white.opacity(0.95), lineWidth: 1)
                            )
                    )
            }
            .buttonStyle(.plain)

            Spacer()

            Text("Profile")
                .font(Theme.Typography.subheadline())
                .foregroundColor(Theme.Colors.textPrimary)

            Spacer()

            Circle()
                .fill(Color.clear)
                .frame(width: 34, height: 34)
                .accessibilityHidden(true)
        }
        .padding(.horizontal, Theme.Spacing.xs)
    }

    private func updateProfilePhoto(from item: PhotosPickerItem) async {
        guard !isLoadingPhoto else { return }

        isLoadingPhoto = true
        defer { isLoadingPhoto = false }

        guard
            let rawData = try? await item.loadTransferable(type: Data.self),
            let normalized = normalizedProfileImageData(from: rawData)
        else {
            return
        }

        viewModel.profileImageData = normalized
    }
}

private struct SettingsProfileTextFieldRow: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    let textContentType: UITextContentType

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(Theme.Typography.caption())
                .foregroundColor(Theme.Colors.textTertiary)

            TextField(placeholder, text: $text)
                .font(Theme.Typography.body())
                .foregroundColor(Theme.Colors.textPrimary)
                .textContentType(textContentType)
                .autocorrectionDisabled()
                .submitLabel(.done)
        }
        .padding(.horizontal, Theme.Spacing.md)
        .padding(.vertical, Theme.Spacing.sm)
        
    }
}

private func normalizedProfileImageData(from rawData: Data) -> Data? {
    guard let image = UIImage(data: rawData) else {
        return nil
    }

    let maxDimension: CGFloat = 512
    let largestDimension = max(image.size.width, image.size.height)
    let scale = largestDimension > maxDimension ? (maxDimension / largestDimension) : 1.0

    let targetSize = CGSize(width: image.size.width * scale, height: image.size.height * scale)
    guard targetSize.width > 0, targetSize.height > 0 else {
        return nil
    }

    let format = UIGraphicsImageRendererFormat.default()
    format.scale = 1
    let renderer = UIGraphicsImageRenderer(size: targetSize, format: format)

    let renderedImage = renderer.image { _ in
        image.draw(in: CGRect(origin: .zero, size: targetSize))
    }

    return renderedImage.jpegData(compressionQuality: 0.8)
}

// MARK: - Settings Toggle

struct SettingsToggle: View {
    let icon: AppIcon
    let title: String
    let subtitle: String
    @Binding var isOn: Bool

    var body: some View {
        HStack(spacing: Theme.Spacing.md) {
            SettingsIconChip(icon: icon)

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(Theme.Typography.body())
                    .foregroundColor(Theme.Colors.textPrimary)

                Text(subtitle)
                    .font(Theme.Typography.caption())
                    .foregroundColor(Theme.Colors.textTertiary)
            }

            Spacer(minLength: Theme.Spacing.sm)

            Toggle("", isOn: $isOn)
                .labelsHidden()
                .tint(Theme.Colors.accent)
        }
        .padding(.horizontal, Theme.Spacing.md)
        .padding(.vertical, 15)
        .frame(minHeight: 54)
    }
}

// MARK: - Settings Time Display

struct SettingsTimeDisplay: View {
    let icon: AppIcon
    let title: String
    let time: Date
    private let pillVerticalPadding: CGFloat = 6

    private var formattedTime: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: time)
    }

    var body: some View {
        HStack(spacing: Theme.Spacing.md) {
            SettingsIconChip(icon: icon)

            Text(title)
                .font(Theme.Typography.body())
                .foregroundColor(Theme.Colors.textPrimary)

            Spacer(minLength: Theme.Spacing.sm)

            Text(formattedTime)
                .font(Theme.Typography.captionMedium())
                .foregroundColor(Theme.Colors.textSecondary)
                .padding(.horizontal, Theme.Spacing.md)
                .padding(.vertical, pillVerticalPadding)
                .background(
                    Capsule()
                        .fill(Color.white.opacity(0.82))
                )
                .overlay(
                    Capsule()
                        .stroke(Color.white.opacity(0.95), lineWidth: 1)
                )
        }
        .padding(.horizontal, Theme.Spacing.md)
        .padding(.vertical, 15)
        .frame(minHeight: 54)
    }
}

// MARK: - Settings Info Row

struct SettingsInfoRow: View {
    let icon: AppIcon
    let title: String
    let value: String
    private let pillVerticalPadding: CGFloat = 6

    var body: some View {
        HStack(spacing: Theme.Spacing.md) {
            SettingsIconChip(icon: icon)

            Text(title)
                .font(Theme.Typography.body())
                .foregroundColor(Theme.Colors.textPrimary)

            Spacer(minLength: Theme.Spacing.sm)

            Text(value)
                .font(Theme.Typography.bodySmall())
                .foregroundColor(Theme.Colors.textSecondary)
                .padding(.horizontal, Theme.Spacing.sm)
                .padding(.vertical, pillVerticalPadding)
                .background(
                    Capsule()
                        .fill(Color.white.opacity(0.72))
                )
        }
        .padding(.horizontal, Theme.Spacing.md)
        .padding(.vertical, 15)
        .frame(minHeight: 54)
    }
}

// MARK: - Privacy Row

struct SettingsPrivacyRow: View {
    var body: some View {
        HStack(spacing: Theme.Spacing.md) {
            SettingsIconChip(icon: .shieldCheck)

            VStack(alignment: .leading, spacing: 5) {
                Text("Your data stays private")
                    .font(Theme.Typography.body())
                    .foregroundColor(Theme.Colors.textPrimary)

                Text("All entries are stored on your device. Nothing is shared.")
                    .font(Theme.Typography.caption())
                    .foregroundColor(Theme.Colors.textTertiary)
                    .fixedSize(horizontal: false, vertical: true)
            }

            Spacer(minLength: Theme.Spacing.sm)
        }
        .padding(.horizontal, Theme.Spacing.md)
        .padding(.vertical, 14)
        .frame(minHeight: 54)
    }
}

// MARK: - Preview

#Preview {
    SettingsView(viewModel: JournalViewModel())
}
