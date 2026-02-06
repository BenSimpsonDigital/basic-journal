//
//  ContentView.swift
//  Remin
//
//  One Thing - Daily Voice Journal
//  Main app structure with minimal 2-tab navigation
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
    @State private var showSettings = false
    @Environment(\.scenePhase) private var scenePhase

    init(viewModel: JournalViewModel, selectedTab: Binding<Int>) {
        self.viewModel = viewModel
        self._selectedTab = selectedTab
    }

    var body: some View {
        VStack(spacing: 0) {
            // Content
            TabView(selection: $selectedTab) {
                TodayView(viewModel: viewModel)
                    .tag(0)
                    .toolbar(.hidden, for: .tabBar)

                JournalView(viewModel: viewModel)
                    .tag(1)
                    .toolbar(.hidden, for: .tabBar)
            }

            // Minimal Tab Bar
            MinimalTabBar(
                selectedTab: $selectedTab,
                onSettingsTap: { showSettings = true }
            )
        }
        .ignoresSafeArea(.keyboard)
        .sheet(isPresented: $showSettings) {
            SettingsView(viewModel: viewModel)
        }
        // Navigate to Journal when user dismisses starting prompt
        .onChange(of: viewModel.shouldNavigateToTimeline) { _, shouldNavigate in
            if shouldNavigate {
                withAnimation(.easeOut(duration: 0.25)) {
                    selectedTab = 1
                }
                viewModel.shouldNavigateToTimeline = false
            }
        }
        // Reset to mood selection when returning to Today tab after dismissing starting prompt
        .onChange(of: selectedTab) { _, newTab in
            if newTab == 0 && viewModel.hasSeenStartingPromptToday && viewModel.todayEntry == nil {
                viewModel.flowState = .selectMood
            }
        }
        // Check for daily reset when app becomes active
        .onChange(of: scenePhase) { _, newPhase in
            if newPhase == .active {
                viewModel.checkAndResetDailyPrompt()
                if viewModel.shouldShowStartingPrompt() && selectedTab == 0 {
                    viewModel.flowState = .startingPrompt
                }
            }
        }
    }
}

// MARK: - Minimal Tab Bar

struct MinimalTabBar: View {
    @Binding var selectedTab: Int
    var onSettingsTap: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                // Today tab
                TabBarItem(
                    icon: .sun,
                    label: "Today",
                    isSelected: selectedTab == 0,
                    action: { selectedTab = 0 }
                )

                // Journal tab
                TabBarItem(
                    icon: .documentText,
                    label: "Journal",
                    isSelected: selectedTab == 1,
                    action: { selectedTab = 1 }
                )

                Spacer()

                // Settings gear (opens sheet)
                Button(action: onSettingsTap) {
                    AppIconImage(icon: .cog, isSelected: false, size: 22)
                        .foregroundColor(Theme.Colors.textTertiary)
                        .frame(width: 44, height: 44)
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, Theme.Spacing.lg)
            .padding(.vertical, Theme.Spacing.sm)
        }
        .background(
            Theme.Colors.background
                .shadow(color: .black.opacity(0.04), radius: 1, y: -1)
                .ignoresSafeArea(edges: .bottom)
        )
    }
}

// MARK: - Tab Bar Item

struct TabBarItem: View {
    let icon: AppIcon
    let label: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 2) {
                AppIconImage(icon: icon, isSelected: isSelected, size: 22)
                Text(label)
                    .font(.system(size: 10, weight: isSelected ? .semibold : .regular))
            }
            .foregroundColor(isSelected ? Theme.Colors.accent : Theme.Colors.textTertiary)
            .frame(width: 64)
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
