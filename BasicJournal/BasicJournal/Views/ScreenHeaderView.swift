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
    
    var body: some View {
        VStack(alignment: alignment, spacing: Theme.Spacing.sm) {
            Text(subtitle)
                .font(Theme.Typography.caption())
                .foregroundColor(Theme.Colors.textTertiary)
                .textCase(.uppercase)
                .tracking(1.2)
            
            Text(title)
                .font(Theme.Typography.displayLarge())
                .foregroundColor(Theme.Colors.textPrimary)
                .multilineTextAlignment(textAlignment)
        }
        .frame(maxWidth: .infinity, alignment: frameAlignment)
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
