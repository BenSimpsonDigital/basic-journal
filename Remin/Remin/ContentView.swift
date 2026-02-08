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
        .background(Theme.Colors.background.ignoresSafeArea())
    }
}

// MARK: - Main Tab View

struct MainTabView: View {
    @ObservedObject var viewModel: JournalViewModel
    @Binding var selectedTab: Int
    @State private var showSettings = false
    @Environment(\.scenePhase) private var scenePhase

    private var shouldShowTabBar: Bool {
        !(selectedTab == 0 && viewModel.isTodayWorkflowActive)
    }

    init(viewModel: JournalViewModel, selectedTab: Binding<Int>) {
        self.viewModel = viewModel
        self._selectedTab = selectedTab
    }

    var body: some View {
        GeometryReader { proxy in
            HStack(spacing: 0) {
                TodayView(viewModel: viewModel)
                    .frame(width: proxy.size.width)

                JournalView(viewModel: viewModel)
                    .frame(width: proxy.size.width)
            }
            .frame(width: proxy.size.width * 2, alignment: .leading)
            .offset(x: -CGFloat(selectedTab) * proxy.size.width)
            .animation(.easeInOut(duration: 0.3), value: selectedTab)
            .frame(width: proxy.size.width, height: proxy.size.height, alignment: .leading)
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            if shouldShowTabBar {
                MinimalTabBar(
                    selectedTab: $selectedTab,
                    onSettingsTap: { showSettings = true }
                )
                .transition(.move(edge: .bottom).combined(with: .opacity))
                .zIndex(1)
            }
        }
        .animation(.easeInOut(duration: 0.2), value: shouldShowTabBar)
        .background(Theme.Colors.background.ignoresSafeArea())
        .ignoresSafeArea(.keyboard)
        .sheet(isPresented: $showSettings) {
            SettingsView(viewModel: viewModel)
        }
        // Navigate to Journal when user dismisses starting prompt
        .onChange(of: viewModel.shouldNavigateToTimeline) { _, shouldNavigate in
            if shouldNavigate {
                withAnimation(.easeInOut(duration: 0.3)) {
                    selectedTab = 1
                }
                viewModel.shouldNavigateToTimeline = false
            }
        }
        // Reset to ready-to-record when returning to Today tab after dismissing starting prompt
        .onChange(of: selectedTab) { _, newTab in
            if newTab == 0 && viewModel.hasSeenStartingPromptToday && viewModel.todayEntry == nil {
                viewModel.flowState = .recordPrompt
            }
        }
        // Check for daily reset when app becomes active
        .onChange(of: scenePhase) { _, newPhase in
            if newPhase == .active {
                viewModel.checkAndResetDailyPrompt()

                if viewModel.registerAppOpenAndPrepareDailyWorkflowIfNeeded() {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        selectedTab = 0
                    }
                }

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
            HStack(spacing: 0) {
                // Today tab
                TabBarItem(
                    icon: .sun,
                    label: "Today",
                    isSelected: selectedTab == 0,
                    action: {
                        guard selectedTab != 0 else { return }
                        withAnimation(.easeInOut(duration: 0.3)) {
                            selectedTab = 0
                        }
                    }
                )
                .frame(maxWidth: .infinity)

                // Journal tab
                TabBarItem(
                    icon: .documentText,
                    label: "Journal",
                    isSelected: selectedTab == 1,
                    action: {
                        guard selectedTab != 1 else { return }
                        withAnimation(.easeInOut(duration: 0.3)) {
                            selectedTab = 1
                        }
                    }
                )
                .frame(maxWidth: .infinity)

                // Profile button (opens sheet)
                TabBarItem(
                    icon: .user,
                    label: "Profile",
                    isSelected: false,
                    action: onSettingsTap
                )
                .frame(maxWidth: .infinity)
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
                    .font(Theme.Typography.labelSmall())
            }
            .foregroundColor(isSelected ? Theme.Colors.textPrimary : Theme.Colors.textTertiary)
            .frame(maxWidth: .infinity)
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
