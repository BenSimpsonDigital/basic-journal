//
//  ScreenHeaderView.swift
//  BasicJournal
//
//  Created by Ben Simpson on 2026-01-26.
//

import SwiftUI

struct ScreenHeaderView: View {
    let title: String
    let subtitle: String
    var alignment: HorizontalAlignment = .leading
    var trailingIcon: AppIcon? = nil
    var trailingAction: (() -> Void)? = nil

    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: alignment, spacing: Theme.Spacing.sm) {
                if !subtitle.isEmpty {
                    Text(subtitle)
                        .font(Theme.Typography.caption())
                        .foregroundColor(Theme.Colors.textTertiary)
                        .textCase(.uppercase)
                        .tracking(1.2)
                }

                Text(title)
                    .font(Theme.Typography.displayLarge())
                    .foregroundColor(Theme.Colors.textPrimary)
                    .multilineTextAlignment(textAlignment)
            }
            .frame(maxWidth: .infinity, alignment: frameAlignment)

            // Trailing action button
            if let icon = trailingIcon, let action = trailingAction {
                Button(action: action) {
                    AppIconImage(icon: icon, isSelected: false, size: 22)
                        .foregroundColor(Theme.Colors.textSecondary)
                        .frame(width: 44, height: 44)
                }
            }
        }
        .padding(.top, Theme.Spacing.lg)
        .padding(.bottom, Theme.Spacing.md)
        .padding(.horizontal, Theme.Spacing.lg)
    }
    
    private var frameAlignment: Alignment {
        switch alignment {
        case .leading: return .leading
        case .trailing: return .trailing
        default: return .center
        }
    }
    
    private var textAlignment: TextAlignment {
        switch alignment {
        case .leading: return .leading
        case .trailing: return .trailing
        default: return .center
        }
    }
}

#Preview {
    VStack(spacing: 0) {
        ScreenHeaderView(
            title: "Settings",
            subtitle: "Configure",
            alignment: .leading
        )
        .border(.red)
        
        ScreenHeaderView(
            title: "Today",
            subtitle: "Wednesday",
            alignment: .center
        )
        .border(.blue)
    }
}
