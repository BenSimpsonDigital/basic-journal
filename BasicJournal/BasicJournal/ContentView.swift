//
//  ContentView.swift
//  BasicJournal
//
//  One Thing - Daily Voice Journal
//  Main app structure with elegant tab navigation
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = JournalViewModel()
    @State private var selectedTab = 0

    var body: some View {
        Group {
            if viewModel.hasCompletedOnboarding {
                MainTabView(viewModel: viewModel, selectedTab: $selectedTab)
            } else {
                OnboardingView(viewModel: viewModel)
            }
        }
    }
}

// MARK: - Main Tab View

struct MainTabView: View {
    @ObservedObject var viewModel: JournalViewModel
    @Binding var selectedTab: Int

    var body: some View {
        ZStack(alignment: .bottom) {
            // Content
            TabView(selection: $selectedTab) {
                TodayView(viewModel: viewModel)
                    .tag(0)

                TimelineView(viewModel: viewModel)
                    .tag(1)

                SearchView(viewModel: viewModel)
                    .tag(2)

                SettingsView(viewModel: viewModel)
                    .tag(3)
            }

            // Custom Tab Bar
            CustomTabBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(.keyboard)
    }
}

// MARK: - Custom Tab Bar

struct CustomTabBar: View {
    @Binding var selectedTab: Int

    private let tabs: [(icon: AppIcon, label: String)] = [
        (.sun, "Today"),
        (.calendar, "Timeline"),
        (.magnifyingGlass, "Search"),
        (.cog, "Settings")
    ]

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<tabs.count, id: \.self) { index in
                TabBarButton(
                    icon: tabs[index].icon,
                    label: tabs[index].label,
                    isSelected: selectedTab == index
                ) {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        selectedTab = index
                    }
                }
            }
        }
        .padding(.horizontal, Theme.Spacing.md)
        .padding(.top, Theme.Spacing.sm)
        .padding(.bottom, Theme.Spacing.md)
        .background(
            Rectangle()
                .fill(.ultraThinMaterial)
                .overlay(
                    Rectangle()
                        .fill(Theme.Colors.card.opacity(0.8))
                )
                .shadow(color: .black.opacity(0.05), radius: 8, y: -2)
        )
    }
}

// MARK: - Tab Bar Button

struct TabBarButton: View {
    let icon: AppIcon
    let label: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                AppIconImage(icon: icon, isSelected: isSelected, size: 24)
                    .foregroundColor(isSelected ? Theme.Colors.accent : Theme.Colors.textTertiary)

                Text(label)
                    .font(.system(size: 10, weight: isSelected ? .semibold : .regular))
                    .foregroundColor(isSelected ? Theme.Colors.accent : Theme.Colors.textTertiary)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, Theme.Spacing.xs)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Preview

#Preview("Main App") {
    ContentView()
}

#Preview("With Onboarding Complete") {
    let viewModel = JournalViewModel()
    viewModel.hasCompletedOnboarding = true
    return MainTabView(viewModel: viewModel, selectedTab: .constant(0))
}
