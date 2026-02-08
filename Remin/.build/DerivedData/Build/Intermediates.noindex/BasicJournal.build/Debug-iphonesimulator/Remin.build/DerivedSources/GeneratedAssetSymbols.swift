import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ColorResource {

    /// The "AccentColor" asset catalog color resource.
    static let accent = DeveloperToolsSupport.ColorResource(name: "AccentColor", bundle: resourceBundle)

    /// The "AccentPrimary" asset catalog color resource.
    static let accentPrimary = DeveloperToolsSupport.ColorResource(name: "AccentPrimary", bundle: resourceBundle)

    /// The "AccentSoft" asset catalog color resource.
    static let accentSoft = DeveloperToolsSupport.ColorResource(name: "AccentSoft", bundle: resourceBundle)

    /// The "Background" asset catalog color resource.
    static let background = DeveloperToolsSupport.ColorResource(name: "Background", bundle: resourceBundle)

    /// The "Border" asset catalog color resource.
    static let border = DeveloperToolsSupport.ColorResource(name: "Border", bundle: resourceBundle)

    /// The "CardBackground" asset catalog color resource.
    static let cardBackground = DeveloperToolsSupport.ColorResource(name: "CardBackground", bundle: resourceBundle)

    /// The "Surface" asset catalog color resource.
    static let surface = DeveloperToolsSupport.ColorResource(name: "Surface", bundle: resourceBundle)

    /// The "TextPrimary" asset catalog color resource.
    static let textPrimary = DeveloperToolsSupport.ColorResource(name: "TextPrimary", bundle: resourceBundle)

    /// The "TextSecondary" asset catalog color resource.
    static let textSecondary = DeveloperToolsSupport.ColorResource(name: "TextSecondary", bundle: resourceBundle)

    /// The "TextTertiary" asset catalog color resource.
    static let textTertiary = DeveloperToolsSupport.ColorResource(name: "TextTertiary", bundle: resourceBundle)

}

// MARK: - Image Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ImageResource {

    /// The "heroicon-academic-cap-outline" asset catalog image resource.
    static let heroiconAcademicCapOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-academic-cap-outline", bundle: resourceBundle)

    /// The "heroicon-academic-cap-solid" asset catalog image resource.
    static let heroiconAcademicCapSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-academic-cap-solid", bundle: resourceBundle)

    /// The "heroicon-adjustments-horizontal-outline" asset catalog image resource.
    static let heroiconAdjustmentsHorizontalOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-adjustments-horizontal-outline", bundle: resourceBundle)

    /// The "heroicon-adjustments-horizontal-solid" asset catalog image resource.
    static let heroiconAdjustmentsHorizontalSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-adjustments-horizontal-solid", bundle: resourceBundle)

    /// The "heroicon-adjustments-vertical-outline" asset catalog image resource.
    static let heroiconAdjustmentsVerticalOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-adjustments-vertical-outline", bundle: resourceBundle)

    /// The "heroicon-adjustments-vertical-solid" asset catalog image resource.
    static let heroiconAdjustmentsVerticalSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-adjustments-vertical-solid", bundle: resourceBundle)

    /// The "heroicon-archive-box-arrow-down-outline" asset catalog image resource.
    static let heroiconArchiveBoxArrowDownOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-archive-box-arrow-down-outline", bundle: resourceBundle)

    /// The "heroicon-archive-box-arrow-down-solid" asset catalog image resource.
    static let heroiconArchiveBoxArrowDownSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-archive-box-arrow-down-solid", bundle: resourceBundle)

    /// The "heroicon-archive-box-outline" asset catalog image resource.
    static let heroiconArchiveBoxOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-archive-box-outline", bundle: resourceBundle)

    /// The "heroicon-archive-box-solid" asset catalog image resource.
    static let heroiconArchiveBoxSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-archive-box-solid", bundle: resourceBundle)

    /// The "heroicon-archive-box-x-mark-outline" asset catalog image resource.
    static let heroiconArchiveBoxXMarkOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-archive-box-x-mark-outline", bundle: resourceBundle)

    /// The "heroicon-archive-box-x-mark-solid" asset catalog image resource.
    static let heroiconArchiveBoxXMarkSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-archive-box-x-mark-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-down-circle-outline" asset catalog image resource.
    static let heroiconArrowDownCircleOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-down-circle-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-down-circle-solid" asset catalog image resource.
    static let heroiconArrowDownCircleSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-down-circle-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-down-left-outline" asset catalog image resource.
    static let heroiconArrowDownLeftOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-down-left-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-down-left-solid" asset catalog image resource.
    static let heroiconArrowDownLeftSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-down-left-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-down-on-square-outline" asset catalog image resource.
    static let heroiconArrowDownOnSquareOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-down-on-square-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-down-on-square-solid" asset catalog image resource.
    static let heroiconArrowDownOnSquareSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-down-on-square-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-down-on-square-stack-outline" asset catalog image resource.
    static let heroiconArrowDownOnSquareStackOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-down-on-square-stack-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-down-on-square-stack-solid" asset catalog image resource.
    static let heroiconArrowDownOnSquareStackSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-down-on-square-stack-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-down-outline" asset catalog image resource.
    static let heroiconArrowDownOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-down-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-down-right-outline" asset catalog image resource.
    static let heroiconArrowDownRightOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-down-right-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-down-right-solid" asset catalog image resource.
    static let heroiconArrowDownRightSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-down-right-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-down-solid" asset catalog image resource.
    static let heroiconArrowDownSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-down-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-down-tray-outline" asset catalog image resource.
    static let heroiconArrowDownTrayOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-down-tray-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-down-tray-solid" asset catalog image resource.
    static let heroiconArrowDownTraySolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-down-tray-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-left-circle-outline" asset catalog image resource.
    static let heroiconArrowLeftCircleOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-left-circle-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-left-circle-solid" asset catalog image resource.
    static let heroiconArrowLeftCircleSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-left-circle-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-left-end-on-rectangle-outline" asset catalog image resource.
    static let heroiconArrowLeftEndOnRectangleOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-left-end-on-rectangle-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-left-end-on-rectangle-solid" asset catalog image resource.
    static let heroiconArrowLeftEndOnRectangleSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-left-end-on-rectangle-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-left-on-rectangle-outline" asset catalog image resource.
    static let heroiconArrowLeftOnRectangleOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-left-on-rectangle-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-left-on-rectangle-solid" asset catalog image resource.
    static let heroiconArrowLeftOnRectangleSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-left-on-rectangle-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-left-outline" asset catalog image resource.
    static let heroiconArrowLeftOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-left-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-left-solid" asset catalog image resource.
    static let heroiconArrowLeftSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-left-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-left-start-on-rectangle-outline" asset catalog image resource.
    static let heroiconArrowLeftStartOnRectangleOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-left-start-on-rectangle-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-left-start-on-rectangle-solid" asset catalog image resource.
    static let heroiconArrowLeftStartOnRectangleSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-left-start-on-rectangle-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-long-down-outline" asset catalog image resource.
    static let heroiconArrowLongDownOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-long-down-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-long-down-solid" asset catalog image resource.
    static let heroiconArrowLongDownSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-long-down-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-long-left-outline" asset catalog image resource.
    static let heroiconArrowLongLeftOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-long-left-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-long-left-solid" asset catalog image resource.
    static let heroiconArrowLongLeftSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-long-left-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-long-right-outline" asset catalog image resource.
    static let heroiconArrowLongRightOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-long-right-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-long-right-solid" asset catalog image resource.
    static let heroiconArrowLongRightSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-long-right-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-long-up-outline" asset catalog image resource.
    static let heroiconArrowLongUpOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-long-up-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-long-up-solid" asset catalog image resource.
    static let heroiconArrowLongUpSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-long-up-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-path-outline" asset catalog image resource.
    static let heroiconArrowPathOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-path-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-path-rounded-square-outline" asset catalog image resource.
    static let heroiconArrowPathRoundedSquareOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-path-rounded-square-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-path-rounded-square-solid" asset catalog image resource.
    static let heroiconArrowPathRoundedSquareSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-path-rounded-square-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-path-solid" asset catalog image resource.
    static let heroiconArrowPathSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-path-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-right-circle-outline" asset catalog image resource.
    static let heroiconArrowRightCircleOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-right-circle-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-right-circle-solid" asset catalog image resource.
    static let heroiconArrowRightCircleSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-right-circle-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-right-end-on-rectangle-outline" asset catalog image resource.
    static let heroiconArrowRightEndOnRectangleOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-right-end-on-rectangle-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-right-end-on-rectangle-solid" asset catalog image resource.
    static let heroiconArrowRightEndOnRectangleSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-right-end-on-rectangle-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-right-on-rectangle-outline" asset catalog image resource.
    static let heroiconArrowRightOnRectangleOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-right-on-rectangle-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-right-on-rectangle-solid" asset catalog image resource.
    static let heroiconArrowRightOnRectangleSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-right-on-rectangle-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-right-outline" asset catalog image resource.
    static let heroiconArrowRightOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-right-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-right-solid" asset catalog image resource.
    static let heroiconArrowRightSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-right-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-right-start-on-rectangle-outline" asset catalog image resource.
    static let heroiconArrowRightStartOnRectangleOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-right-start-on-rectangle-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-right-start-on-rectangle-solid" asset catalog image resource.
    static let heroiconArrowRightStartOnRectangleSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-right-start-on-rectangle-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-small-down-outline" asset catalog image resource.
    static let heroiconArrowSmallDownOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-small-down-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-small-down-solid" asset catalog image resource.
    static let heroiconArrowSmallDownSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-small-down-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-small-left-outline" asset catalog image resource.
    static let heroiconArrowSmallLeftOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-small-left-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-small-left-solid" asset catalog image resource.
    static let heroiconArrowSmallLeftSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-small-left-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-small-right-outline" asset catalog image resource.
    static let heroiconArrowSmallRightOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-small-right-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-small-right-solid" asset catalog image resource.
    static let heroiconArrowSmallRightSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-small-right-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-small-up-outline" asset catalog image resource.
    static let heroiconArrowSmallUpOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-small-up-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-small-up-solid" asset catalog image resource.
    static let heroiconArrowSmallUpSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-small-up-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-top-right-on-square-outline" asset catalog image resource.
    static let heroiconArrowTopRightOnSquareOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-top-right-on-square-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-top-right-on-square-solid" asset catalog image resource.
    static let heroiconArrowTopRightOnSquareSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-top-right-on-square-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-trending-down-outline" asset catalog image resource.
    static let heroiconArrowTrendingDownOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-trending-down-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-trending-down-solid" asset catalog image resource.
    static let heroiconArrowTrendingDownSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-trending-down-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-trending-up-outline" asset catalog image resource.
    static let heroiconArrowTrendingUpOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-trending-up-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-trending-up-solid" asset catalog image resource.
    static let heroiconArrowTrendingUpSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-trending-up-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-turn-down-left-outline" asset catalog image resource.
    static let heroiconArrowTurnDownLeftOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-turn-down-left-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-turn-down-left-solid" asset catalog image resource.
    static let heroiconArrowTurnDownLeftSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-turn-down-left-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-turn-down-right-outline" asset catalog image resource.
    static let heroiconArrowTurnDownRightOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-turn-down-right-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-turn-down-right-solid" asset catalog image resource.
    static let heroiconArrowTurnDownRightSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-turn-down-right-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-turn-left-down-outline" asset catalog image resource.
    static let heroiconArrowTurnLeftDownOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-turn-left-down-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-turn-left-down-solid" asset catalog image resource.
    static let heroiconArrowTurnLeftDownSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-turn-left-down-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-turn-left-up-outline" asset catalog image resource.
    static let heroiconArrowTurnLeftUpOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-turn-left-up-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-turn-left-up-solid" asset catalog image resource.
    static let heroiconArrowTurnLeftUpSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-turn-left-up-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-turn-right-down-outline" asset catalog image resource.
    static let heroiconArrowTurnRightDownOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-turn-right-down-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-turn-right-down-solid" asset catalog image resource.
    static let heroiconArrowTurnRightDownSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-turn-right-down-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-turn-right-up-outline" asset catalog image resource.
    static let heroiconArrowTurnRightUpOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-turn-right-up-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-turn-right-up-solid" asset catalog image resource.
    static let heroiconArrowTurnRightUpSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-turn-right-up-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-turn-up-left-outline" asset catalog image resource.
    static let heroiconArrowTurnUpLeftOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-turn-up-left-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-turn-up-left-solid" asset catalog image resource.
    static let heroiconArrowTurnUpLeftSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-turn-up-left-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-turn-up-right-outline" asset catalog image resource.
    static let heroiconArrowTurnUpRightOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-turn-up-right-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-turn-up-right-solid" asset catalog image resource.
    static let heroiconArrowTurnUpRightSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-turn-up-right-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-up-circle-outline" asset catalog image resource.
    static let heroiconArrowUpCircleOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-up-circle-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-up-circle-solid" asset catalog image resource.
    static let heroiconArrowUpCircleSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-up-circle-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-up-left-outline" asset catalog image resource.
    static let heroiconArrowUpLeftOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-up-left-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-up-left-solid" asset catalog image resource.
    static let heroiconArrowUpLeftSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-up-left-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-up-on-square-outline" asset catalog image resource.
    static let heroiconArrowUpOnSquareOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-up-on-square-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-up-on-square-solid" asset catalog image resource.
    static let heroiconArrowUpOnSquareSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-up-on-square-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-up-on-square-stack-outline" asset catalog image resource.
    static let heroiconArrowUpOnSquareStackOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-up-on-square-stack-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-up-on-square-stack-solid" asset catalog image resource.
    static let heroiconArrowUpOnSquareStackSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-up-on-square-stack-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-up-outline" asset catalog image resource.
    static let heroiconArrowUpOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-up-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-up-right-outline" asset catalog image resource.
    static let heroiconArrowUpRightOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-up-right-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-up-right-solid" asset catalog image resource.
    static let heroiconArrowUpRightSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-up-right-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-up-solid" asset catalog image resource.
    static let heroiconArrowUpSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-up-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-up-tray-outline" asset catalog image resource.
    static let heroiconArrowUpTrayOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-up-tray-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-up-tray-solid" asset catalog image resource.
    static let heroiconArrowUpTraySolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-up-tray-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-uturn-down-outline" asset catalog image resource.
    static let heroiconArrowUturnDownOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-uturn-down-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-uturn-down-solid" asset catalog image resource.
    static let heroiconArrowUturnDownSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-uturn-down-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-uturn-left-outline" asset catalog image resource.
    static let heroiconArrowUturnLeftOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-uturn-left-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-uturn-left-solid" asset catalog image resource.
    static let heroiconArrowUturnLeftSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-uturn-left-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-uturn-right-outline" asset catalog image resource.
    static let heroiconArrowUturnRightOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-uturn-right-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-uturn-right-solid" asset catalog image resource.
    static let heroiconArrowUturnRightSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-uturn-right-solid", bundle: resourceBundle)

    /// The "heroicon-arrow-uturn-up-outline" asset catalog image resource.
    static let heroiconArrowUturnUpOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-uturn-up-outline", bundle: resourceBundle)

    /// The "heroicon-arrow-uturn-up-solid" asset catalog image resource.
    static let heroiconArrowUturnUpSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrow-uturn-up-solid", bundle: resourceBundle)

    /// The "heroicon-arrows-pointing-in-outline" asset catalog image resource.
    static let heroiconArrowsPointingInOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrows-pointing-in-outline", bundle: resourceBundle)

    /// The "heroicon-arrows-pointing-in-solid" asset catalog image resource.
    static let heroiconArrowsPointingInSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrows-pointing-in-solid", bundle: resourceBundle)

    /// The "heroicon-arrows-pointing-out-outline" asset catalog image resource.
    static let heroiconArrowsPointingOutOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrows-pointing-out-outline", bundle: resourceBundle)

    /// The "heroicon-arrows-pointing-out-solid" asset catalog image resource.
    static let heroiconArrowsPointingOutSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrows-pointing-out-solid", bundle: resourceBundle)

    /// The "heroicon-arrows-right-left-outline" asset catalog image resource.
    static let heroiconArrowsRightLeftOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrows-right-left-outline", bundle: resourceBundle)

    /// The "heroicon-arrows-right-left-solid" asset catalog image resource.
    static let heroiconArrowsRightLeftSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrows-right-left-solid", bundle: resourceBundle)

    /// The "heroicon-arrows-up-down-outline" asset catalog image resource.
    static let heroiconArrowsUpDownOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-arrows-up-down-outline", bundle: resourceBundle)

    /// The "heroicon-arrows-up-down-solid" asset catalog image resource.
    static let heroiconArrowsUpDownSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-arrows-up-down-solid", bundle: resourceBundle)

    /// The "heroicon-at-symbol-outline" asset catalog image resource.
    static let heroiconAtSymbolOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-at-symbol-outline", bundle: resourceBundle)

    /// The "heroicon-at-symbol-solid" asset catalog image resource.
    static let heroiconAtSymbolSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-at-symbol-solid", bundle: resourceBundle)

    /// The "heroicon-backspace-outline" asset catalog image resource.
    static let heroiconBackspaceOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-backspace-outline", bundle: resourceBundle)

    /// The "heroicon-backspace-solid" asset catalog image resource.
    static let heroiconBackspaceSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-backspace-solid", bundle: resourceBundle)

    /// The "heroicon-backward-outline" asset catalog image resource.
    static let heroiconBackwardOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-backward-outline", bundle: resourceBundle)

    /// The "heroicon-backward-solid" asset catalog image resource.
    static let heroiconBackwardSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-backward-solid", bundle: resourceBundle)

    /// The "heroicon-banknotes-outline" asset catalog image resource.
    static let heroiconBanknotesOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-banknotes-outline", bundle: resourceBundle)

    /// The "heroicon-banknotes-solid" asset catalog image resource.
    static let heroiconBanknotesSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-banknotes-solid", bundle: resourceBundle)

    /// The "heroicon-bars-2-outline" asset catalog image resource.
    static let heroiconBars2Outline = DeveloperToolsSupport.ImageResource(name: "heroicon-bars-2-outline", bundle: resourceBundle)

    /// The "heroicon-bars-2-solid" asset catalog image resource.
    static let heroiconBars2Solid = DeveloperToolsSupport.ImageResource(name: "heroicon-bars-2-solid", bundle: resourceBundle)

    /// The "heroicon-bars-3-bottom-left-outline" asset catalog image resource.
    static let heroiconBars3BottomLeftOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-bars-3-bottom-left-outline", bundle: resourceBundle)

    /// The "heroicon-bars-3-bottom-left-solid" asset catalog image resource.
    static let heroiconBars3BottomLeftSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-bars-3-bottom-left-solid", bundle: resourceBundle)

    /// The "heroicon-bars-3-bottom-right-outline" asset catalog image resource.
    static let heroiconBars3BottomRightOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-bars-3-bottom-right-outline", bundle: resourceBundle)

    /// The "heroicon-bars-3-bottom-right-solid" asset catalog image resource.
    static let heroiconBars3BottomRightSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-bars-3-bottom-right-solid", bundle: resourceBundle)

    /// The "heroicon-bars-3-center-left-outline" asset catalog image resource.
    static let heroiconBars3CenterLeftOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-bars-3-center-left-outline", bundle: resourceBundle)

    /// The "heroicon-bars-3-center-left-solid" asset catalog image resource.
    static let heroiconBars3CenterLeftSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-bars-3-center-left-solid", bundle: resourceBundle)

    /// The "heroicon-bars-3-outline" asset catalog image resource.
    static let heroiconBars3Outline = DeveloperToolsSupport.ImageResource(name: "heroicon-bars-3-outline", bundle: resourceBundle)

    /// The "heroicon-bars-3-solid" asset catalog image resource.
    static let heroiconBars3Solid = DeveloperToolsSupport.ImageResource(name: "heroicon-bars-3-solid", bundle: resourceBundle)

    /// The "heroicon-bars-4-outline" asset catalog image resource.
    static let heroiconBars4Outline = DeveloperToolsSupport.ImageResource(name: "heroicon-bars-4-outline", bundle: resourceBundle)

    /// The "heroicon-bars-4-solid" asset catalog image resource.
    static let heroiconBars4Solid = DeveloperToolsSupport.ImageResource(name: "heroicon-bars-4-solid", bundle: resourceBundle)

    /// The "heroicon-bars-arrow-down-outline" asset catalog image resource.
    static let heroiconBarsArrowDownOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-bars-arrow-down-outline", bundle: resourceBundle)

    /// The "heroicon-bars-arrow-down-solid" asset catalog image resource.
    static let heroiconBarsArrowDownSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-bars-arrow-down-solid", bundle: resourceBundle)

    /// The "heroicon-bars-arrow-up-outline" asset catalog image resource.
    static let heroiconBarsArrowUpOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-bars-arrow-up-outline", bundle: resourceBundle)

    /// The "heroicon-bars-arrow-up-solid" asset catalog image resource.
    static let heroiconBarsArrowUpSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-bars-arrow-up-solid", bundle: resourceBundle)

    /// The "heroicon-battery-0-outline" asset catalog image resource.
    static let heroiconBattery0Outline = DeveloperToolsSupport.ImageResource(name: "heroicon-battery-0-outline", bundle: resourceBundle)

    /// The "heroicon-battery-0-solid" asset catalog image resource.
    static let heroiconBattery0Solid = DeveloperToolsSupport.ImageResource(name: "heroicon-battery-0-solid", bundle: resourceBundle)

    /// The "heroicon-battery-100-outline" asset catalog image resource.
    static let heroiconBattery100Outline = DeveloperToolsSupport.ImageResource(name: "heroicon-battery-100-outline", bundle: resourceBundle)

    /// The "heroicon-battery-100-solid" asset catalog image resource.
    static let heroiconBattery100Solid = DeveloperToolsSupport.ImageResource(name: "heroicon-battery-100-solid", bundle: resourceBundle)

    /// The "heroicon-battery-50-outline" asset catalog image resource.
    static let heroiconBattery50Outline = DeveloperToolsSupport.ImageResource(name: "heroicon-battery-50-outline", bundle: resourceBundle)

    /// The "heroicon-battery-50-solid" asset catalog image resource.
    static let heroiconBattery50Solid = DeveloperToolsSupport.ImageResource(name: "heroicon-battery-50-solid", bundle: resourceBundle)

    /// The "heroicon-beaker-outline" asset catalog image resource.
    static let heroiconBeakerOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-beaker-outline", bundle: resourceBundle)

    /// The "heroicon-beaker-solid" asset catalog image resource.
    static let heroiconBeakerSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-beaker-solid", bundle: resourceBundle)

    /// The "heroicon-bell-alert-outline" asset catalog image resource.
    static let heroiconBellAlertOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-bell-alert-outline", bundle: resourceBundle)

    /// The "heroicon-bell-alert-solid" asset catalog image resource.
    static let heroiconBellAlertSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-bell-alert-solid", bundle: resourceBundle)

    /// The "heroicon-bell-outline" asset catalog image resource.
    static let heroiconBellOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-bell-outline", bundle: resourceBundle)

    /// The "heroicon-bell-slash-outline" asset catalog image resource.
    static let heroiconBellSlashOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-bell-slash-outline", bundle: resourceBundle)

    /// The "heroicon-bell-slash-solid" asset catalog image resource.
    static let heroiconBellSlashSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-bell-slash-solid", bundle: resourceBundle)

    /// The "heroicon-bell-snooze-outline" asset catalog image resource.
    static let heroiconBellSnoozeOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-bell-snooze-outline", bundle: resourceBundle)

    /// The "heroicon-bell-snooze-solid" asset catalog image resource.
    static let heroiconBellSnoozeSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-bell-snooze-solid", bundle: resourceBundle)

    /// The "heroicon-bell-solid" asset catalog image resource.
    static let heroiconBellSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-bell-solid", bundle: resourceBundle)

    /// The "heroicon-bold-outline" asset catalog image resource.
    static let heroiconBoldOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-bold-outline", bundle: resourceBundle)

    /// The "heroicon-bold-solid" asset catalog image resource.
    static let heroiconBoldSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-bold-solid", bundle: resourceBundle)

    /// The "heroicon-bolt-outline" asset catalog image resource.
    static let heroiconBoltOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-bolt-outline", bundle: resourceBundle)

    /// The "heroicon-bolt-slash-outline" asset catalog image resource.
    static let heroiconBoltSlashOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-bolt-slash-outline", bundle: resourceBundle)

    /// The "heroicon-bolt-slash-solid" asset catalog image resource.
    static let heroiconBoltSlashSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-bolt-slash-solid", bundle: resourceBundle)

    /// The "heroicon-bolt-solid" asset catalog image resource.
    static let heroiconBoltSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-bolt-solid", bundle: resourceBundle)

    /// The "heroicon-book-open-outline" asset catalog image resource.
    static let heroiconBookOpenOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-book-open-outline", bundle: resourceBundle)

    /// The "heroicon-book-open-solid" asset catalog image resource.
    static let heroiconBookOpenSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-book-open-solid", bundle: resourceBundle)

    /// The "heroicon-bookmark-outline" asset catalog image resource.
    static let heroiconBookmarkOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-bookmark-outline", bundle: resourceBundle)

    /// The "heroicon-bookmark-slash-outline" asset catalog image resource.
    static let heroiconBookmarkSlashOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-bookmark-slash-outline", bundle: resourceBundle)

    /// The "heroicon-bookmark-slash-solid" asset catalog image resource.
    static let heroiconBookmarkSlashSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-bookmark-slash-solid", bundle: resourceBundle)

    /// The "heroicon-bookmark-solid" asset catalog image resource.
    static let heroiconBookmarkSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-bookmark-solid", bundle: resourceBundle)

    /// The "heroicon-bookmark-square-outline" asset catalog image resource.
    static let heroiconBookmarkSquareOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-bookmark-square-outline", bundle: resourceBundle)

    /// The "heroicon-bookmark-square-solid" asset catalog image resource.
    static let heroiconBookmarkSquareSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-bookmark-square-solid", bundle: resourceBundle)

    /// The "heroicon-briefcase-outline" asset catalog image resource.
    static let heroiconBriefcaseOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-briefcase-outline", bundle: resourceBundle)

    /// The "heroicon-briefcase-solid" asset catalog image resource.
    static let heroiconBriefcaseSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-briefcase-solid", bundle: resourceBundle)

    /// The "heroicon-bug-ant-outline" asset catalog image resource.
    static let heroiconBugAntOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-bug-ant-outline", bundle: resourceBundle)

    /// The "heroicon-bug-ant-solid" asset catalog image resource.
    static let heroiconBugAntSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-bug-ant-solid", bundle: resourceBundle)

    /// The "heroicon-building-library-outline" asset catalog image resource.
    static let heroiconBuildingLibraryOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-building-library-outline", bundle: resourceBundle)

    /// The "heroicon-building-library-solid" asset catalog image resource.
    static let heroiconBuildingLibrarySolid = DeveloperToolsSupport.ImageResource(name: "heroicon-building-library-solid", bundle: resourceBundle)

    /// The "heroicon-building-office-2-outline" asset catalog image resource.
    static let heroiconBuildingOffice2Outline = DeveloperToolsSupport.ImageResource(name: "heroicon-building-office-2-outline", bundle: resourceBundle)

    /// The "heroicon-building-office-2-solid" asset catalog image resource.
    static let heroiconBuildingOffice2Solid = DeveloperToolsSupport.ImageResource(name: "heroicon-building-office-2-solid", bundle: resourceBundle)

    /// The "heroicon-building-office-outline" asset catalog image resource.
    static let heroiconBuildingOfficeOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-building-office-outline", bundle: resourceBundle)

    /// The "heroicon-building-office-solid" asset catalog image resource.
    static let heroiconBuildingOfficeSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-building-office-solid", bundle: resourceBundle)

    /// The "heroicon-building-storefront-outline" asset catalog image resource.
    static let heroiconBuildingStorefrontOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-building-storefront-outline", bundle: resourceBundle)

    /// The "heroicon-building-storefront-solid" asset catalog image resource.
    static let heroiconBuildingStorefrontSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-building-storefront-solid", bundle: resourceBundle)

    /// The "heroicon-cake-outline" asset catalog image resource.
    static let heroiconCakeOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-cake-outline", bundle: resourceBundle)

    /// The "heroicon-cake-solid" asset catalog image resource.
    static let heroiconCakeSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-cake-solid", bundle: resourceBundle)

    /// The "heroicon-calculator-outline" asset catalog image resource.
    static let heroiconCalculatorOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-calculator-outline", bundle: resourceBundle)

    /// The "heroicon-calculator-solid" asset catalog image resource.
    static let heroiconCalculatorSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-calculator-solid", bundle: resourceBundle)

    /// The "heroicon-calendar-date-range-outline" asset catalog image resource.
    static let heroiconCalendarDateRangeOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-calendar-date-range-outline", bundle: resourceBundle)

    /// The "heroicon-calendar-date-range-solid" asset catalog image resource.
    static let heroiconCalendarDateRangeSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-calendar-date-range-solid", bundle: resourceBundle)

    /// The "heroicon-calendar-days" asset catalog image resource.
    static let heroiconCalendarDays = DeveloperToolsSupport.ImageResource(name: "heroicon-calendar-days", bundle: resourceBundle)

    /// The "heroicon-calendar-days-solid" asset catalog image resource.
    static let heroiconCalendarDaysSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-calendar-days-solid", bundle: resourceBundle)

    /// The "heroicon-calendar-outline" asset catalog image resource.
    static let heroiconCalendarOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-calendar-outline", bundle: resourceBundle)

    /// The "heroicon-calendar-solid" asset catalog image resource.
    static let heroiconCalendarSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-calendar-solid", bundle: resourceBundle)

    /// The "heroicon-camera" asset catalog image resource.
    static let heroiconCamera = DeveloperToolsSupport.ImageResource(name: "heroicon-camera", bundle: resourceBundle)

    /// The "heroicon-camera-solid" asset catalog image resource.
    static let heroiconCameraSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-camera-solid", bundle: resourceBundle)

    /// The "heroicon-chart-bar" asset catalog image resource.
    static let heroiconChartBar = DeveloperToolsSupport.ImageResource(name: "heroicon-chart-bar", bundle: resourceBundle)

    /// The "heroicon-chart-bar-solid" asset catalog image resource.
    static let heroiconChartBarSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-chart-bar-solid", bundle: resourceBundle)

    /// The "heroicon-chart-bar-square-outline" asset catalog image resource.
    static let heroiconChartBarSquareOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-chart-bar-square-outline", bundle: resourceBundle)

    /// The "heroicon-chart-bar-square-solid" asset catalog image resource.
    static let heroiconChartBarSquareSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-chart-bar-square-solid", bundle: resourceBundle)

    /// The "heroicon-chart-pie" asset catalog image resource.
    static let heroiconChartPie = DeveloperToolsSupport.ImageResource(name: "heroicon-chart-pie", bundle: resourceBundle)

    /// The "heroicon-chart-pie-solid" asset catalog image resource.
    static let heroiconChartPieSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-chart-pie-solid", bundle: resourceBundle)

    /// The "heroicon-chat-bubble-bottom-center-outline" asset catalog image resource.
    static let heroiconChatBubbleBottomCenterOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-chat-bubble-bottom-center-outline", bundle: resourceBundle)

    /// The "heroicon-chat-bubble-bottom-center-solid" asset catalog image resource.
    static let heroiconChatBubbleBottomCenterSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-chat-bubble-bottom-center-solid", bundle: resourceBundle)

    /// The "heroicon-chat-bubble-bottom-center-text" asset catalog image resource.
    static let heroiconChatBubbleBottomCenterText = DeveloperToolsSupport.ImageResource(name: "heroicon-chat-bubble-bottom-center-text", bundle: resourceBundle)

    /// The "heroicon-chat-bubble-bottom-center-text-solid" asset catalog image resource.
    static let heroiconChatBubbleBottomCenterTextSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-chat-bubble-bottom-center-text-solid", bundle: resourceBundle)

    /// The "heroicon-chat-bubble-left-ellipsis" asset catalog image resource.
    static let heroiconChatBubbleLeftEllipsis = DeveloperToolsSupport.ImageResource(name: "heroicon-chat-bubble-left-ellipsis", bundle: resourceBundle)

    /// The "heroicon-chat-bubble-left-ellipsis-solid" asset catalog image resource.
    static let heroiconChatBubbleLeftEllipsisSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-chat-bubble-left-ellipsis-solid", bundle: resourceBundle)

    /// The "heroicon-chat-bubble-left-outline" asset catalog image resource.
    static let heroiconChatBubbleLeftOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-chat-bubble-left-outline", bundle: resourceBundle)

    /// The "heroicon-chat-bubble-left-right-outline" asset catalog image resource.
    static let heroiconChatBubbleLeftRightOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-chat-bubble-left-right-outline", bundle: resourceBundle)

    /// The "heroicon-chat-bubble-left-right-solid" asset catalog image resource.
    static let heroiconChatBubbleLeftRightSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-chat-bubble-left-right-solid", bundle: resourceBundle)

    /// The "heroicon-chat-bubble-left-solid" asset catalog image resource.
    static let heroiconChatBubbleLeftSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-chat-bubble-left-solid", bundle: resourceBundle)

    /// The "heroicon-chat-bubble-oval-left-ellipsis-outline" asset catalog image resource.
    static let heroiconChatBubbleOvalLeftEllipsisOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-chat-bubble-oval-left-ellipsis-outline", bundle: resourceBundle)

    /// The "heroicon-chat-bubble-oval-left-ellipsis-solid" asset catalog image resource.
    static let heroiconChatBubbleOvalLeftEllipsisSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-chat-bubble-oval-left-ellipsis-solid", bundle: resourceBundle)

    /// The "heroicon-chat-bubble-oval-left-outline" asset catalog image resource.
    static let heroiconChatBubbleOvalLeftOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-chat-bubble-oval-left-outline", bundle: resourceBundle)

    /// The "heroicon-chat-bubble-oval-left-solid" asset catalog image resource.
    static let heroiconChatBubbleOvalLeftSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-chat-bubble-oval-left-solid", bundle: resourceBundle)

    /// The "heroicon-check-badge-outline" asset catalog image resource.
    static let heroiconCheckBadgeOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-check-badge-outline", bundle: resourceBundle)

    /// The "heroicon-check-badge-solid" asset catalog image resource.
    static let heroiconCheckBadgeSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-check-badge-solid", bundle: resourceBundle)

    /// The "heroicon-check-circle-outline" asset catalog image resource.
    static let heroiconCheckCircleOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-check-circle-outline", bundle: resourceBundle)

    /// The "heroicon-check-circle-solid" asset catalog image resource.
    static let heroiconCheckCircleSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-check-circle-solid", bundle: resourceBundle)

    /// The "heroicon-check-outline" asset catalog image resource.
    static let heroiconCheckOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-check-outline", bundle: resourceBundle)

    /// The "heroicon-check-solid" asset catalog image resource.
    static let heroiconCheckSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-check-solid", bundle: resourceBundle)

    /// The "heroicon-chevron-double-down-outline" asset catalog image resource.
    static let heroiconChevronDoubleDownOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-chevron-double-down-outline", bundle: resourceBundle)

    /// The "heroicon-chevron-double-down-solid" asset catalog image resource.
    static let heroiconChevronDoubleDownSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-chevron-double-down-solid", bundle: resourceBundle)

    /// The "heroicon-chevron-double-left-outline" asset catalog image resource.
    static let heroiconChevronDoubleLeftOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-chevron-double-left-outline", bundle: resourceBundle)

    /// The "heroicon-chevron-double-left-solid" asset catalog image resource.
    static let heroiconChevronDoubleLeftSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-chevron-double-left-solid", bundle: resourceBundle)

    /// The "heroicon-chevron-double-right-outline" asset catalog image resource.
    static let heroiconChevronDoubleRightOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-chevron-double-right-outline", bundle: resourceBundle)

    /// The "heroicon-chevron-double-right-solid" asset catalog image resource.
    static let heroiconChevronDoubleRightSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-chevron-double-right-solid", bundle: resourceBundle)

    /// The "heroicon-chevron-double-up-outline" asset catalog image resource.
    static let heroiconChevronDoubleUpOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-chevron-double-up-outline", bundle: resourceBundle)

    /// The "heroicon-chevron-double-up-solid" asset catalog image resource.
    static let heroiconChevronDoubleUpSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-chevron-double-up-solid", bundle: resourceBundle)

    /// The "heroicon-chevron-down-outline" asset catalog image resource.
    static let heroiconChevronDownOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-chevron-down-outline", bundle: resourceBundle)

    /// The "heroicon-chevron-down-solid" asset catalog image resource.
    static let heroiconChevronDownSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-chevron-down-solid", bundle: resourceBundle)

    /// The "heroicon-chevron-left-outline" asset catalog image resource.
    static let heroiconChevronLeftOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-chevron-left-outline", bundle: resourceBundle)

    /// The "heroicon-chevron-left-solid" asset catalog image resource.
    static let heroiconChevronLeftSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-chevron-left-solid", bundle: resourceBundle)

    /// The "heroicon-chevron-right-outline" asset catalog image resource.
    static let heroiconChevronRightOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-chevron-right-outline", bundle: resourceBundle)

    /// The "heroicon-chevron-right-solid" asset catalog image resource.
    static let heroiconChevronRightSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-chevron-right-solid", bundle: resourceBundle)

    /// The "heroicon-chevron-up-down-outline" asset catalog image resource.
    static let heroiconChevronUpDownOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-chevron-up-down-outline", bundle: resourceBundle)

    /// The "heroicon-chevron-up-down-solid" asset catalog image resource.
    static let heroiconChevronUpDownSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-chevron-up-down-solid", bundle: resourceBundle)

    /// The "heroicon-chevron-up-outline" asset catalog image resource.
    static let heroiconChevronUpOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-chevron-up-outline", bundle: resourceBundle)

    /// The "heroicon-chevron-up-solid" asset catalog image resource.
    static let heroiconChevronUpSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-chevron-up-solid", bundle: resourceBundle)

    /// The "heroicon-circle-stack-outline" asset catalog image resource.
    static let heroiconCircleStackOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-circle-stack-outline", bundle: resourceBundle)

    /// The "heroicon-circle-stack-solid" asset catalog image resource.
    static let heroiconCircleStackSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-circle-stack-solid", bundle: resourceBundle)

    /// The "heroicon-clipboard-document-check-outline" asset catalog image resource.
    static let heroiconClipboardDocumentCheckOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-clipboard-document-check-outline", bundle: resourceBundle)

    /// The "heroicon-clipboard-document-check-solid" asset catalog image resource.
    static let heroiconClipboardDocumentCheckSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-clipboard-document-check-solid", bundle: resourceBundle)

    /// The "heroicon-clipboard-document-list-outline" asset catalog image resource.
    static let heroiconClipboardDocumentListOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-clipboard-document-list-outline", bundle: resourceBundle)

    /// The "heroicon-clipboard-document-list-solid" asset catalog image resource.
    static let heroiconClipboardDocumentListSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-clipboard-document-list-solid", bundle: resourceBundle)

    /// The "heroicon-clipboard-document-outline" asset catalog image resource.
    static let heroiconClipboardDocumentOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-clipboard-document-outline", bundle: resourceBundle)

    /// The "heroicon-clipboard-document-solid" asset catalog image resource.
    static let heroiconClipboardDocumentSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-clipboard-document-solid", bundle: resourceBundle)

    /// The "heroicon-clipboard-outline" asset catalog image resource.
    static let heroiconClipboardOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-clipboard-outline", bundle: resourceBundle)

    /// The "heroicon-clipboard-solid" asset catalog image resource.
    static let heroiconClipboardSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-clipboard-solid", bundle: resourceBundle)

    /// The "heroicon-clock-outline" asset catalog image resource.
    static let heroiconClockOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-clock-outline", bundle: resourceBundle)

    /// The "heroicon-clock-solid" asset catalog image resource.
    static let heroiconClockSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-clock-solid", bundle: resourceBundle)

    /// The "heroicon-cloud-arrow-down-outline" asset catalog image resource.
    static let heroiconCloudArrowDownOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-cloud-arrow-down-outline", bundle: resourceBundle)

    /// The "heroicon-cloud-arrow-down-solid" asset catalog image resource.
    static let heroiconCloudArrowDownSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-cloud-arrow-down-solid", bundle: resourceBundle)

    /// The "heroicon-cloud-arrow-up-outline" asset catalog image resource.
    static let heroiconCloudArrowUpOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-cloud-arrow-up-outline", bundle: resourceBundle)

    /// The "heroicon-cloud-arrow-up-solid" asset catalog image resource.
    static let heroiconCloudArrowUpSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-cloud-arrow-up-solid", bundle: resourceBundle)

    /// The "heroicon-cloud-outline" asset catalog image resource.
    static let heroiconCloudOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-cloud-outline", bundle: resourceBundle)

    /// The "heroicon-cloud-solid" asset catalog image resource.
    static let heroiconCloudSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-cloud-solid", bundle: resourceBundle)

    /// The "heroicon-code-bracket-outline" asset catalog image resource.
    static let heroiconCodeBracketOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-code-bracket-outline", bundle: resourceBundle)

    /// The "heroicon-code-bracket-solid" asset catalog image resource.
    static let heroiconCodeBracketSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-code-bracket-solid", bundle: resourceBundle)

    /// The "heroicon-code-bracket-square-outline" asset catalog image resource.
    static let heroiconCodeBracketSquareOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-code-bracket-square-outline", bundle: resourceBundle)

    /// The "heroicon-code-bracket-square-solid" asset catalog image resource.
    static let heroiconCodeBracketSquareSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-code-bracket-square-solid", bundle: resourceBundle)

    /// The "heroicon-cog-6-tooth-outline" asset catalog image resource.
    static let heroiconCog6ToothOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-cog-6-tooth-outline", bundle: resourceBundle)

    /// The "heroicon-cog-6-tooth-solid" asset catalog image resource.
    static let heroiconCog6ToothSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-cog-6-tooth-solid", bundle: resourceBundle)

    /// The "heroicon-cog-8-tooth-outline" asset catalog image resource.
    static let heroiconCog8ToothOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-cog-8-tooth-outline", bundle: resourceBundle)

    /// The "heroicon-cog-8-tooth-solid" asset catalog image resource.
    static let heroiconCog8ToothSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-cog-8-tooth-solid", bundle: resourceBundle)

    /// The "heroicon-cog-outline" asset catalog image resource.
    static let heroiconCogOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-cog-outline", bundle: resourceBundle)

    /// The "heroicon-cog-solid" asset catalog image resource.
    static let heroiconCogSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-cog-solid", bundle: resourceBundle)

    /// The "heroicon-command-line-outline" asset catalog image resource.
    static let heroiconCommandLineOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-command-line-outline", bundle: resourceBundle)

    /// The "heroicon-command-line-solid" asset catalog image resource.
    static let heroiconCommandLineSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-command-line-solid", bundle: resourceBundle)

    /// The "heroicon-computer-desktop-outline" asset catalog image resource.
    static let heroiconComputerDesktopOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-computer-desktop-outline", bundle: resourceBundle)

    /// The "heroicon-computer-desktop-solid" asset catalog image resource.
    static let heroiconComputerDesktopSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-computer-desktop-solid", bundle: resourceBundle)

    /// The "heroicon-cpu-chip-outline" asset catalog image resource.
    static let heroiconCpuChipOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-cpu-chip-outline", bundle: resourceBundle)

    /// The "heroicon-cpu-chip-solid" asset catalog image resource.
    static let heroiconCpuChipSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-cpu-chip-solid", bundle: resourceBundle)

    /// The "heroicon-credit-card-outline" asset catalog image resource.
    static let heroiconCreditCardOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-credit-card-outline", bundle: resourceBundle)

    /// The "heroicon-credit-card-solid" asset catalog image resource.
    static let heroiconCreditCardSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-credit-card-solid", bundle: resourceBundle)

    /// The "heroicon-cube-outline" asset catalog image resource.
    static let heroiconCubeOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-cube-outline", bundle: resourceBundle)

    /// The "heroicon-cube-solid" asset catalog image resource.
    static let heroiconCubeSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-cube-solid", bundle: resourceBundle)

    /// The "heroicon-cube-transparent-outline" asset catalog image resource.
    static let heroiconCubeTransparentOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-cube-transparent-outline", bundle: resourceBundle)

    /// The "heroicon-cube-transparent-solid" asset catalog image resource.
    static let heroiconCubeTransparentSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-cube-transparent-solid", bundle: resourceBundle)

    /// The "heroicon-currency-bangladeshi-outline" asset catalog image resource.
    static let heroiconCurrencyBangladeshiOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-currency-bangladeshi-outline", bundle: resourceBundle)

    /// The "heroicon-currency-bangladeshi-solid" asset catalog image resource.
    static let heroiconCurrencyBangladeshiSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-currency-bangladeshi-solid", bundle: resourceBundle)

    /// The "heroicon-currency-dollar-outline" asset catalog image resource.
    static let heroiconCurrencyDollarOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-currency-dollar-outline", bundle: resourceBundle)

    /// The "heroicon-currency-dollar-solid" asset catalog image resource.
    static let heroiconCurrencyDollarSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-currency-dollar-solid", bundle: resourceBundle)

    /// The "heroicon-currency-euro-outline" asset catalog image resource.
    static let heroiconCurrencyEuroOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-currency-euro-outline", bundle: resourceBundle)

    /// The "heroicon-currency-euro-solid" asset catalog image resource.
    static let heroiconCurrencyEuroSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-currency-euro-solid", bundle: resourceBundle)

    /// The "heroicon-currency-pound-outline" asset catalog image resource.
    static let heroiconCurrencyPoundOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-currency-pound-outline", bundle: resourceBundle)

    /// The "heroicon-currency-pound-solid" asset catalog image resource.
    static let heroiconCurrencyPoundSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-currency-pound-solid", bundle: resourceBundle)

    /// The "heroicon-currency-rupee-outline" asset catalog image resource.
    static let heroiconCurrencyRupeeOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-currency-rupee-outline", bundle: resourceBundle)

    /// The "heroicon-currency-rupee-solid" asset catalog image resource.
    static let heroiconCurrencyRupeeSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-currency-rupee-solid", bundle: resourceBundle)

    /// The "heroicon-currency-yen-outline" asset catalog image resource.
    static let heroiconCurrencyYenOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-currency-yen-outline", bundle: resourceBundle)

    /// The "heroicon-currency-yen-solid" asset catalog image resource.
    static let heroiconCurrencyYenSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-currency-yen-solid", bundle: resourceBundle)

    /// The "heroicon-cursor-arrow-rays-outline" asset catalog image resource.
    static let heroiconCursorArrowRaysOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-cursor-arrow-rays-outline", bundle: resourceBundle)

    /// The "heroicon-cursor-arrow-rays-solid" asset catalog image resource.
    static let heroiconCursorArrowRaysSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-cursor-arrow-rays-solid", bundle: resourceBundle)

    /// The "heroicon-cursor-arrow-ripple-outline" asset catalog image resource.
    static let heroiconCursorArrowRippleOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-cursor-arrow-ripple-outline", bundle: resourceBundle)

    /// The "heroicon-cursor-arrow-ripple-solid" asset catalog image resource.
    static let heroiconCursorArrowRippleSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-cursor-arrow-ripple-solid", bundle: resourceBundle)

    /// The "heroicon-device-phone-mobile-outline" asset catalog image resource.
    static let heroiconDevicePhoneMobileOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-device-phone-mobile-outline", bundle: resourceBundle)

    /// The "heroicon-device-phone-mobile-solid" asset catalog image resource.
    static let heroiconDevicePhoneMobileSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-device-phone-mobile-solid", bundle: resourceBundle)

    /// The "heroicon-device-tablet-outline" asset catalog image resource.
    static let heroiconDeviceTabletOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-device-tablet-outline", bundle: resourceBundle)

    /// The "heroicon-device-tablet-solid" asset catalog image resource.
    static let heroiconDeviceTabletSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-device-tablet-solid", bundle: resourceBundle)

    /// The "heroicon-divide-outline" asset catalog image resource.
    static let heroiconDivideOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-divide-outline", bundle: resourceBundle)

    /// The "heroicon-divide-solid" asset catalog image resource.
    static let heroiconDivideSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-divide-solid", bundle: resourceBundle)

    /// The "heroicon-document-arrow-down-outline" asset catalog image resource.
    static let heroiconDocumentArrowDownOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-document-arrow-down-outline", bundle: resourceBundle)

    /// The "heroicon-document-arrow-down-solid" asset catalog image resource.
    static let heroiconDocumentArrowDownSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-document-arrow-down-solid", bundle: resourceBundle)

    /// The "heroicon-document-arrow-up-outline" asset catalog image resource.
    static let heroiconDocumentArrowUpOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-document-arrow-up-outline", bundle: resourceBundle)

    /// The "heroicon-document-arrow-up-solid" asset catalog image resource.
    static let heroiconDocumentArrowUpSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-document-arrow-up-solid", bundle: resourceBundle)

    /// The "heroicon-document-chart-bar-outline" asset catalog image resource.
    static let heroiconDocumentChartBarOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-document-chart-bar-outline", bundle: resourceBundle)

    /// The "heroicon-document-chart-bar-solid" asset catalog image resource.
    static let heroiconDocumentChartBarSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-document-chart-bar-solid", bundle: resourceBundle)

    /// The "heroicon-document-check-outline" asset catalog image resource.
    static let heroiconDocumentCheckOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-document-check-outline", bundle: resourceBundle)

    /// The "heroicon-document-check-solid" asset catalog image resource.
    static let heroiconDocumentCheckSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-document-check-solid", bundle: resourceBundle)

    /// The "heroicon-document-currency-bangladeshi-outline" asset catalog image resource.
    static let heroiconDocumentCurrencyBangladeshiOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-document-currency-bangladeshi-outline", bundle: resourceBundle)

    /// The "heroicon-document-currency-bangladeshi-solid" asset catalog image resource.
    static let heroiconDocumentCurrencyBangladeshiSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-document-currency-bangladeshi-solid", bundle: resourceBundle)

    /// The "heroicon-document-currency-dollar-outline" asset catalog image resource.
    static let heroiconDocumentCurrencyDollarOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-document-currency-dollar-outline", bundle: resourceBundle)

    /// The "heroicon-document-currency-dollar-solid" asset catalog image resource.
    static let heroiconDocumentCurrencyDollarSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-document-currency-dollar-solid", bundle: resourceBundle)

    /// The "heroicon-document-currency-euro-outline" asset catalog image resource.
    static let heroiconDocumentCurrencyEuroOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-document-currency-euro-outline", bundle: resourceBundle)

    /// The "heroicon-document-currency-euro-solid" asset catalog image resource.
    static let heroiconDocumentCurrencyEuroSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-document-currency-euro-solid", bundle: resourceBundle)

    /// The "heroicon-document-currency-pound-outline" asset catalog image resource.
    static let heroiconDocumentCurrencyPoundOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-document-currency-pound-outline", bundle: resourceBundle)

    /// The "heroicon-document-currency-pound-solid" asset catalog image resource.
    static let heroiconDocumentCurrencyPoundSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-document-currency-pound-solid", bundle: resourceBundle)

    /// The "heroicon-document-currency-rupee-outline" asset catalog image resource.
    static let heroiconDocumentCurrencyRupeeOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-document-currency-rupee-outline", bundle: resourceBundle)

    /// The "heroicon-document-currency-rupee-solid" asset catalog image resource.
    static let heroiconDocumentCurrencyRupeeSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-document-currency-rupee-solid", bundle: resourceBundle)

    /// The "heroicon-document-currency-yen-outline" asset catalog image resource.
    static let heroiconDocumentCurrencyYenOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-document-currency-yen-outline", bundle: resourceBundle)

    /// The "heroicon-document-currency-yen-solid" asset catalog image resource.
    static let heroiconDocumentCurrencyYenSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-document-currency-yen-solid", bundle: resourceBundle)

    /// The "heroicon-document-duplicate-outline" asset catalog image resource.
    static let heroiconDocumentDuplicateOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-document-duplicate-outline", bundle: resourceBundle)

    /// The "heroicon-document-duplicate-solid" asset catalog image resource.
    static let heroiconDocumentDuplicateSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-document-duplicate-solid", bundle: resourceBundle)

    /// The "heroicon-document-magnifying-glass-outline" asset catalog image resource.
    static let heroiconDocumentMagnifyingGlassOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-document-magnifying-glass-outline", bundle: resourceBundle)

    /// The "heroicon-document-magnifying-glass-solid" asset catalog image resource.
    static let heroiconDocumentMagnifyingGlassSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-document-magnifying-glass-solid", bundle: resourceBundle)

    /// The "heroicon-document-minus-outline" asset catalog image resource.
    static let heroiconDocumentMinusOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-document-minus-outline", bundle: resourceBundle)

    /// The "heroicon-document-minus-solid" asset catalog image resource.
    static let heroiconDocumentMinusSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-document-minus-solid", bundle: resourceBundle)

    /// The "heroicon-document-outline" asset catalog image resource.
    static let heroiconDocumentOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-document-outline", bundle: resourceBundle)

    /// The "heroicon-document-plus-outline" asset catalog image resource.
    static let heroiconDocumentPlusOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-document-plus-outline", bundle: resourceBundle)

    /// The "heroicon-document-plus-solid" asset catalog image resource.
    static let heroiconDocumentPlusSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-document-plus-solid", bundle: resourceBundle)

    /// The "heroicon-document-solid" asset catalog image resource.
    static let heroiconDocumentSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-document-solid", bundle: resourceBundle)

    /// The "heroicon-document-text-outline" asset catalog image resource.
    static let heroiconDocumentTextOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-document-text-outline", bundle: resourceBundle)

    /// The "heroicon-document-text-solid" asset catalog image resource.
    static let heroiconDocumentTextSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-document-text-solid", bundle: resourceBundle)

    /// The "heroicon-ellipsis-horizontal-circle-outline" asset catalog image resource.
    static let heroiconEllipsisHorizontalCircleOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-ellipsis-horizontal-circle-outline", bundle: resourceBundle)

    /// The "heroicon-ellipsis-horizontal-circle-solid" asset catalog image resource.
    static let heroiconEllipsisHorizontalCircleSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-ellipsis-horizontal-circle-solid", bundle: resourceBundle)

    /// The "heroicon-ellipsis-horizontal-outline" asset catalog image resource.
    static let heroiconEllipsisHorizontalOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-ellipsis-horizontal-outline", bundle: resourceBundle)

    /// The "heroicon-ellipsis-horizontal-solid" asset catalog image resource.
    static let heroiconEllipsisHorizontalSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-ellipsis-horizontal-solid", bundle: resourceBundle)

    /// The "heroicon-ellipsis-vertical-outline" asset catalog image resource.
    static let heroiconEllipsisVerticalOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-ellipsis-vertical-outline", bundle: resourceBundle)

    /// The "heroicon-ellipsis-vertical-solid" asset catalog image resource.
    static let heroiconEllipsisVerticalSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-ellipsis-vertical-solid", bundle: resourceBundle)

    /// The "heroicon-envelope-open-outline" asset catalog image resource.
    static let heroiconEnvelopeOpenOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-envelope-open-outline", bundle: resourceBundle)

    /// The "heroicon-envelope-open-solid" asset catalog image resource.
    static let heroiconEnvelopeOpenSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-envelope-open-solid", bundle: resourceBundle)

    /// The "heroicon-envelope-outline" asset catalog image resource.
    static let heroiconEnvelopeOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-envelope-outline", bundle: resourceBundle)

    /// The "heroicon-envelope-solid" asset catalog image resource.
    static let heroiconEnvelopeSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-envelope-solid", bundle: resourceBundle)

    /// The "heroicon-equals-outline" asset catalog image resource.
    static let heroiconEqualsOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-equals-outline", bundle: resourceBundle)

    /// The "heroicon-equals-solid" asset catalog image resource.
    static let heroiconEqualsSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-equals-solid", bundle: resourceBundle)

    /// The "heroicon-exclamation-circle-outline" asset catalog image resource.
    static let heroiconExclamationCircleOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-exclamation-circle-outline", bundle: resourceBundle)

    /// The "heroicon-exclamation-circle-solid" asset catalog image resource.
    static let heroiconExclamationCircleSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-exclamation-circle-solid", bundle: resourceBundle)

    /// The "heroicon-exclamation-triangle-outline" asset catalog image resource.
    static let heroiconExclamationTriangleOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-exclamation-triangle-outline", bundle: resourceBundle)

    /// The "heroicon-exclamation-triangle-solid" asset catalog image resource.
    static let heroiconExclamationTriangleSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-exclamation-triangle-solid", bundle: resourceBundle)

    /// The "heroicon-eye-dropper-outline" asset catalog image resource.
    static let heroiconEyeDropperOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-eye-dropper-outline", bundle: resourceBundle)

    /// The "heroicon-eye-dropper-solid" asset catalog image resource.
    static let heroiconEyeDropperSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-eye-dropper-solid", bundle: resourceBundle)

    /// The "heroicon-eye-outline" asset catalog image resource.
    static let heroiconEyeOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-eye-outline", bundle: resourceBundle)

    /// The "heroicon-eye-slash-outline" asset catalog image resource.
    static let heroiconEyeSlashOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-eye-slash-outline", bundle: resourceBundle)

    /// The "heroicon-eye-slash-solid" asset catalog image resource.
    static let heroiconEyeSlashSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-eye-slash-solid", bundle: resourceBundle)

    /// The "heroicon-eye-solid" asset catalog image resource.
    static let heroiconEyeSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-eye-solid", bundle: resourceBundle)

    /// The "heroicon-face-frown-outline" asset catalog image resource.
    static let heroiconFaceFrownOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-face-frown-outline", bundle: resourceBundle)

    /// The "heroicon-face-frown-solid" asset catalog image resource.
    static let heroiconFaceFrownSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-face-frown-solid", bundle: resourceBundle)

    /// The "heroicon-face-smile-outline" asset catalog image resource.
    static let heroiconFaceSmileOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-face-smile-outline", bundle: resourceBundle)

    /// The "heroicon-face-smile-solid" asset catalog image resource.
    static let heroiconFaceSmileSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-face-smile-solid", bundle: resourceBundle)

    /// The "heroicon-film-outline" asset catalog image resource.
    static let heroiconFilmOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-film-outline", bundle: resourceBundle)

    /// The "heroicon-film-solid" asset catalog image resource.
    static let heroiconFilmSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-film-solid", bundle: resourceBundle)

    /// The "heroicon-finger-print-outline" asset catalog image resource.
    static let heroiconFingerPrintOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-finger-print-outline", bundle: resourceBundle)

    /// The "heroicon-finger-print-solid" asset catalog image resource.
    static let heroiconFingerPrintSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-finger-print-solid", bundle: resourceBundle)

    /// The "heroicon-fire-outline" asset catalog image resource.
    static let heroiconFireOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-fire-outline", bundle: resourceBundle)

    /// The "heroicon-fire-solid" asset catalog image resource.
    static let heroiconFireSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-fire-solid", bundle: resourceBundle)

    /// The "heroicon-flag-outline" asset catalog image resource.
    static let heroiconFlagOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-flag-outline", bundle: resourceBundle)

    /// The "heroicon-flag-solid" asset catalog image resource.
    static let heroiconFlagSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-flag-solid", bundle: resourceBundle)

    /// The "heroicon-folder-arrow-down-outline" asset catalog image resource.
    static let heroiconFolderArrowDownOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-folder-arrow-down-outline", bundle: resourceBundle)

    /// The "heroicon-folder-arrow-down-solid" asset catalog image resource.
    static let heroiconFolderArrowDownSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-folder-arrow-down-solid", bundle: resourceBundle)

    /// The "heroicon-folder-minus-outline" asset catalog image resource.
    static let heroiconFolderMinusOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-folder-minus-outline", bundle: resourceBundle)

    /// The "heroicon-folder-minus-solid" asset catalog image resource.
    static let heroiconFolderMinusSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-folder-minus-solid", bundle: resourceBundle)

    /// The "heroicon-folder-open-outline" asset catalog image resource.
    static let heroiconFolderOpenOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-folder-open-outline", bundle: resourceBundle)

    /// The "heroicon-folder-open-solid" asset catalog image resource.
    static let heroiconFolderOpenSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-folder-open-solid", bundle: resourceBundle)

    /// The "heroicon-folder-outline" asset catalog image resource.
    static let heroiconFolderOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-folder-outline", bundle: resourceBundle)

    /// The "heroicon-folder-plus-outline" asset catalog image resource.
    static let heroiconFolderPlusOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-folder-plus-outline", bundle: resourceBundle)

    /// The "heroicon-folder-plus-solid" asset catalog image resource.
    static let heroiconFolderPlusSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-folder-plus-solid", bundle: resourceBundle)

    /// The "heroicon-folder-solid" asset catalog image resource.
    static let heroiconFolderSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-folder-solid", bundle: resourceBundle)

    /// The "heroicon-forward-outline" asset catalog image resource.
    static let heroiconForwardOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-forward-outline", bundle: resourceBundle)

    /// The "heroicon-forward-solid" asset catalog image resource.
    static let heroiconForwardSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-forward-solid", bundle: resourceBundle)

    /// The "heroicon-funnel-outline" asset catalog image resource.
    static let heroiconFunnelOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-funnel-outline", bundle: resourceBundle)

    /// The "heroicon-funnel-solid" asset catalog image resource.
    static let heroiconFunnelSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-funnel-solid", bundle: resourceBundle)

    /// The "heroicon-gif-outline" asset catalog image resource.
    static let heroiconGifOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-gif-outline", bundle: resourceBundle)

    /// The "heroicon-gif-solid" asset catalog image resource.
    static let heroiconGifSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-gif-solid", bundle: resourceBundle)

    /// The "heroicon-gift-outline" asset catalog image resource.
    static let heroiconGiftOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-gift-outline", bundle: resourceBundle)

    /// The "heroicon-gift-solid" asset catalog image resource.
    static let heroiconGiftSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-gift-solid", bundle: resourceBundle)

    /// The "heroicon-gift-top-outline" asset catalog image resource.
    static let heroiconGiftTopOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-gift-top-outline", bundle: resourceBundle)

    /// The "heroicon-gift-top-solid" asset catalog image resource.
    static let heroiconGiftTopSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-gift-top-solid", bundle: resourceBundle)

    /// The "heroicon-globe-alt-outline" asset catalog image resource.
    static let heroiconGlobeAltOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-globe-alt-outline", bundle: resourceBundle)

    /// The "heroicon-globe-alt-solid" asset catalog image resource.
    static let heroiconGlobeAltSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-globe-alt-solid", bundle: resourceBundle)

    /// The "heroicon-globe-americas-outline" asset catalog image resource.
    static let heroiconGlobeAmericasOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-globe-americas-outline", bundle: resourceBundle)

    /// The "heroicon-globe-americas-solid" asset catalog image resource.
    static let heroiconGlobeAmericasSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-globe-americas-solid", bundle: resourceBundle)

    /// The "heroicon-globe-asia-australia-outline" asset catalog image resource.
    static let heroiconGlobeAsiaAustraliaOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-globe-asia-australia-outline", bundle: resourceBundle)

    /// The "heroicon-globe-asia-australia-solid" asset catalog image resource.
    static let heroiconGlobeAsiaAustraliaSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-globe-asia-australia-solid", bundle: resourceBundle)

    /// The "heroicon-globe-europe-africa-outline" asset catalog image resource.
    static let heroiconGlobeEuropeAfricaOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-globe-europe-africa-outline", bundle: resourceBundle)

    /// The "heroicon-globe-europe-africa-solid" asset catalog image resource.
    static let heroiconGlobeEuropeAfricaSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-globe-europe-africa-solid", bundle: resourceBundle)

    /// The "heroicon-h1-outline" asset catalog image resource.
    static let heroiconH1Outline = DeveloperToolsSupport.ImageResource(name: "heroicon-h1-outline", bundle: resourceBundle)

    /// The "heroicon-h1-solid" asset catalog image resource.
    static let heroiconH1Solid = DeveloperToolsSupport.ImageResource(name: "heroicon-h1-solid", bundle: resourceBundle)

    /// The "heroicon-h2-outline" asset catalog image resource.
    static let heroiconH2Outline = DeveloperToolsSupport.ImageResource(name: "heroicon-h2-outline", bundle: resourceBundle)

    /// The "heroicon-h2-solid" asset catalog image resource.
    static let heroiconH2Solid = DeveloperToolsSupport.ImageResource(name: "heroicon-h2-solid", bundle: resourceBundle)

    /// The "heroicon-h3-outline" asset catalog image resource.
    static let heroiconH3Outline = DeveloperToolsSupport.ImageResource(name: "heroicon-h3-outline", bundle: resourceBundle)

    /// The "heroicon-h3-solid" asset catalog image resource.
    static let heroiconH3Solid = DeveloperToolsSupport.ImageResource(name: "heroicon-h3-solid", bundle: resourceBundle)

    /// The "heroicon-hand-raised-outline" asset catalog image resource.
    static let heroiconHandRaisedOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-hand-raised-outline", bundle: resourceBundle)

    /// The "heroicon-hand-raised-solid" asset catalog image resource.
    static let heroiconHandRaisedSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-hand-raised-solid", bundle: resourceBundle)

    /// The "heroicon-hand-thumb-down-outline" asset catalog image resource.
    static let heroiconHandThumbDownOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-hand-thumb-down-outline", bundle: resourceBundle)

    /// The "heroicon-hand-thumb-down-solid" asset catalog image resource.
    static let heroiconHandThumbDownSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-hand-thumb-down-solid", bundle: resourceBundle)

    /// The "heroicon-hand-thumb-up-outline" asset catalog image resource.
    static let heroiconHandThumbUpOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-hand-thumb-up-outline", bundle: resourceBundle)

    /// The "heroicon-hand-thumb-up-solid" asset catalog image resource.
    static let heroiconHandThumbUpSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-hand-thumb-up-solid", bundle: resourceBundle)

    /// The "heroicon-hashtag-outline" asset catalog image resource.
    static let heroiconHashtagOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-hashtag-outline", bundle: resourceBundle)

    /// The "heroicon-hashtag-solid" asset catalog image resource.
    static let heroiconHashtagSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-hashtag-solid", bundle: resourceBundle)

    /// The "heroicon-heart-outline" asset catalog image resource.
    static let heroiconHeartOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-heart-outline", bundle: resourceBundle)

    /// The "heroicon-heart-solid" asset catalog image resource.
    static let heroiconHeartSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-heart-solid", bundle: resourceBundle)

    /// The "heroicon-home-modern-outline" asset catalog image resource.
    static let heroiconHomeModernOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-home-modern-outline", bundle: resourceBundle)

    /// The "heroicon-home-modern-solid" asset catalog image resource.
    static let heroiconHomeModernSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-home-modern-solid", bundle: resourceBundle)

    /// The "heroicon-home-outline" asset catalog image resource.
    static let heroiconHomeOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-home-outline", bundle: resourceBundle)

    /// The "heroicon-home-solid" asset catalog image resource.
    static let heroiconHomeSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-home-solid", bundle: resourceBundle)

    /// The "heroicon-identification-outline" asset catalog image resource.
    static let heroiconIdentificationOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-identification-outline", bundle: resourceBundle)

    /// The "heroicon-identification-solid" asset catalog image resource.
    static let heroiconIdentificationSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-identification-solid", bundle: resourceBundle)

    /// The "heroicon-inbox-arrow-down-outline" asset catalog image resource.
    static let heroiconInboxArrowDownOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-inbox-arrow-down-outline", bundle: resourceBundle)

    /// The "heroicon-inbox-arrow-down-solid" asset catalog image resource.
    static let heroiconInboxArrowDownSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-inbox-arrow-down-solid", bundle: resourceBundle)

    /// The "heroicon-inbox-outline" asset catalog image resource.
    static let heroiconInboxOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-inbox-outline", bundle: resourceBundle)

    /// The "heroicon-inbox-solid" asset catalog image resource.
    static let heroiconInboxSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-inbox-solid", bundle: resourceBundle)

    /// The "heroicon-inbox-stack-outline" asset catalog image resource.
    static let heroiconInboxStackOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-inbox-stack-outline", bundle: resourceBundle)

    /// The "heroicon-inbox-stack-solid" asset catalog image resource.
    static let heroiconInboxStackSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-inbox-stack-solid", bundle: resourceBundle)

    /// The "heroicon-information-circle-outline" asset catalog image resource.
    static let heroiconInformationCircleOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-information-circle-outline", bundle: resourceBundle)

    /// The "heroicon-information-circle-solid" asset catalog image resource.
    static let heroiconInformationCircleSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-information-circle-solid", bundle: resourceBundle)

    /// The "heroicon-italic-outline" asset catalog image resource.
    static let heroiconItalicOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-italic-outline", bundle: resourceBundle)

    /// The "heroicon-italic-solid" asset catalog image resource.
    static let heroiconItalicSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-italic-solid", bundle: resourceBundle)

    /// The "heroicon-key-outline" asset catalog image resource.
    static let heroiconKeyOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-key-outline", bundle: resourceBundle)

    /// The "heroicon-key-solid" asset catalog image resource.
    static let heroiconKeySolid = DeveloperToolsSupport.ImageResource(name: "heroicon-key-solid", bundle: resourceBundle)

    /// The "heroicon-language-outline" asset catalog image resource.
    static let heroiconLanguageOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-language-outline", bundle: resourceBundle)

    /// The "heroicon-language-solid" asset catalog image resource.
    static let heroiconLanguageSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-language-solid", bundle: resourceBundle)

    /// The "heroicon-lifebuoy-outline" asset catalog image resource.
    static let heroiconLifebuoyOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-lifebuoy-outline", bundle: resourceBundle)

    /// The "heroicon-lifebuoy-solid" asset catalog image resource.
    static let heroiconLifebuoySolid = DeveloperToolsSupport.ImageResource(name: "heroicon-lifebuoy-solid", bundle: resourceBundle)

    /// The "heroicon-light-bulb-outline" asset catalog image resource.
    static let heroiconLightBulbOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-light-bulb-outline", bundle: resourceBundle)

    /// The "heroicon-light-bulb-solid" asset catalog image resource.
    static let heroiconLightBulbSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-light-bulb-solid", bundle: resourceBundle)

    /// The "heroicon-link-outline" asset catalog image resource.
    static let heroiconLinkOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-link-outline", bundle: resourceBundle)

    /// The "heroicon-link-slash-outline" asset catalog image resource.
    static let heroiconLinkSlashOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-link-slash-outline", bundle: resourceBundle)

    /// The "heroicon-link-slash-solid" asset catalog image resource.
    static let heroiconLinkSlashSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-link-slash-solid", bundle: resourceBundle)

    /// The "heroicon-link-solid" asset catalog image resource.
    static let heroiconLinkSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-link-solid", bundle: resourceBundle)

    /// The "heroicon-list-bullet-outline" asset catalog image resource.
    static let heroiconListBulletOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-list-bullet-outline", bundle: resourceBundle)

    /// The "heroicon-list-bullet-solid" asset catalog image resource.
    static let heroiconListBulletSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-list-bullet-solid", bundle: resourceBundle)

    /// The "heroicon-lock-closed-outline" asset catalog image resource.
    static let heroiconLockClosedOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-lock-closed-outline", bundle: resourceBundle)

    /// The "heroicon-lock-closed-solid" asset catalog image resource.
    static let heroiconLockClosedSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-lock-closed-solid", bundle: resourceBundle)

    /// The "heroicon-lock-open-outline" asset catalog image resource.
    static let heroiconLockOpenOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-lock-open-outline", bundle: resourceBundle)

    /// The "heroicon-lock-open-solid" asset catalog image resource.
    static let heroiconLockOpenSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-lock-open-solid", bundle: resourceBundle)

    /// The "heroicon-magnifying-glass-circle-outline" asset catalog image resource.
    static let heroiconMagnifyingGlassCircleOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-magnifying-glass-circle-outline", bundle: resourceBundle)

    /// The "heroicon-magnifying-glass-circle-solid" asset catalog image resource.
    static let heroiconMagnifyingGlassCircleSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-magnifying-glass-circle-solid", bundle: resourceBundle)

    /// The "heroicon-magnifying-glass-minus-outline" asset catalog image resource.
    static let heroiconMagnifyingGlassMinusOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-magnifying-glass-minus-outline", bundle: resourceBundle)

    /// The "heroicon-magnifying-glass-minus-solid" asset catalog image resource.
    static let heroiconMagnifyingGlassMinusSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-magnifying-glass-minus-solid", bundle: resourceBundle)

    /// The "heroicon-magnifying-glass-outline" asset catalog image resource.
    static let heroiconMagnifyingGlassOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-magnifying-glass-outline", bundle: resourceBundle)

    /// The "heroicon-magnifying-glass-plus-outline" asset catalog image resource.
    static let heroiconMagnifyingGlassPlusOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-magnifying-glass-plus-outline", bundle: resourceBundle)

    /// The "heroicon-magnifying-glass-plus-solid" asset catalog image resource.
    static let heroiconMagnifyingGlassPlusSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-magnifying-glass-plus-solid", bundle: resourceBundle)

    /// The "heroicon-magnifying-glass-solid" asset catalog image resource.
    static let heroiconMagnifyingGlassSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-magnifying-glass-solid", bundle: resourceBundle)

    /// The "heroicon-map-outline" asset catalog image resource.
    static let heroiconMapOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-map-outline", bundle: resourceBundle)

    /// The "heroicon-map-pin-outline" asset catalog image resource.
    static let heroiconMapPinOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-map-pin-outline", bundle: resourceBundle)

    /// The "heroicon-map-pin-solid" asset catalog image resource.
    static let heroiconMapPinSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-map-pin-solid", bundle: resourceBundle)

    /// The "heroicon-map-solid" asset catalog image resource.
    static let heroiconMapSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-map-solid", bundle: resourceBundle)

    /// The "heroicon-megaphone-outline" asset catalog image resource.
    static let heroiconMegaphoneOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-megaphone-outline", bundle: resourceBundle)

    /// The "heroicon-megaphone-solid" asset catalog image resource.
    static let heroiconMegaphoneSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-megaphone-solid", bundle: resourceBundle)

    /// The "heroicon-microphone-outline" asset catalog image resource.
    static let heroiconMicrophoneOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-microphone-outline", bundle: resourceBundle)

    /// The "heroicon-microphone-solid" asset catalog image resource.
    static let heroiconMicrophoneSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-microphone-solid", bundle: resourceBundle)

    /// The "heroicon-minus-circle-outline" asset catalog image resource.
    static let heroiconMinusCircleOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-minus-circle-outline", bundle: resourceBundle)

    /// The "heroicon-minus-circle-solid" asset catalog image resource.
    static let heroiconMinusCircleSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-minus-circle-solid", bundle: resourceBundle)

    /// The "heroicon-minus-outline" asset catalog image resource.
    static let heroiconMinusOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-minus-outline", bundle: resourceBundle)

    /// The "heroicon-minus-small-outline" asset catalog image resource.
    static let heroiconMinusSmallOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-minus-small-outline", bundle: resourceBundle)

    /// The "heroicon-minus-small-solid" asset catalog image resource.
    static let heroiconMinusSmallSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-minus-small-solid", bundle: resourceBundle)

    /// The "heroicon-minus-solid" asset catalog image resource.
    static let heroiconMinusSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-minus-solid", bundle: resourceBundle)

    /// The "heroicon-moon-outline" asset catalog image resource.
    static let heroiconMoonOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-moon-outline", bundle: resourceBundle)

    /// The "heroicon-moon-solid" asset catalog image resource.
    static let heroiconMoonSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-moon-solid", bundle: resourceBundle)

    /// The "heroicon-musical-note-outline" asset catalog image resource.
    static let heroiconMusicalNoteOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-musical-note-outline", bundle: resourceBundle)

    /// The "heroicon-musical-note-solid" asset catalog image resource.
    static let heroiconMusicalNoteSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-musical-note-solid", bundle: resourceBundle)

    /// The "heroicon-newspaper-outline" asset catalog image resource.
    static let heroiconNewspaperOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-newspaper-outline", bundle: resourceBundle)

    /// The "heroicon-newspaper-solid" asset catalog image resource.
    static let heroiconNewspaperSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-newspaper-solid", bundle: resourceBundle)

    /// The "heroicon-no-symbol-outline" asset catalog image resource.
    static let heroiconNoSymbolOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-no-symbol-outline", bundle: resourceBundle)

    /// The "heroicon-no-symbol-solid" asset catalog image resource.
    static let heroiconNoSymbolSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-no-symbol-solid", bundle: resourceBundle)

    /// The "heroicon-numbered-list-outline" asset catalog image resource.
    static let heroiconNumberedListOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-numbered-list-outline", bundle: resourceBundle)

    /// The "heroicon-numbered-list-solid" asset catalog image resource.
    static let heroiconNumberedListSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-numbered-list-solid", bundle: resourceBundle)

    /// The "heroicon-paint-brush-outline" asset catalog image resource.
    static let heroiconPaintBrushOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-paint-brush-outline", bundle: resourceBundle)

    /// The "heroicon-paint-brush-solid" asset catalog image resource.
    static let heroiconPaintBrushSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-paint-brush-solid", bundle: resourceBundle)

    /// The "heroicon-paper-airplane-outline" asset catalog image resource.
    static let heroiconPaperAirplaneOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-paper-airplane-outline", bundle: resourceBundle)

    /// The "heroicon-paper-airplane-solid" asset catalog image resource.
    static let heroiconPaperAirplaneSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-paper-airplane-solid", bundle: resourceBundle)

    /// The "heroicon-paper-clip-outline" asset catalog image resource.
    static let heroiconPaperClipOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-paper-clip-outline", bundle: resourceBundle)

    /// The "heroicon-paper-clip-solid" asset catalog image resource.
    static let heroiconPaperClipSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-paper-clip-solid", bundle: resourceBundle)

    /// The "heroicon-pause-circle-outline" asset catalog image resource.
    static let heroiconPauseCircleOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-pause-circle-outline", bundle: resourceBundle)

    /// The "heroicon-pause-circle-solid" asset catalog image resource.
    static let heroiconPauseCircleSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-pause-circle-solid", bundle: resourceBundle)

    /// The "heroicon-pause-outline" asset catalog image resource.
    static let heroiconPauseOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-pause-outline", bundle: resourceBundle)

    /// The "heroicon-pause-solid" asset catalog image resource.
    static let heroiconPauseSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-pause-solid", bundle: resourceBundle)

    /// The "heroicon-pencil-outline" asset catalog image resource.
    static let heroiconPencilOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-pencil-outline", bundle: resourceBundle)

    /// The "heroicon-pencil-solid" asset catalog image resource.
    static let heroiconPencilSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-pencil-solid", bundle: resourceBundle)

    /// The "heroicon-pencil-square-outline" asset catalog image resource.
    static let heroiconPencilSquareOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-pencil-square-outline", bundle: resourceBundle)

    /// The "heroicon-pencil-square-solid" asset catalog image resource.
    static let heroiconPencilSquareSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-pencil-square-solid", bundle: resourceBundle)

    /// The "heroicon-percent-badge-outline" asset catalog image resource.
    static let heroiconPercentBadgeOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-percent-badge-outline", bundle: resourceBundle)

    /// The "heroicon-percent-badge-solid" asset catalog image resource.
    static let heroiconPercentBadgeSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-percent-badge-solid", bundle: resourceBundle)

    /// The "heroicon-phone-arrow-down-left-outline" asset catalog image resource.
    static let heroiconPhoneArrowDownLeftOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-phone-arrow-down-left-outline", bundle: resourceBundle)

    /// The "heroicon-phone-arrow-down-left-solid" asset catalog image resource.
    static let heroiconPhoneArrowDownLeftSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-phone-arrow-down-left-solid", bundle: resourceBundle)

    /// The "heroicon-phone-arrow-up-right-outline" asset catalog image resource.
    static let heroiconPhoneArrowUpRightOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-phone-arrow-up-right-outline", bundle: resourceBundle)

    /// The "heroicon-phone-arrow-up-right-solid" asset catalog image resource.
    static let heroiconPhoneArrowUpRightSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-phone-arrow-up-right-solid", bundle: resourceBundle)

    /// The "heroicon-phone-outline" asset catalog image resource.
    static let heroiconPhoneOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-phone-outline", bundle: resourceBundle)

    /// The "heroicon-phone-solid" asset catalog image resource.
    static let heroiconPhoneSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-phone-solid", bundle: resourceBundle)

    /// The "heroicon-phone-x-mark-outline" asset catalog image resource.
    static let heroiconPhoneXMarkOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-phone-x-mark-outline", bundle: resourceBundle)

    /// The "heroicon-phone-x-mark-solid" asset catalog image resource.
    static let heroiconPhoneXMarkSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-phone-x-mark-solid", bundle: resourceBundle)

    /// The "heroicon-photo-outline" asset catalog image resource.
    static let heroiconPhotoOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-photo-outline", bundle: resourceBundle)

    /// The "heroicon-photo-solid" asset catalog image resource.
    static let heroiconPhotoSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-photo-solid", bundle: resourceBundle)

    /// The "heroicon-play-circle-outline" asset catalog image resource.
    static let heroiconPlayCircleOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-play-circle-outline", bundle: resourceBundle)

    /// The "heroicon-play-circle-solid" asset catalog image resource.
    static let heroiconPlayCircleSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-play-circle-solid", bundle: resourceBundle)

    /// The "heroicon-play-outline" asset catalog image resource.
    static let heroiconPlayOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-play-outline", bundle: resourceBundle)

    /// The "heroicon-play-pause-outline" asset catalog image resource.
    static let heroiconPlayPauseOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-play-pause-outline", bundle: resourceBundle)

    /// The "heroicon-play-pause-solid" asset catalog image resource.
    static let heroiconPlayPauseSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-play-pause-solid", bundle: resourceBundle)

    /// The "heroicon-play-solid" asset catalog image resource.
    static let heroiconPlaySolid = DeveloperToolsSupport.ImageResource(name: "heroicon-play-solid", bundle: resourceBundle)

    /// The "heroicon-plus-circle-outline" asset catalog image resource.
    static let heroiconPlusCircleOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-plus-circle-outline", bundle: resourceBundle)

    /// The "heroicon-plus-circle-solid" asset catalog image resource.
    static let heroiconPlusCircleSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-plus-circle-solid", bundle: resourceBundle)

    /// The "heroicon-plus-outline" asset catalog image resource.
    static let heroiconPlusOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-plus-outline", bundle: resourceBundle)

    /// The "heroicon-plus-small-outline" asset catalog image resource.
    static let heroiconPlusSmallOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-plus-small-outline", bundle: resourceBundle)

    /// The "heroicon-plus-small-solid" asset catalog image resource.
    static let heroiconPlusSmallSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-plus-small-solid", bundle: resourceBundle)

    /// The "heroicon-plus-solid" asset catalog image resource.
    static let heroiconPlusSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-plus-solid", bundle: resourceBundle)

    /// The "heroicon-power-outline" asset catalog image resource.
    static let heroiconPowerOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-power-outline", bundle: resourceBundle)

    /// The "heroicon-power-solid" asset catalog image resource.
    static let heroiconPowerSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-power-solid", bundle: resourceBundle)

    /// The "heroicon-presentation-chart-bar-outline" asset catalog image resource.
    static let heroiconPresentationChartBarOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-presentation-chart-bar-outline", bundle: resourceBundle)

    /// The "heroicon-presentation-chart-bar-solid" asset catalog image resource.
    static let heroiconPresentationChartBarSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-presentation-chart-bar-solid", bundle: resourceBundle)

    /// The "heroicon-presentation-chart-line-outline" asset catalog image resource.
    static let heroiconPresentationChartLineOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-presentation-chart-line-outline", bundle: resourceBundle)

    /// The "heroicon-presentation-chart-line-solid" asset catalog image resource.
    static let heroiconPresentationChartLineSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-presentation-chart-line-solid", bundle: resourceBundle)

    /// The "heroicon-printer-outline" asset catalog image resource.
    static let heroiconPrinterOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-printer-outline", bundle: resourceBundle)

    /// The "heroicon-printer-solid" asset catalog image resource.
    static let heroiconPrinterSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-printer-solid", bundle: resourceBundle)

    /// The "heroicon-puzzle-piece-outline" asset catalog image resource.
    static let heroiconPuzzlePieceOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-puzzle-piece-outline", bundle: resourceBundle)

    /// The "heroicon-puzzle-piece-solid" asset catalog image resource.
    static let heroiconPuzzlePieceSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-puzzle-piece-solid", bundle: resourceBundle)

    /// The "heroicon-qr-code-outline" asset catalog image resource.
    static let heroiconQrCodeOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-qr-code-outline", bundle: resourceBundle)

    /// The "heroicon-qr-code-solid" asset catalog image resource.
    static let heroiconQrCodeSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-qr-code-solid", bundle: resourceBundle)

    /// The "heroicon-question-mark-circle-outline" asset catalog image resource.
    static let heroiconQuestionMarkCircleOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-question-mark-circle-outline", bundle: resourceBundle)

    /// The "heroicon-question-mark-circle-solid" asset catalog image resource.
    static let heroiconQuestionMarkCircleSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-question-mark-circle-solid", bundle: resourceBundle)

    /// The "heroicon-queue-list-outline" asset catalog image resource.
    static let heroiconQueueListOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-queue-list-outline", bundle: resourceBundle)

    /// The "heroicon-queue-list-solid" asset catalog image resource.
    static let heroiconQueueListSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-queue-list-solid", bundle: resourceBundle)

    /// The "heroicon-radio-outline" asset catalog image resource.
    static let heroiconRadioOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-radio-outline", bundle: resourceBundle)

    /// The "heroicon-radio-solid" asset catalog image resource.
    static let heroiconRadioSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-radio-solid", bundle: resourceBundle)

    /// The "heroicon-receipt-percent-outline" asset catalog image resource.
    static let heroiconReceiptPercentOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-receipt-percent-outline", bundle: resourceBundle)

    /// The "heroicon-receipt-percent-solid" asset catalog image resource.
    static let heroiconReceiptPercentSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-receipt-percent-solid", bundle: resourceBundle)

    /// The "heroicon-receipt-refund-outline" asset catalog image resource.
    static let heroiconReceiptRefundOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-receipt-refund-outline", bundle: resourceBundle)

    /// The "heroicon-receipt-refund-solid" asset catalog image resource.
    static let heroiconReceiptRefundSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-receipt-refund-solid", bundle: resourceBundle)

    /// The "heroicon-rectangle-group-outline" asset catalog image resource.
    static let heroiconRectangleGroupOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-rectangle-group-outline", bundle: resourceBundle)

    /// The "heroicon-rectangle-group-solid" asset catalog image resource.
    static let heroiconRectangleGroupSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-rectangle-group-solid", bundle: resourceBundle)

    /// The "heroicon-rectangle-stack-outline" asset catalog image resource.
    static let heroiconRectangleStackOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-rectangle-stack-outline", bundle: resourceBundle)

    /// The "heroicon-rectangle-stack-solid" asset catalog image resource.
    static let heroiconRectangleStackSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-rectangle-stack-solid", bundle: resourceBundle)

    /// The "heroicon-rocket-launch-outline" asset catalog image resource.
    static let heroiconRocketLaunchOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-rocket-launch-outline", bundle: resourceBundle)

    /// The "heroicon-rocket-launch-solid" asset catalog image resource.
    static let heroiconRocketLaunchSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-rocket-launch-solid", bundle: resourceBundle)

    /// The "heroicon-rss-outline" asset catalog image resource.
    static let heroiconRssOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-rss-outline", bundle: resourceBundle)

    /// The "heroicon-rss-solid" asset catalog image resource.
    static let heroiconRssSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-rss-solid", bundle: resourceBundle)

    /// The "heroicon-scale-outline" asset catalog image resource.
    static let heroiconScaleOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-scale-outline", bundle: resourceBundle)

    /// The "heroicon-scale-solid" asset catalog image resource.
    static let heroiconScaleSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-scale-solid", bundle: resourceBundle)

    /// The "heroicon-scissors-outline" asset catalog image resource.
    static let heroiconScissorsOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-scissors-outline", bundle: resourceBundle)

    /// The "heroicon-scissors-solid" asset catalog image resource.
    static let heroiconScissorsSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-scissors-solid", bundle: resourceBundle)

    /// The "heroicon-server-outline" asset catalog image resource.
    static let heroiconServerOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-server-outline", bundle: resourceBundle)

    /// The "heroicon-server-solid" asset catalog image resource.
    static let heroiconServerSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-server-solid", bundle: resourceBundle)

    /// The "heroicon-server-stack-outline" asset catalog image resource.
    static let heroiconServerStackOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-server-stack-outline", bundle: resourceBundle)

    /// The "heroicon-server-stack-solid" asset catalog image resource.
    static let heroiconServerStackSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-server-stack-solid", bundle: resourceBundle)

    /// The "heroicon-share-outline" asset catalog image resource.
    static let heroiconShareOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-share-outline", bundle: resourceBundle)

    /// The "heroicon-share-solid" asset catalog image resource.
    static let heroiconShareSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-share-solid", bundle: resourceBundle)

    /// The "heroicon-shield-check-outline" asset catalog image resource.
    static let heroiconShieldCheckOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-shield-check-outline", bundle: resourceBundle)

    /// The "heroicon-shield-check-solid" asset catalog image resource.
    static let heroiconShieldCheckSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-shield-check-solid", bundle: resourceBundle)

    /// The "heroicon-shield-exclamation-outline" asset catalog image resource.
    static let heroiconShieldExclamationOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-shield-exclamation-outline", bundle: resourceBundle)

    /// The "heroicon-shield-exclamation-solid" asset catalog image resource.
    static let heroiconShieldExclamationSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-shield-exclamation-solid", bundle: resourceBundle)

    /// The "heroicon-shopping-bag-outline" asset catalog image resource.
    static let heroiconShoppingBagOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-shopping-bag-outline", bundle: resourceBundle)

    /// The "heroicon-shopping-bag-solid" asset catalog image resource.
    static let heroiconShoppingBagSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-shopping-bag-solid", bundle: resourceBundle)

    /// The "heroicon-shopping-cart-outline" asset catalog image resource.
    static let heroiconShoppingCartOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-shopping-cart-outline", bundle: resourceBundle)

    /// The "heroicon-shopping-cart-solid" asset catalog image resource.
    static let heroiconShoppingCartSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-shopping-cart-solid", bundle: resourceBundle)

    /// The "heroicon-signal-outline" asset catalog image resource.
    static let heroiconSignalOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-signal-outline", bundle: resourceBundle)

    /// The "heroicon-signal-slash-outline" asset catalog image resource.
    static let heroiconSignalSlashOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-signal-slash-outline", bundle: resourceBundle)

    /// The "heroicon-signal-slash-solid" asset catalog image resource.
    static let heroiconSignalSlashSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-signal-slash-solid", bundle: resourceBundle)

    /// The "heroicon-signal-solid" asset catalog image resource.
    static let heroiconSignalSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-signal-solid", bundle: resourceBundle)

    /// The "heroicon-slash-outline" asset catalog image resource.
    static let heroiconSlashOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-slash-outline", bundle: resourceBundle)

    /// The "heroicon-slash-solid" asset catalog image resource.
    static let heroiconSlashSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-slash-solid", bundle: resourceBundle)

    /// The "heroicon-sparkles-outline" asset catalog image resource.
    static let heroiconSparklesOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-sparkles-outline", bundle: resourceBundle)

    /// The "heroicon-sparkles-solid" asset catalog image resource.
    static let heroiconSparklesSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-sparkles-solid", bundle: resourceBundle)

    /// The "heroicon-speaker-wave-outline" asset catalog image resource.
    static let heroiconSpeakerWaveOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-speaker-wave-outline", bundle: resourceBundle)

    /// The "heroicon-speaker-wave-solid" asset catalog image resource.
    static let heroiconSpeakerWaveSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-speaker-wave-solid", bundle: resourceBundle)

    /// The "heroicon-speaker-x-mark-outline" asset catalog image resource.
    static let heroiconSpeakerXMarkOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-speaker-x-mark-outline", bundle: resourceBundle)

    /// The "heroicon-speaker-x-mark-solid" asset catalog image resource.
    static let heroiconSpeakerXMarkSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-speaker-x-mark-solid", bundle: resourceBundle)

    /// The "heroicon-square-2-stack-outline" asset catalog image resource.
    static let heroiconSquare2StackOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-square-2-stack-outline", bundle: resourceBundle)

    /// The "heroicon-square-2-stack-solid" asset catalog image resource.
    static let heroiconSquare2StackSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-square-2-stack-solid", bundle: resourceBundle)

    /// The "heroicon-square-3-stack-3d-outline" asset catalog image resource.
    static let heroiconSquare3Stack3DOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-square-3-stack-3d-outline", bundle: resourceBundle)

    /// The "heroicon-square-3-stack-3d-solid" asset catalog image resource.
    static let heroiconSquare3Stack3DSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-square-3-stack-3d-solid", bundle: resourceBundle)

    /// The "heroicon-squares-2x2-outline" asset catalog image resource.
    static let heroiconSquares2X2Outline = DeveloperToolsSupport.ImageResource(name: "heroicon-squares-2x2-outline", bundle: resourceBundle)

    /// The "heroicon-squares-2x2-solid" asset catalog image resource.
    static let heroiconSquares2X2Solid = DeveloperToolsSupport.ImageResource(name: "heroicon-squares-2x2-solid", bundle: resourceBundle)

    /// The "heroicon-squares-plus-outline" asset catalog image resource.
    static let heroiconSquaresPlusOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-squares-plus-outline", bundle: resourceBundle)

    /// The "heroicon-squares-plus-solid" asset catalog image resource.
    static let heroiconSquaresPlusSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-squares-plus-solid", bundle: resourceBundle)

    /// The "heroicon-star-outline" asset catalog image resource.
    static let heroiconStarOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-star-outline", bundle: resourceBundle)

    /// The "heroicon-star-solid" asset catalog image resource.
    static let heroiconStarSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-star-solid", bundle: resourceBundle)

    /// The "heroicon-stop-circle-outline" asset catalog image resource.
    static let heroiconStopCircleOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-stop-circle-outline", bundle: resourceBundle)

    /// The "heroicon-stop-circle-solid" asset catalog image resource.
    static let heroiconStopCircleSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-stop-circle-solid", bundle: resourceBundle)

    /// The "heroicon-stop-outline" asset catalog image resource.
    static let heroiconStopOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-stop-outline", bundle: resourceBundle)

    /// The "heroicon-stop-solid" asset catalog image resource.
    static let heroiconStopSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-stop-solid", bundle: resourceBundle)

    /// The "heroicon-strikethrough-outline" asset catalog image resource.
    static let heroiconStrikethroughOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-strikethrough-outline", bundle: resourceBundle)

    /// The "heroicon-strikethrough-solid" asset catalog image resource.
    static let heroiconStrikethroughSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-strikethrough-solid", bundle: resourceBundle)

    /// The "heroicon-sun-outline" asset catalog image resource.
    static let heroiconSunOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-sun-outline", bundle: resourceBundle)

    /// The "heroicon-sun-solid" asset catalog image resource.
    static let heroiconSunSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-sun-solid", bundle: resourceBundle)

    /// The "heroicon-swatch-outline" asset catalog image resource.
    static let heroiconSwatchOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-swatch-outline", bundle: resourceBundle)

    /// The "heroicon-swatch-solid" asset catalog image resource.
    static let heroiconSwatchSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-swatch-solid", bundle: resourceBundle)

    /// The "heroicon-table-cells-outline" asset catalog image resource.
    static let heroiconTableCellsOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-table-cells-outline", bundle: resourceBundle)

    /// The "heroicon-table-cells-solid" asset catalog image resource.
    static let heroiconTableCellsSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-table-cells-solid", bundle: resourceBundle)

    /// The "heroicon-tag-outline" asset catalog image resource.
    static let heroiconTagOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-tag-outline", bundle: resourceBundle)

    /// The "heroicon-tag-solid" asset catalog image resource.
    static let heroiconTagSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-tag-solid", bundle: resourceBundle)

    /// The "heroicon-ticket-outline" asset catalog image resource.
    static let heroiconTicketOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-ticket-outline", bundle: resourceBundle)

    /// The "heroicon-ticket-solid" asset catalog image resource.
    static let heroiconTicketSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-ticket-solid", bundle: resourceBundle)

    /// The "heroicon-trash-outline" asset catalog image resource.
    static let heroiconTrashOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-trash-outline", bundle: resourceBundle)

    /// The "heroicon-trash-solid" asset catalog image resource.
    static let heroiconTrashSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-trash-solid", bundle: resourceBundle)

    /// The "heroicon-trophy-outline" asset catalog image resource.
    static let heroiconTrophyOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-trophy-outline", bundle: resourceBundle)

    /// The "heroicon-trophy-solid" asset catalog image resource.
    static let heroiconTrophySolid = DeveloperToolsSupport.ImageResource(name: "heroicon-trophy-solid", bundle: resourceBundle)

    /// The "heroicon-truck-outline" asset catalog image resource.
    static let heroiconTruckOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-truck-outline", bundle: resourceBundle)

    /// The "heroicon-truck-solid" asset catalog image resource.
    static let heroiconTruckSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-truck-solid", bundle: resourceBundle)

    /// The "heroicon-tv-outline" asset catalog image resource.
    static let heroiconTvOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-tv-outline", bundle: resourceBundle)

    /// The "heroicon-tv-solid" asset catalog image resource.
    static let heroiconTvSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-tv-solid", bundle: resourceBundle)

    /// The "heroicon-underline-outline" asset catalog image resource.
    static let heroiconUnderlineOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-underline-outline", bundle: resourceBundle)

    /// The "heroicon-underline-solid" asset catalog image resource.
    static let heroiconUnderlineSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-underline-solid", bundle: resourceBundle)

    /// The "heroicon-user-circle-outline" asset catalog image resource.
    static let heroiconUserCircleOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-user-circle-outline", bundle: resourceBundle)

    /// The "heroicon-user-circle-solid" asset catalog image resource.
    static let heroiconUserCircleSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-user-circle-solid", bundle: resourceBundle)

    /// The "heroicon-user-group-outline" asset catalog image resource.
    static let heroiconUserGroupOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-user-group-outline", bundle: resourceBundle)

    /// The "heroicon-user-group-solid" asset catalog image resource.
    static let heroiconUserGroupSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-user-group-solid", bundle: resourceBundle)

    /// The "heroicon-user-minus-outline" asset catalog image resource.
    static let heroiconUserMinusOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-user-minus-outline", bundle: resourceBundle)

    /// The "heroicon-user-minus-solid" asset catalog image resource.
    static let heroiconUserMinusSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-user-minus-solid", bundle: resourceBundle)

    /// The "heroicon-user-outline" asset catalog image resource.
    static let heroiconUserOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-user-outline", bundle: resourceBundle)

    /// The "heroicon-user-plus-outline" asset catalog image resource.
    static let heroiconUserPlusOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-user-plus-outline", bundle: resourceBundle)

    /// The "heroicon-user-plus-solid" asset catalog image resource.
    static let heroiconUserPlusSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-user-plus-solid", bundle: resourceBundle)

    /// The "heroicon-user-solid" asset catalog image resource.
    static let heroiconUserSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-user-solid", bundle: resourceBundle)

    /// The "heroicon-users-outline" asset catalog image resource.
    static let heroiconUsersOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-users-outline", bundle: resourceBundle)

    /// The "heroicon-users-solid" asset catalog image resource.
    static let heroiconUsersSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-users-solid", bundle: resourceBundle)

    /// The "heroicon-variable-outline" asset catalog image resource.
    static let heroiconVariableOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-variable-outline", bundle: resourceBundle)

    /// The "heroicon-variable-solid" asset catalog image resource.
    static let heroiconVariableSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-variable-solid", bundle: resourceBundle)

    /// The "heroicon-video-camera-outline" asset catalog image resource.
    static let heroiconVideoCameraOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-video-camera-outline", bundle: resourceBundle)

    /// The "heroicon-video-camera-slash-outline" asset catalog image resource.
    static let heroiconVideoCameraSlashOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-video-camera-slash-outline", bundle: resourceBundle)

    /// The "heroicon-video-camera-slash-solid" asset catalog image resource.
    static let heroiconVideoCameraSlashSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-video-camera-slash-solid", bundle: resourceBundle)

    /// The "heroicon-video-camera-solid" asset catalog image resource.
    static let heroiconVideoCameraSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-video-camera-solid", bundle: resourceBundle)

    /// The "heroicon-view-columns-outline" asset catalog image resource.
    static let heroiconViewColumnsOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-view-columns-outline", bundle: resourceBundle)

    /// The "heroicon-view-columns-solid" asset catalog image resource.
    static let heroiconViewColumnsSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-view-columns-solid", bundle: resourceBundle)

    /// The "heroicon-viewfinder-circle-outline" asset catalog image resource.
    static let heroiconViewfinderCircleOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-viewfinder-circle-outline", bundle: resourceBundle)

    /// The "heroicon-viewfinder-circle-solid" asset catalog image resource.
    static let heroiconViewfinderCircleSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-viewfinder-circle-solid", bundle: resourceBundle)

    /// The "heroicon-wallet-outline" asset catalog image resource.
    static let heroiconWalletOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-wallet-outline", bundle: resourceBundle)

    /// The "heroicon-wallet-solid" asset catalog image resource.
    static let heroiconWalletSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-wallet-solid", bundle: resourceBundle)

    /// The "heroicon-wifi-outline" asset catalog image resource.
    static let heroiconWifiOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-wifi-outline", bundle: resourceBundle)

    /// The "heroicon-wifi-solid" asset catalog image resource.
    static let heroiconWifiSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-wifi-solid", bundle: resourceBundle)

    /// The "heroicon-window-outline" asset catalog image resource.
    static let heroiconWindowOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-window-outline", bundle: resourceBundle)

    /// The "heroicon-window-solid" asset catalog image resource.
    static let heroiconWindowSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-window-solid", bundle: resourceBundle)

    /// The "heroicon-wrench-outline" asset catalog image resource.
    static let heroiconWrenchOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-wrench-outline", bundle: resourceBundle)

    /// The "heroicon-wrench-screwdriver-outline" asset catalog image resource.
    static let heroiconWrenchScrewdriverOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-wrench-screwdriver-outline", bundle: resourceBundle)

    /// The "heroicon-wrench-screwdriver-solid" asset catalog image resource.
    static let heroiconWrenchScrewdriverSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-wrench-screwdriver-solid", bundle: resourceBundle)

    /// The "heroicon-wrench-solid" asset catalog image resource.
    static let heroiconWrenchSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-wrench-solid", bundle: resourceBundle)

    /// The "heroicon-x-circle-outline" asset catalog image resource.
    static let heroiconXCircleOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-x-circle-outline", bundle: resourceBundle)

    /// The "heroicon-x-circle-solid" asset catalog image resource.
    static let heroiconXCircleSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-x-circle-solid", bundle: resourceBundle)

    /// The "heroicon-x-mark-outline" asset catalog image resource.
    static let heroiconXMarkOutline = DeveloperToolsSupport.ImageResource(name: "heroicon-x-mark-outline", bundle: resourceBundle)

    /// The "heroicon-x-mark-solid" asset catalog image resource.
    static let heroiconXMarkSolid = DeveloperToolsSupport.ImageResource(name: "heroicon-x-mark-solid", bundle: resourceBundle)

}

// MARK: - Color Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    /// The "AccentColor" asset catalog color.
    static var accent: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .accent)
#else
        .init()
#endif
    }

    /// The "AccentPrimary" asset catalog color.
    static var accentPrimary: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .accentPrimary)
#else
        .init()
#endif
    }

    /// The "AccentSoft" asset catalog color.
    static var accentSoft: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .accentSoft)
#else
        .init()
#endif
    }

    /// The "Background" asset catalog color.
    static var background: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .background)
#else
        .init()
#endif
    }

    /// The "Border" asset catalog color.
    static var border: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .border)
#else
        .init()
#endif
    }

    /// The "CardBackground" asset catalog color.
    static var cardBackground: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .cardBackground)
#else
        .init()
#endif
    }

    /// The "Surface" asset catalog color.
    static var surface: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .surface)
#else
        .init()
#endif
    }

    /// The "TextPrimary" asset catalog color.
    static var textPrimary: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .textPrimary)
#else
        .init()
#endif
    }

    /// The "TextSecondary" asset catalog color.
    static var textSecondary: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .textSecondary)
#else
        .init()
#endif
    }

    /// The "TextTertiary" asset catalog color.
    static var textTertiary: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .textTertiary)
#else
        .init()
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    /// The "AccentColor" asset catalog color.
    static var accent: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .accent)
#else
        .init()
#endif
    }

    /// The "AccentPrimary" asset catalog color.
    static var accentPrimary: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .accentPrimary)
#else
        .init()
#endif
    }

    /// The "AccentSoft" asset catalog color.
    static var accentSoft: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .accentSoft)
#else
        .init()
#endif
    }

    /// The "Background" asset catalog color.
    static var background: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .background)
#else
        .init()
#endif
    }

    /// The "Border" asset catalog color.
    static var border: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .border)
#else
        .init()
#endif
    }

    /// The "CardBackground" asset catalog color.
    static var cardBackground: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .cardBackground)
#else
        .init()
#endif
    }

    /// The "Surface" asset catalog color.
    static var surface: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .surface)
#else
        .init()
#endif
    }

    /// The "TextPrimary" asset catalog color.
    static var textPrimary: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .textPrimary)
#else
        .init()
#endif
    }

    /// The "TextSecondary" asset catalog color.
    static var textSecondary: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .textSecondary)
#else
        .init()
#endif
    }

    /// The "TextTertiary" asset catalog color.
    static var textTertiary: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .textTertiary)
#else
        .init()
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

    /// The "AccentColor" asset catalog color.
    static var accent: SwiftUI.Color { .init(.accent) }

    /// The "AccentPrimary" asset catalog color.
    static var accentPrimary: SwiftUI.Color { .init(.accentPrimary) }

    /// The "AccentSoft" asset catalog color.
    static var accentSoft: SwiftUI.Color { .init(.accentSoft) }

    /// The "Background" asset catalog color.
    static var background: SwiftUI.Color { .init(.background) }

    /// The "Border" asset catalog color.
    static var border: SwiftUI.Color { .init(.border) }

    /// The "CardBackground" asset catalog color.
    static var cardBackground: SwiftUI.Color { .init(.cardBackground) }

    /// The "Surface" asset catalog color.
    static var surface: SwiftUI.Color { .init(.surface) }

    /// The "TextPrimary" asset catalog color.
    static var textPrimary: SwiftUI.Color { .init(.textPrimary) }

    /// The "TextSecondary" asset catalog color.
    static var textSecondary: SwiftUI.Color { .init(.textSecondary) }

    /// The "TextTertiary" asset catalog color.
    static var textTertiary: SwiftUI.Color { .init(.textTertiary) }

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    /// The "AccentColor" asset catalog color.
    static var accent: SwiftUI.Color { .init(.accent) }

    /// The "AccentPrimary" asset catalog color.
    static var accentPrimary: SwiftUI.Color { .init(.accentPrimary) }

    /// The "AccentSoft" asset catalog color.
    static var accentSoft: SwiftUI.Color { .init(.accentSoft) }

    /// The "Background" asset catalog color.
    static var background: SwiftUI.Color { .init(.background) }

    /// The "Border" asset catalog color.
    static var border: SwiftUI.Color { .init(.border) }

    /// The "CardBackground" asset catalog color.
    static var cardBackground: SwiftUI.Color { .init(.cardBackground) }

    /// The "Surface" asset catalog color.
    static var surface: SwiftUI.Color { .init(.surface) }

    /// The "TextPrimary" asset catalog color.
    static var textPrimary: SwiftUI.Color { .init(.textPrimary) }

    /// The "TextSecondary" asset catalog color.
    static var textSecondary: SwiftUI.Color { .init(.textSecondary) }

    /// The "TextTertiary" asset catalog color.
    static var textTertiary: SwiftUI.Color { .init(.textTertiary) }

}
#endif

// MARK: - Image Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    /// The "heroicon-academic-cap-outline" asset catalog image.
    static var heroiconAcademicCapOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconAcademicCapOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-academic-cap-solid" asset catalog image.
    static var heroiconAcademicCapSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconAcademicCapSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-adjustments-horizontal-outline" asset catalog image.
    static var heroiconAdjustmentsHorizontalOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconAdjustmentsHorizontalOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-adjustments-horizontal-solid" asset catalog image.
    static var heroiconAdjustmentsHorizontalSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconAdjustmentsHorizontalSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-adjustments-vertical-outline" asset catalog image.
    static var heroiconAdjustmentsVerticalOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconAdjustmentsVerticalOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-adjustments-vertical-solid" asset catalog image.
    static var heroiconAdjustmentsVerticalSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconAdjustmentsVerticalSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-archive-box-arrow-down-outline" asset catalog image.
    static var heroiconArchiveBoxArrowDownOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArchiveBoxArrowDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-archive-box-arrow-down-solid" asset catalog image.
    static var heroiconArchiveBoxArrowDownSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArchiveBoxArrowDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-archive-box-outline" asset catalog image.
    static var heroiconArchiveBoxOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArchiveBoxOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-archive-box-solid" asset catalog image.
    static var heroiconArchiveBoxSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArchiveBoxSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-archive-box-x-mark-outline" asset catalog image.
    static var heroiconArchiveBoxXMarkOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArchiveBoxXMarkOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-archive-box-x-mark-solid" asset catalog image.
    static var heroiconArchiveBoxXMarkSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArchiveBoxXMarkSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-down-circle-outline" asset catalog image.
    static var heroiconArrowDownCircleOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowDownCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-down-circle-solid" asset catalog image.
    static var heroiconArrowDownCircleSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowDownCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-down-left-outline" asset catalog image.
    static var heroiconArrowDownLeftOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowDownLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-down-left-solid" asset catalog image.
    static var heroiconArrowDownLeftSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowDownLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-down-on-square-outline" asset catalog image.
    static var heroiconArrowDownOnSquareOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowDownOnSquareOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-down-on-square-solid" asset catalog image.
    static var heroiconArrowDownOnSquareSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowDownOnSquareSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-down-on-square-stack-outline" asset catalog image.
    static var heroiconArrowDownOnSquareStackOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowDownOnSquareStackOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-down-on-square-stack-solid" asset catalog image.
    static var heroiconArrowDownOnSquareStackSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowDownOnSquareStackSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-down-outline" asset catalog image.
    static var heroiconArrowDownOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-down-right-outline" asset catalog image.
    static var heroiconArrowDownRightOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowDownRightOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-down-right-solid" asset catalog image.
    static var heroiconArrowDownRightSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowDownRightSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-down-solid" asset catalog image.
    static var heroiconArrowDownSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-down-tray-outline" asset catalog image.
    static var heroiconArrowDownTrayOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowDownTrayOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-down-tray-solid" asset catalog image.
    static var heroiconArrowDownTraySolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowDownTraySolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-left-circle-outline" asset catalog image.
    static var heroiconArrowLeftCircleOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowLeftCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-left-circle-solid" asset catalog image.
    static var heroiconArrowLeftCircleSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowLeftCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-left-end-on-rectangle-outline" asset catalog image.
    static var heroiconArrowLeftEndOnRectangleOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowLeftEndOnRectangleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-left-end-on-rectangle-solid" asset catalog image.
    static var heroiconArrowLeftEndOnRectangleSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowLeftEndOnRectangleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-left-on-rectangle-outline" asset catalog image.
    static var heroiconArrowLeftOnRectangleOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowLeftOnRectangleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-left-on-rectangle-solid" asset catalog image.
    static var heroiconArrowLeftOnRectangleSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowLeftOnRectangleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-left-outline" asset catalog image.
    static var heroiconArrowLeftOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-left-solid" asset catalog image.
    static var heroiconArrowLeftSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-left-start-on-rectangle-outline" asset catalog image.
    static var heroiconArrowLeftStartOnRectangleOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowLeftStartOnRectangleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-left-start-on-rectangle-solid" asset catalog image.
    static var heroiconArrowLeftStartOnRectangleSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowLeftStartOnRectangleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-long-down-outline" asset catalog image.
    static var heroiconArrowLongDownOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowLongDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-long-down-solid" asset catalog image.
    static var heroiconArrowLongDownSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowLongDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-long-left-outline" asset catalog image.
    static var heroiconArrowLongLeftOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowLongLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-long-left-solid" asset catalog image.
    static var heroiconArrowLongLeftSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowLongLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-long-right-outline" asset catalog image.
    static var heroiconArrowLongRightOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowLongRightOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-long-right-solid" asset catalog image.
    static var heroiconArrowLongRightSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowLongRightSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-long-up-outline" asset catalog image.
    static var heroiconArrowLongUpOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowLongUpOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-long-up-solid" asset catalog image.
    static var heroiconArrowLongUpSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowLongUpSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-path-outline" asset catalog image.
    static var heroiconArrowPathOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowPathOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-path-rounded-square-outline" asset catalog image.
    static var heroiconArrowPathRoundedSquareOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowPathRoundedSquareOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-path-rounded-square-solid" asset catalog image.
    static var heroiconArrowPathRoundedSquareSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowPathRoundedSquareSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-path-solid" asset catalog image.
    static var heroiconArrowPathSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowPathSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-right-circle-outline" asset catalog image.
    static var heroiconArrowRightCircleOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowRightCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-right-circle-solid" asset catalog image.
    static var heroiconArrowRightCircleSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowRightCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-right-end-on-rectangle-outline" asset catalog image.
    static var heroiconArrowRightEndOnRectangleOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowRightEndOnRectangleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-right-end-on-rectangle-solid" asset catalog image.
    static var heroiconArrowRightEndOnRectangleSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowRightEndOnRectangleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-right-on-rectangle-outline" asset catalog image.
    static var heroiconArrowRightOnRectangleOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowRightOnRectangleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-right-on-rectangle-solid" asset catalog image.
    static var heroiconArrowRightOnRectangleSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowRightOnRectangleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-right-outline" asset catalog image.
    static var heroiconArrowRightOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowRightOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-right-solid" asset catalog image.
    static var heroiconArrowRightSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowRightSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-right-start-on-rectangle-outline" asset catalog image.
    static var heroiconArrowRightStartOnRectangleOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowRightStartOnRectangleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-right-start-on-rectangle-solid" asset catalog image.
    static var heroiconArrowRightStartOnRectangleSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowRightStartOnRectangleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-small-down-outline" asset catalog image.
    static var heroiconArrowSmallDownOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowSmallDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-small-down-solid" asset catalog image.
    static var heroiconArrowSmallDownSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowSmallDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-small-left-outline" asset catalog image.
    static var heroiconArrowSmallLeftOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowSmallLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-small-left-solid" asset catalog image.
    static var heroiconArrowSmallLeftSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowSmallLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-small-right-outline" asset catalog image.
    static var heroiconArrowSmallRightOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowSmallRightOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-small-right-solid" asset catalog image.
    static var heroiconArrowSmallRightSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowSmallRightSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-small-up-outline" asset catalog image.
    static var heroiconArrowSmallUpOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowSmallUpOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-small-up-solid" asset catalog image.
    static var heroiconArrowSmallUpSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowSmallUpSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-top-right-on-square-outline" asset catalog image.
    static var heroiconArrowTopRightOnSquareOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowTopRightOnSquareOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-top-right-on-square-solid" asset catalog image.
    static var heroiconArrowTopRightOnSquareSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowTopRightOnSquareSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-trending-down-outline" asset catalog image.
    static var heroiconArrowTrendingDownOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowTrendingDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-trending-down-solid" asset catalog image.
    static var heroiconArrowTrendingDownSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowTrendingDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-trending-up-outline" asset catalog image.
    static var heroiconArrowTrendingUpOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowTrendingUpOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-trending-up-solid" asset catalog image.
    static var heroiconArrowTrendingUpSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowTrendingUpSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-down-left-outline" asset catalog image.
    static var heroiconArrowTurnDownLeftOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowTurnDownLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-down-left-solid" asset catalog image.
    static var heroiconArrowTurnDownLeftSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowTurnDownLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-down-right-outline" asset catalog image.
    static var heroiconArrowTurnDownRightOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowTurnDownRightOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-down-right-solid" asset catalog image.
    static var heroiconArrowTurnDownRightSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowTurnDownRightSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-left-down-outline" asset catalog image.
    static var heroiconArrowTurnLeftDownOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowTurnLeftDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-left-down-solid" asset catalog image.
    static var heroiconArrowTurnLeftDownSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowTurnLeftDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-left-up-outline" asset catalog image.
    static var heroiconArrowTurnLeftUpOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowTurnLeftUpOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-left-up-solid" asset catalog image.
    static var heroiconArrowTurnLeftUpSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowTurnLeftUpSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-right-down-outline" asset catalog image.
    static var heroiconArrowTurnRightDownOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowTurnRightDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-right-down-solid" asset catalog image.
    static var heroiconArrowTurnRightDownSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowTurnRightDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-right-up-outline" asset catalog image.
    static var heroiconArrowTurnRightUpOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowTurnRightUpOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-right-up-solid" asset catalog image.
    static var heroiconArrowTurnRightUpSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowTurnRightUpSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-up-left-outline" asset catalog image.
    static var heroiconArrowTurnUpLeftOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowTurnUpLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-up-left-solid" asset catalog image.
    static var heroiconArrowTurnUpLeftSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowTurnUpLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-up-right-outline" asset catalog image.
    static var heroiconArrowTurnUpRightOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowTurnUpRightOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-up-right-solid" asset catalog image.
    static var heroiconArrowTurnUpRightSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowTurnUpRightSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-up-circle-outline" asset catalog image.
    static var heroiconArrowUpCircleOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowUpCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-up-circle-solid" asset catalog image.
    static var heroiconArrowUpCircleSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowUpCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-up-left-outline" asset catalog image.
    static var heroiconArrowUpLeftOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowUpLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-up-left-solid" asset catalog image.
    static var heroiconArrowUpLeftSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowUpLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-up-on-square-outline" asset catalog image.
    static var heroiconArrowUpOnSquareOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowUpOnSquareOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-up-on-square-solid" asset catalog image.
    static var heroiconArrowUpOnSquareSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowUpOnSquareSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-up-on-square-stack-outline" asset catalog image.
    static var heroiconArrowUpOnSquareStackOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowUpOnSquareStackOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-up-on-square-stack-solid" asset catalog image.
    static var heroiconArrowUpOnSquareStackSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowUpOnSquareStackSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-up-outline" asset catalog image.
    static var heroiconArrowUpOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowUpOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-up-right-outline" asset catalog image.
    static var heroiconArrowUpRightOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowUpRightOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-up-right-solid" asset catalog image.
    static var heroiconArrowUpRightSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowUpRightSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-up-solid" asset catalog image.
    static var heroiconArrowUpSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowUpSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-up-tray-outline" asset catalog image.
    static var heroiconArrowUpTrayOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowUpTrayOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-up-tray-solid" asset catalog image.
    static var heroiconArrowUpTraySolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowUpTraySolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-uturn-down-outline" asset catalog image.
    static var heroiconArrowUturnDownOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowUturnDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-uturn-down-solid" asset catalog image.
    static var heroiconArrowUturnDownSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowUturnDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-uturn-left-outline" asset catalog image.
    static var heroiconArrowUturnLeftOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowUturnLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-uturn-left-solid" asset catalog image.
    static var heroiconArrowUturnLeftSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowUturnLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-uturn-right-outline" asset catalog image.
    static var heroiconArrowUturnRightOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowUturnRightOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-uturn-right-solid" asset catalog image.
    static var heroiconArrowUturnRightSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowUturnRightSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-uturn-up-outline" asset catalog image.
    static var heroiconArrowUturnUpOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowUturnUpOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-uturn-up-solid" asset catalog image.
    static var heroiconArrowUturnUpSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowUturnUpSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrows-pointing-in-outline" asset catalog image.
    static var heroiconArrowsPointingInOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowsPointingInOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrows-pointing-in-solid" asset catalog image.
    static var heroiconArrowsPointingInSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowsPointingInSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrows-pointing-out-outline" asset catalog image.
    static var heroiconArrowsPointingOutOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowsPointingOutOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrows-pointing-out-solid" asset catalog image.
    static var heroiconArrowsPointingOutSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowsPointingOutSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrows-right-left-outline" asset catalog image.
    static var heroiconArrowsRightLeftOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowsRightLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrows-right-left-solid" asset catalog image.
    static var heroiconArrowsRightLeftSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowsRightLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrows-up-down-outline" asset catalog image.
    static var heroiconArrowsUpDownOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowsUpDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrows-up-down-solid" asset catalog image.
    static var heroiconArrowsUpDownSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconArrowsUpDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-at-symbol-outline" asset catalog image.
    static var heroiconAtSymbolOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconAtSymbolOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-at-symbol-solid" asset catalog image.
    static var heroiconAtSymbolSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconAtSymbolSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-backspace-outline" asset catalog image.
    static var heroiconBackspaceOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBackspaceOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-backspace-solid" asset catalog image.
    static var heroiconBackspaceSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBackspaceSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-backward-outline" asset catalog image.
    static var heroiconBackwardOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBackwardOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-backward-solid" asset catalog image.
    static var heroiconBackwardSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBackwardSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-banknotes-outline" asset catalog image.
    static var heroiconBanknotesOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBanknotesOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-banknotes-solid" asset catalog image.
    static var heroiconBanknotesSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBanknotesSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-2-outline" asset catalog image.
    static var heroiconBars2Outline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBars2Outline)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-2-solid" asset catalog image.
    static var heroiconBars2Solid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBars2Solid)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-3-bottom-left-outline" asset catalog image.
    static var heroiconBars3BottomLeftOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBars3BottomLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-3-bottom-left-solid" asset catalog image.
    static var heroiconBars3BottomLeftSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBars3BottomLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-3-bottom-right-outline" asset catalog image.
    static var heroiconBars3BottomRightOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBars3BottomRightOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-3-bottom-right-solid" asset catalog image.
    static var heroiconBars3BottomRightSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBars3BottomRightSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-3-center-left-outline" asset catalog image.
    static var heroiconBars3CenterLeftOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBars3CenterLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-3-center-left-solid" asset catalog image.
    static var heroiconBars3CenterLeftSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBars3CenterLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-3-outline" asset catalog image.
    static var heroiconBars3Outline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBars3Outline)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-3-solid" asset catalog image.
    static var heroiconBars3Solid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBars3Solid)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-4-outline" asset catalog image.
    static var heroiconBars4Outline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBars4Outline)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-4-solid" asset catalog image.
    static var heroiconBars4Solid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBars4Solid)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-arrow-down-outline" asset catalog image.
    static var heroiconBarsArrowDownOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBarsArrowDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-arrow-down-solid" asset catalog image.
    static var heroiconBarsArrowDownSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBarsArrowDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-arrow-up-outline" asset catalog image.
    static var heroiconBarsArrowUpOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBarsArrowUpOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-arrow-up-solid" asset catalog image.
    static var heroiconBarsArrowUpSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBarsArrowUpSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-battery-0-outline" asset catalog image.
    static var heroiconBattery0Outline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBattery0Outline)
#else
        .init()
#endif
    }

    /// The "heroicon-battery-0-solid" asset catalog image.
    static var heroiconBattery0Solid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBattery0Solid)
#else
        .init()
#endif
    }

    /// The "heroicon-battery-100-outline" asset catalog image.
    static var heroiconBattery100Outline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBattery100Outline)
#else
        .init()
#endif
    }

    /// The "heroicon-battery-100-solid" asset catalog image.
    static var heroiconBattery100Solid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBattery100Solid)
#else
        .init()
#endif
    }

    /// The "heroicon-battery-50-outline" asset catalog image.
    static var heroiconBattery50Outline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBattery50Outline)
#else
        .init()
#endif
    }

    /// The "heroicon-battery-50-solid" asset catalog image.
    static var heroiconBattery50Solid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBattery50Solid)
#else
        .init()
#endif
    }

    /// The "heroicon-beaker-outline" asset catalog image.
    static var heroiconBeakerOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBeakerOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-beaker-solid" asset catalog image.
    static var heroiconBeakerSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBeakerSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bell-alert-outline" asset catalog image.
    static var heroiconBellAlertOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBellAlertOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bell-alert-solid" asset catalog image.
    static var heroiconBellAlertSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBellAlertSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bell-outline" asset catalog image.
    static var heroiconBellOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBellOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bell-slash-outline" asset catalog image.
    static var heroiconBellSlashOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBellSlashOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bell-slash-solid" asset catalog image.
    static var heroiconBellSlashSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBellSlashSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bell-snooze-outline" asset catalog image.
    static var heroiconBellSnoozeOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBellSnoozeOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bell-snooze-solid" asset catalog image.
    static var heroiconBellSnoozeSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBellSnoozeSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bell-solid" asset catalog image.
    static var heroiconBellSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBellSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bold-outline" asset catalog image.
    static var heroiconBoldOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBoldOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bold-solid" asset catalog image.
    static var heroiconBoldSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBoldSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bolt-outline" asset catalog image.
    static var heroiconBoltOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBoltOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bolt-slash-outline" asset catalog image.
    static var heroiconBoltSlashOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBoltSlashOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bolt-slash-solid" asset catalog image.
    static var heroiconBoltSlashSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBoltSlashSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bolt-solid" asset catalog image.
    static var heroiconBoltSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBoltSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-book-open-outline" asset catalog image.
    static var heroiconBookOpenOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBookOpenOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-book-open-solid" asset catalog image.
    static var heroiconBookOpenSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBookOpenSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bookmark-outline" asset catalog image.
    static var heroiconBookmarkOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBookmarkOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bookmark-slash-outline" asset catalog image.
    static var heroiconBookmarkSlashOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBookmarkSlashOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bookmark-slash-solid" asset catalog image.
    static var heroiconBookmarkSlashSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBookmarkSlashSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bookmark-solid" asset catalog image.
    static var heroiconBookmarkSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBookmarkSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bookmark-square-outline" asset catalog image.
    static var heroiconBookmarkSquareOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBookmarkSquareOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bookmark-square-solid" asset catalog image.
    static var heroiconBookmarkSquareSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBookmarkSquareSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-briefcase-outline" asset catalog image.
    static var heroiconBriefcaseOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBriefcaseOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-briefcase-solid" asset catalog image.
    static var heroiconBriefcaseSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBriefcaseSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bug-ant-outline" asset catalog image.
    static var heroiconBugAntOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBugAntOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bug-ant-solid" asset catalog image.
    static var heroiconBugAntSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBugAntSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-building-library-outline" asset catalog image.
    static var heroiconBuildingLibraryOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBuildingLibraryOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-building-library-solid" asset catalog image.
    static var heroiconBuildingLibrarySolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBuildingLibrarySolid)
#else
        .init()
#endif
    }

    /// The "heroicon-building-office-2-outline" asset catalog image.
    static var heroiconBuildingOffice2Outline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBuildingOffice2Outline)
#else
        .init()
#endif
    }

    /// The "heroicon-building-office-2-solid" asset catalog image.
    static var heroiconBuildingOffice2Solid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBuildingOffice2Solid)
#else
        .init()
#endif
    }

    /// The "heroicon-building-office-outline" asset catalog image.
    static var heroiconBuildingOfficeOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBuildingOfficeOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-building-office-solid" asset catalog image.
    static var heroiconBuildingOfficeSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBuildingOfficeSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-building-storefront-outline" asset catalog image.
    static var heroiconBuildingStorefrontOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBuildingStorefrontOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-building-storefront-solid" asset catalog image.
    static var heroiconBuildingStorefrontSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconBuildingStorefrontSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-cake-outline" asset catalog image.
    static var heroiconCakeOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCakeOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-cake-solid" asset catalog image.
    static var heroiconCakeSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCakeSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-calculator-outline" asset catalog image.
    static var heroiconCalculatorOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCalculatorOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-calculator-solid" asset catalog image.
    static var heroiconCalculatorSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCalculatorSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-calendar-date-range-outline" asset catalog image.
    static var heroiconCalendarDateRangeOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCalendarDateRangeOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-calendar-date-range-solid" asset catalog image.
    static var heroiconCalendarDateRangeSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCalendarDateRangeSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-calendar-days" asset catalog image.
    static var heroiconCalendarDays: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCalendarDays)
#else
        .init()
#endif
    }

    /// The "heroicon-calendar-days-solid" asset catalog image.
    static var heroiconCalendarDaysSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCalendarDaysSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-calendar-outline" asset catalog image.
    static var heroiconCalendarOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCalendarOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-calendar-solid" asset catalog image.
    static var heroiconCalendarSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCalendarSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-camera" asset catalog image.
    static var heroiconCamera: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCamera)
#else
        .init()
#endif
    }

    /// The "heroicon-camera-solid" asset catalog image.
    static var heroiconCameraSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCameraSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chart-bar" asset catalog image.
    static var heroiconChartBar: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChartBar)
#else
        .init()
#endif
    }

    /// The "heroicon-chart-bar-solid" asset catalog image.
    static var heroiconChartBarSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChartBarSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chart-bar-square-outline" asset catalog image.
    static var heroiconChartBarSquareOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChartBarSquareOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-chart-bar-square-solid" asset catalog image.
    static var heroiconChartBarSquareSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChartBarSquareSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chart-pie" asset catalog image.
    static var heroiconChartPie: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChartPie)
#else
        .init()
#endif
    }

    /// The "heroicon-chart-pie-solid" asset catalog image.
    static var heroiconChartPieSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChartPieSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chat-bubble-bottom-center-outline" asset catalog image.
    static var heroiconChatBubbleBottomCenterOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChatBubbleBottomCenterOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-chat-bubble-bottom-center-solid" asset catalog image.
    static var heroiconChatBubbleBottomCenterSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChatBubbleBottomCenterSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chat-bubble-bottom-center-text" asset catalog image.
    static var heroiconChatBubbleBottomCenterText: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChatBubbleBottomCenterText)
#else
        .init()
#endif
    }

    /// The "heroicon-chat-bubble-bottom-center-text-solid" asset catalog image.
    static var heroiconChatBubbleBottomCenterTextSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChatBubbleBottomCenterTextSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chat-bubble-left-ellipsis" asset catalog image.
    static var heroiconChatBubbleLeftEllipsis: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChatBubbleLeftEllipsis)
#else
        .init()
#endif
    }

    /// The "heroicon-chat-bubble-left-ellipsis-solid" asset catalog image.
    static var heroiconChatBubbleLeftEllipsisSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChatBubbleLeftEllipsisSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chat-bubble-left-outline" asset catalog image.
    static var heroiconChatBubbleLeftOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChatBubbleLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-chat-bubble-left-right-outline" asset catalog image.
    static var heroiconChatBubbleLeftRightOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChatBubbleLeftRightOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-chat-bubble-left-right-solid" asset catalog image.
    static var heroiconChatBubbleLeftRightSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChatBubbleLeftRightSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chat-bubble-left-solid" asset catalog image.
    static var heroiconChatBubbleLeftSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChatBubbleLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chat-bubble-oval-left-ellipsis-outline" asset catalog image.
    static var heroiconChatBubbleOvalLeftEllipsisOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChatBubbleOvalLeftEllipsisOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-chat-bubble-oval-left-ellipsis-solid" asset catalog image.
    static var heroiconChatBubbleOvalLeftEllipsisSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChatBubbleOvalLeftEllipsisSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chat-bubble-oval-left-outline" asset catalog image.
    static var heroiconChatBubbleOvalLeftOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChatBubbleOvalLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-chat-bubble-oval-left-solid" asset catalog image.
    static var heroiconChatBubbleOvalLeftSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChatBubbleOvalLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-check-badge-outline" asset catalog image.
    static var heroiconCheckBadgeOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCheckBadgeOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-check-badge-solid" asset catalog image.
    static var heroiconCheckBadgeSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCheckBadgeSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-check-circle-outline" asset catalog image.
    static var heroiconCheckCircleOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCheckCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-check-circle-solid" asset catalog image.
    static var heroiconCheckCircleSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCheckCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-check-outline" asset catalog image.
    static var heroiconCheckOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCheckOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-check-solid" asset catalog image.
    static var heroiconCheckSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCheckSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-double-down-outline" asset catalog image.
    static var heroiconChevronDoubleDownOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChevronDoubleDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-double-down-solid" asset catalog image.
    static var heroiconChevronDoubleDownSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChevronDoubleDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-double-left-outline" asset catalog image.
    static var heroiconChevronDoubleLeftOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChevronDoubleLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-double-left-solid" asset catalog image.
    static var heroiconChevronDoubleLeftSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChevronDoubleLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-double-right-outline" asset catalog image.
    static var heroiconChevronDoubleRightOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChevronDoubleRightOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-double-right-solid" asset catalog image.
    static var heroiconChevronDoubleRightSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChevronDoubleRightSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-double-up-outline" asset catalog image.
    static var heroiconChevronDoubleUpOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChevronDoubleUpOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-double-up-solid" asset catalog image.
    static var heroiconChevronDoubleUpSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChevronDoubleUpSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-down-outline" asset catalog image.
    static var heroiconChevronDownOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChevronDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-down-solid" asset catalog image.
    static var heroiconChevronDownSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChevronDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-left-outline" asset catalog image.
    static var heroiconChevronLeftOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChevronLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-left-solid" asset catalog image.
    static var heroiconChevronLeftSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChevronLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-right-outline" asset catalog image.
    static var heroiconChevronRightOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChevronRightOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-right-solid" asset catalog image.
    static var heroiconChevronRightSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChevronRightSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-up-down-outline" asset catalog image.
    static var heroiconChevronUpDownOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChevronUpDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-up-down-solid" asset catalog image.
    static var heroiconChevronUpDownSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChevronUpDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-up-outline" asset catalog image.
    static var heroiconChevronUpOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChevronUpOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-up-solid" asset catalog image.
    static var heroiconChevronUpSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconChevronUpSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-circle-stack-outline" asset catalog image.
    static var heroiconCircleStackOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCircleStackOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-circle-stack-solid" asset catalog image.
    static var heroiconCircleStackSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCircleStackSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-clipboard-document-check-outline" asset catalog image.
    static var heroiconClipboardDocumentCheckOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconClipboardDocumentCheckOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-clipboard-document-check-solid" asset catalog image.
    static var heroiconClipboardDocumentCheckSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconClipboardDocumentCheckSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-clipboard-document-list-outline" asset catalog image.
    static var heroiconClipboardDocumentListOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconClipboardDocumentListOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-clipboard-document-list-solid" asset catalog image.
    static var heroiconClipboardDocumentListSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconClipboardDocumentListSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-clipboard-document-outline" asset catalog image.
    static var heroiconClipboardDocumentOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconClipboardDocumentOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-clipboard-document-solid" asset catalog image.
    static var heroiconClipboardDocumentSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconClipboardDocumentSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-clipboard-outline" asset catalog image.
    static var heroiconClipboardOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconClipboardOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-clipboard-solid" asset catalog image.
    static var heroiconClipboardSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconClipboardSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-clock-outline" asset catalog image.
    static var heroiconClockOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconClockOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-clock-solid" asset catalog image.
    static var heroiconClockSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconClockSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-cloud-arrow-down-outline" asset catalog image.
    static var heroiconCloudArrowDownOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCloudArrowDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-cloud-arrow-down-solid" asset catalog image.
    static var heroiconCloudArrowDownSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCloudArrowDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-cloud-arrow-up-outline" asset catalog image.
    static var heroiconCloudArrowUpOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCloudArrowUpOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-cloud-arrow-up-solid" asset catalog image.
    static var heroiconCloudArrowUpSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCloudArrowUpSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-cloud-outline" asset catalog image.
    static var heroiconCloudOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCloudOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-cloud-solid" asset catalog image.
    static var heroiconCloudSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCloudSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-code-bracket-outline" asset catalog image.
    static var heroiconCodeBracketOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCodeBracketOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-code-bracket-solid" asset catalog image.
    static var heroiconCodeBracketSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCodeBracketSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-code-bracket-square-outline" asset catalog image.
    static var heroiconCodeBracketSquareOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCodeBracketSquareOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-code-bracket-square-solid" asset catalog image.
    static var heroiconCodeBracketSquareSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCodeBracketSquareSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-cog-6-tooth-outline" asset catalog image.
    static var heroiconCog6ToothOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCog6ToothOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-cog-6-tooth-solid" asset catalog image.
    static var heroiconCog6ToothSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCog6ToothSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-cog-8-tooth-outline" asset catalog image.
    static var heroiconCog8ToothOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCog8ToothOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-cog-8-tooth-solid" asset catalog image.
    static var heroiconCog8ToothSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCog8ToothSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-cog-outline" asset catalog image.
    static var heroiconCogOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCogOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-cog-solid" asset catalog image.
    static var heroiconCogSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCogSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-command-line-outline" asset catalog image.
    static var heroiconCommandLineOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCommandLineOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-command-line-solid" asset catalog image.
    static var heroiconCommandLineSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCommandLineSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-computer-desktop-outline" asset catalog image.
    static var heroiconComputerDesktopOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconComputerDesktopOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-computer-desktop-solid" asset catalog image.
    static var heroiconComputerDesktopSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconComputerDesktopSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-cpu-chip-outline" asset catalog image.
    static var heroiconCpuChipOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCpuChipOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-cpu-chip-solid" asset catalog image.
    static var heroiconCpuChipSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCpuChipSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-credit-card-outline" asset catalog image.
    static var heroiconCreditCardOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCreditCardOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-credit-card-solid" asset catalog image.
    static var heroiconCreditCardSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCreditCardSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-cube-outline" asset catalog image.
    static var heroiconCubeOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCubeOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-cube-solid" asset catalog image.
    static var heroiconCubeSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCubeSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-cube-transparent-outline" asset catalog image.
    static var heroiconCubeTransparentOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCubeTransparentOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-cube-transparent-solid" asset catalog image.
    static var heroiconCubeTransparentSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCubeTransparentSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-currency-bangladeshi-outline" asset catalog image.
    static var heroiconCurrencyBangladeshiOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCurrencyBangladeshiOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-currency-bangladeshi-solid" asset catalog image.
    static var heroiconCurrencyBangladeshiSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCurrencyBangladeshiSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-currency-dollar-outline" asset catalog image.
    static var heroiconCurrencyDollarOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCurrencyDollarOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-currency-dollar-solid" asset catalog image.
    static var heroiconCurrencyDollarSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCurrencyDollarSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-currency-euro-outline" asset catalog image.
    static var heroiconCurrencyEuroOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCurrencyEuroOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-currency-euro-solid" asset catalog image.
    static var heroiconCurrencyEuroSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCurrencyEuroSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-currency-pound-outline" asset catalog image.
    static var heroiconCurrencyPoundOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCurrencyPoundOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-currency-pound-solid" asset catalog image.
    static var heroiconCurrencyPoundSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCurrencyPoundSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-currency-rupee-outline" asset catalog image.
    static var heroiconCurrencyRupeeOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCurrencyRupeeOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-currency-rupee-solid" asset catalog image.
    static var heroiconCurrencyRupeeSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCurrencyRupeeSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-currency-yen-outline" asset catalog image.
    static var heroiconCurrencyYenOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCurrencyYenOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-currency-yen-solid" asset catalog image.
    static var heroiconCurrencyYenSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCurrencyYenSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-cursor-arrow-rays-outline" asset catalog image.
    static var heroiconCursorArrowRaysOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCursorArrowRaysOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-cursor-arrow-rays-solid" asset catalog image.
    static var heroiconCursorArrowRaysSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCursorArrowRaysSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-cursor-arrow-ripple-outline" asset catalog image.
    static var heroiconCursorArrowRippleOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCursorArrowRippleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-cursor-arrow-ripple-solid" asset catalog image.
    static var heroiconCursorArrowRippleSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconCursorArrowRippleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-device-phone-mobile-outline" asset catalog image.
    static var heroiconDevicePhoneMobileOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDevicePhoneMobileOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-device-phone-mobile-solid" asset catalog image.
    static var heroiconDevicePhoneMobileSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDevicePhoneMobileSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-device-tablet-outline" asset catalog image.
    static var heroiconDeviceTabletOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDeviceTabletOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-device-tablet-solid" asset catalog image.
    static var heroiconDeviceTabletSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDeviceTabletSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-divide-outline" asset catalog image.
    static var heroiconDivideOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDivideOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-divide-solid" asset catalog image.
    static var heroiconDivideSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDivideSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-arrow-down-outline" asset catalog image.
    static var heroiconDocumentArrowDownOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentArrowDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-arrow-down-solid" asset catalog image.
    static var heroiconDocumentArrowDownSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentArrowDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-arrow-up-outline" asset catalog image.
    static var heroiconDocumentArrowUpOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentArrowUpOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-arrow-up-solid" asset catalog image.
    static var heroiconDocumentArrowUpSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentArrowUpSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-chart-bar-outline" asset catalog image.
    static var heroiconDocumentChartBarOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentChartBarOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-chart-bar-solid" asset catalog image.
    static var heroiconDocumentChartBarSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentChartBarSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-check-outline" asset catalog image.
    static var heroiconDocumentCheckOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentCheckOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-check-solid" asset catalog image.
    static var heroiconDocumentCheckSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentCheckSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-currency-bangladeshi-outline" asset catalog image.
    static var heroiconDocumentCurrencyBangladeshiOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentCurrencyBangladeshiOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-currency-bangladeshi-solid" asset catalog image.
    static var heroiconDocumentCurrencyBangladeshiSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentCurrencyBangladeshiSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-currency-dollar-outline" asset catalog image.
    static var heroiconDocumentCurrencyDollarOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentCurrencyDollarOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-currency-dollar-solid" asset catalog image.
    static var heroiconDocumentCurrencyDollarSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentCurrencyDollarSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-currency-euro-outline" asset catalog image.
    static var heroiconDocumentCurrencyEuroOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentCurrencyEuroOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-currency-euro-solid" asset catalog image.
    static var heroiconDocumentCurrencyEuroSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentCurrencyEuroSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-currency-pound-outline" asset catalog image.
    static var heroiconDocumentCurrencyPoundOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentCurrencyPoundOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-currency-pound-solid" asset catalog image.
    static var heroiconDocumentCurrencyPoundSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentCurrencyPoundSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-currency-rupee-outline" asset catalog image.
    static var heroiconDocumentCurrencyRupeeOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentCurrencyRupeeOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-currency-rupee-solid" asset catalog image.
    static var heroiconDocumentCurrencyRupeeSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentCurrencyRupeeSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-currency-yen-outline" asset catalog image.
    static var heroiconDocumentCurrencyYenOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentCurrencyYenOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-currency-yen-solid" asset catalog image.
    static var heroiconDocumentCurrencyYenSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentCurrencyYenSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-duplicate-outline" asset catalog image.
    static var heroiconDocumentDuplicateOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentDuplicateOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-duplicate-solid" asset catalog image.
    static var heroiconDocumentDuplicateSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentDuplicateSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-magnifying-glass-outline" asset catalog image.
    static var heroiconDocumentMagnifyingGlassOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentMagnifyingGlassOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-magnifying-glass-solid" asset catalog image.
    static var heroiconDocumentMagnifyingGlassSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentMagnifyingGlassSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-minus-outline" asset catalog image.
    static var heroiconDocumentMinusOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentMinusOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-minus-solid" asset catalog image.
    static var heroiconDocumentMinusSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentMinusSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-outline" asset catalog image.
    static var heroiconDocumentOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-plus-outline" asset catalog image.
    static var heroiconDocumentPlusOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentPlusOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-plus-solid" asset catalog image.
    static var heroiconDocumentPlusSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentPlusSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-solid" asset catalog image.
    static var heroiconDocumentSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-text-outline" asset catalog image.
    static var heroiconDocumentTextOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentTextOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-text-solid" asset catalog image.
    static var heroiconDocumentTextSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconDocumentTextSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-ellipsis-horizontal-circle-outline" asset catalog image.
    static var heroiconEllipsisHorizontalCircleOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconEllipsisHorizontalCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-ellipsis-horizontal-circle-solid" asset catalog image.
    static var heroiconEllipsisHorizontalCircleSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconEllipsisHorizontalCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-ellipsis-horizontal-outline" asset catalog image.
    static var heroiconEllipsisHorizontalOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconEllipsisHorizontalOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-ellipsis-horizontal-solid" asset catalog image.
    static var heroiconEllipsisHorizontalSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconEllipsisHorizontalSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-ellipsis-vertical-outline" asset catalog image.
    static var heroiconEllipsisVerticalOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconEllipsisVerticalOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-ellipsis-vertical-solid" asset catalog image.
    static var heroiconEllipsisVerticalSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconEllipsisVerticalSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-envelope-open-outline" asset catalog image.
    static var heroiconEnvelopeOpenOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconEnvelopeOpenOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-envelope-open-solid" asset catalog image.
    static var heroiconEnvelopeOpenSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconEnvelopeOpenSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-envelope-outline" asset catalog image.
    static var heroiconEnvelopeOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconEnvelopeOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-envelope-solid" asset catalog image.
    static var heroiconEnvelopeSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconEnvelopeSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-equals-outline" asset catalog image.
    static var heroiconEqualsOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconEqualsOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-equals-solid" asset catalog image.
    static var heroiconEqualsSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconEqualsSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-exclamation-circle-outline" asset catalog image.
    static var heroiconExclamationCircleOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconExclamationCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-exclamation-circle-solid" asset catalog image.
    static var heroiconExclamationCircleSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconExclamationCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-exclamation-triangle-outline" asset catalog image.
    static var heroiconExclamationTriangleOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconExclamationTriangleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-exclamation-triangle-solid" asset catalog image.
    static var heroiconExclamationTriangleSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconExclamationTriangleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-eye-dropper-outline" asset catalog image.
    static var heroiconEyeDropperOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconEyeDropperOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-eye-dropper-solid" asset catalog image.
    static var heroiconEyeDropperSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconEyeDropperSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-eye-outline" asset catalog image.
    static var heroiconEyeOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconEyeOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-eye-slash-outline" asset catalog image.
    static var heroiconEyeSlashOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconEyeSlashOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-eye-slash-solid" asset catalog image.
    static var heroiconEyeSlashSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconEyeSlashSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-eye-solid" asset catalog image.
    static var heroiconEyeSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconEyeSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-face-frown-outline" asset catalog image.
    static var heroiconFaceFrownOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconFaceFrownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-face-frown-solid" asset catalog image.
    static var heroiconFaceFrownSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconFaceFrownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-face-smile-outline" asset catalog image.
    static var heroiconFaceSmileOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconFaceSmileOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-face-smile-solid" asset catalog image.
    static var heroiconFaceSmileSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconFaceSmileSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-film-outline" asset catalog image.
    static var heroiconFilmOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconFilmOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-film-solid" asset catalog image.
    static var heroiconFilmSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconFilmSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-finger-print-outline" asset catalog image.
    static var heroiconFingerPrintOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconFingerPrintOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-finger-print-solid" asset catalog image.
    static var heroiconFingerPrintSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconFingerPrintSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-fire-outline" asset catalog image.
    static var heroiconFireOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconFireOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-fire-solid" asset catalog image.
    static var heroiconFireSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconFireSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-flag-outline" asset catalog image.
    static var heroiconFlagOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconFlagOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-flag-solid" asset catalog image.
    static var heroiconFlagSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconFlagSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-folder-arrow-down-outline" asset catalog image.
    static var heroiconFolderArrowDownOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconFolderArrowDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-folder-arrow-down-solid" asset catalog image.
    static var heroiconFolderArrowDownSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconFolderArrowDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-folder-minus-outline" asset catalog image.
    static var heroiconFolderMinusOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconFolderMinusOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-folder-minus-solid" asset catalog image.
    static var heroiconFolderMinusSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconFolderMinusSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-folder-open-outline" asset catalog image.
    static var heroiconFolderOpenOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconFolderOpenOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-folder-open-solid" asset catalog image.
    static var heroiconFolderOpenSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconFolderOpenSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-folder-outline" asset catalog image.
    static var heroiconFolderOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconFolderOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-folder-plus-outline" asset catalog image.
    static var heroiconFolderPlusOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconFolderPlusOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-folder-plus-solid" asset catalog image.
    static var heroiconFolderPlusSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconFolderPlusSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-folder-solid" asset catalog image.
    static var heroiconFolderSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconFolderSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-forward-outline" asset catalog image.
    static var heroiconForwardOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconForwardOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-forward-solid" asset catalog image.
    static var heroiconForwardSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconForwardSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-funnel-outline" asset catalog image.
    static var heroiconFunnelOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconFunnelOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-funnel-solid" asset catalog image.
    static var heroiconFunnelSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconFunnelSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-gif-outline" asset catalog image.
    static var heroiconGifOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconGifOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-gif-solid" asset catalog image.
    static var heroiconGifSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconGifSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-gift-outline" asset catalog image.
    static var heroiconGiftOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconGiftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-gift-solid" asset catalog image.
    static var heroiconGiftSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconGiftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-gift-top-outline" asset catalog image.
    static var heroiconGiftTopOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconGiftTopOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-gift-top-solid" asset catalog image.
    static var heroiconGiftTopSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconGiftTopSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-globe-alt-outline" asset catalog image.
    static var heroiconGlobeAltOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconGlobeAltOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-globe-alt-solid" asset catalog image.
    static var heroiconGlobeAltSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconGlobeAltSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-globe-americas-outline" asset catalog image.
    static var heroiconGlobeAmericasOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconGlobeAmericasOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-globe-americas-solid" asset catalog image.
    static var heroiconGlobeAmericasSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconGlobeAmericasSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-globe-asia-australia-outline" asset catalog image.
    static var heroiconGlobeAsiaAustraliaOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconGlobeAsiaAustraliaOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-globe-asia-australia-solid" asset catalog image.
    static var heroiconGlobeAsiaAustraliaSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconGlobeAsiaAustraliaSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-globe-europe-africa-outline" asset catalog image.
    static var heroiconGlobeEuropeAfricaOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconGlobeEuropeAfricaOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-globe-europe-africa-solid" asset catalog image.
    static var heroiconGlobeEuropeAfricaSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconGlobeEuropeAfricaSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-h1-outline" asset catalog image.
    static var heroiconH1Outline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconH1Outline)
#else
        .init()
#endif
    }

    /// The "heroicon-h1-solid" asset catalog image.
    static var heroiconH1Solid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconH1Solid)
#else
        .init()
#endif
    }

    /// The "heroicon-h2-outline" asset catalog image.
    static var heroiconH2Outline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconH2Outline)
#else
        .init()
#endif
    }

    /// The "heroicon-h2-solid" asset catalog image.
    static var heroiconH2Solid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconH2Solid)
#else
        .init()
#endif
    }

    /// The "heroicon-h3-outline" asset catalog image.
    static var heroiconH3Outline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconH3Outline)
#else
        .init()
#endif
    }

    /// The "heroicon-h3-solid" asset catalog image.
    static var heroiconH3Solid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconH3Solid)
#else
        .init()
#endif
    }

    /// The "heroicon-hand-raised-outline" asset catalog image.
    static var heroiconHandRaisedOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconHandRaisedOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-hand-raised-solid" asset catalog image.
    static var heroiconHandRaisedSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconHandRaisedSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-hand-thumb-down-outline" asset catalog image.
    static var heroiconHandThumbDownOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconHandThumbDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-hand-thumb-down-solid" asset catalog image.
    static var heroiconHandThumbDownSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconHandThumbDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-hand-thumb-up-outline" asset catalog image.
    static var heroiconHandThumbUpOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconHandThumbUpOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-hand-thumb-up-solid" asset catalog image.
    static var heroiconHandThumbUpSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconHandThumbUpSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-hashtag-outline" asset catalog image.
    static var heroiconHashtagOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconHashtagOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-hashtag-solid" asset catalog image.
    static var heroiconHashtagSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconHashtagSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-heart-outline" asset catalog image.
    static var heroiconHeartOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconHeartOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-heart-solid" asset catalog image.
    static var heroiconHeartSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconHeartSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-home-modern-outline" asset catalog image.
    static var heroiconHomeModernOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconHomeModernOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-home-modern-solid" asset catalog image.
    static var heroiconHomeModernSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconHomeModernSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-home-outline" asset catalog image.
    static var heroiconHomeOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconHomeOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-home-solid" asset catalog image.
    static var heroiconHomeSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconHomeSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-identification-outline" asset catalog image.
    static var heroiconIdentificationOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconIdentificationOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-identification-solid" asset catalog image.
    static var heroiconIdentificationSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconIdentificationSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-inbox-arrow-down-outline" asset catalog image.
    static var heroiconInboxArrowDownOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconInboxArrowDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-inbox-arrow-down-solid" asset catalog image.
    static var heroiconInboxArrowDownSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconInboxArrowDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-inbox-outline" asset catalog image.
    static var heroiconInboxOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconInboxOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-inbox-solid" asset catalog image.
    static var heroiconInboxSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconInboxSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-inbox-stack-outline" asset catalog image.
    static var heroiconInboxStackOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconInboxStackOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-inbox-stack-solid" asset catalog image.
    static var heroiconInboxStackSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconInboxStackSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-information-circle-outline" asset catalog image.
    static var heroiconInformationCircleOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconInformationCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-information-circle-solid" asset catalog image.
    static var heroiconInformationCircleSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconInformationCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-italic-outline" asset catalog image.
    static var heroiconItalicOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconItalicOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-italic-solid" asset catalog image.
    static var heroiconItalicSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconItalicSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-key-outline" asset catalog image.
    static var heroiconKeyOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconKeyOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-key-solid" asset catalog image.
    static var heroiconKeySolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconKeySolid)
#else
        .init()
#endif
    }

    /// The "heroicon-language-outline" asset catalog image.
    static var heroiconLanguageOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconLanguageOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-language-solid" asset catalog image.
    static var heroiconLanguageSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconLanguageSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-lifebuoy-outline" asset catalog image.
    static var heroiconLifebuoyOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconLifebuoyOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-lifebuoy-solid" asset catalog image.
    static var heroiconLifebuoySolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconLifebuoySolid)
#else
        .init()
#endif
    }

    /// The "heroicon-light-bulb-outline" asset catalog image.
    static var heroiconLightBulbOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconLightBulbOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-light-bulb-solid" asset catalog image.
    static var heroiconLightBulbSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconLightBulbSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-link-outline" asset catalog image.
    static var heroiconLinkOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconLinkOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-link-slash-outline" asset catalog image.
    static var heroiconLinkSlashOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconLinkSlashOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-link-slash-solid" asset catalog image.
    static var heroiconLinkSlashSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconLinkSlashSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-link-solid" asset catalog image.
    static var heroiconLinkSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconLinkSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-list-bullet-outline" asset catalog image.
    static var heroiconListBulletOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconListBulletOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-list-bullet-solid" asset catalog image.
    static var heroiconListBulletSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconListBulletSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-lock-closed-outline" asset catalog image.
    static var heroiconLockClosedOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconLockClosedOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-lock-closed-solid" asset catalog image.
    static var heroiconLockClosedSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconLockClosedSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-lock-open-outline" asset catalog image.
    static var heroiconLockOpenOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconLockOpenOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-lock-open-solid" asset catalog image.
    static var heroiconLockOpenSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconLockOpenSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-magnifying-glass-circle-outline" asset catalog image.
    static var heroiconMagnifyingGlassCircleOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconMagnifyingGlassCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-magnifying-glass-circle-solid" asset catalog image.
    static var heroiconMagnifyingGlassCircleSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconMagnifyingGlassCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-magnifying-glass-minus-outline" asset catalog image.
    static var heroiconMagnifyingGlassMinusOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconMagnifyingGlassMinusOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-magnifying-glass-minus-solid" asset catalog image.
    static var heroiconMagnifyingGlassMinusSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconMagnifyingGlassMinusSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-magnifying-glass-outline" asset catalog image.
    static var heroiconMagnifyingGlassOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconMagnifyingGlassOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-magnifying-glass-plus-outline" asset catalog image.
    static var heroiconMagnifyingGlassPlusOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconMagnifyingGlassPlusOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-magnifying-glass-plus-solid" asset catalog image.
    static var heroiconMagnifyingGlassPlusSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconMagnifyingGlassPlusSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-magnifying-glass-solid" asset catalog image.
    static var heroiconMagnifyingGlassSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconMagnifyingGlassSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-map-outline" asset catalog image.
    static var heroiconMapOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconMapOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-map-pin-outline" asset catalog image.
    static var heroiconMapPinOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconMapPinOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-map-pin-solid" asset catalog image.
    static var heroiconMapPinSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconMapPinSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-map-solid" asset catalog image.
    static var heroiconMapSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconMapSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-megaphone-outline" asset catalog image.
    static var heroiconMegaphoneOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconMegaphoneOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-megaphone-solid" asset catalog image.
    static var heroiconMegaphoneSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconMegaphoneSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-microphone-outline" asset catalog image.
    static var heroiconMicrophoneOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconMicrophoneOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-microphone-solid" asset catalog image.
    static var heroiconMicrophoneSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconMicrophoneSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-minus-circle-outline" asset catalog image.
    static var heroiconMinusCircleOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconMinusCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-minus-circle-solid" asset catalog image.
    static var heroiconMinusCircleSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconMinusCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-minus-outline" asset catalog image.
    static var heroiconMinusOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconMinusOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-minus-small-outline" asset catalog image.
    static var heroiconMinusSmallOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconMinusSmallOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-minus-small-solid" asset catalog image.
    static var heroiconMinusSmallSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconMinusSmallSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-minus-solid" asset catalog image.
    static var heroiconMinusSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconMinusSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-moon-outline" asset catalog image.
    static var heroiconMoonOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconMoonOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-moon-solid" asset catalog image.
    static var heroiconMoonSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconMoonSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-musical-note-outline" asset catalog image.
    static var heroiconMusicalNoteOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconMusicalNoteOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-musical-note-solid" asset catalog image.
    static var heroiconMusicalNoteSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconMusicalNoteSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-newspaper-outline" asset catalog image.
    static var heroiconNewspaperOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconNewspaperOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-newspaper-solid" asset catalog image.
    static var heroiconNewspaperSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconNewspaperSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-no-symbol-outline" asset catalog image.
    static var heroiconNoSymbolOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconNoSymbolOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-no-symbol-solid" asset catalog image.
    static var heroiconNoSymbolSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconNoSymbolSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-numbered-list-outline" asset catalog image.
    static var heroiconNumberedListOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconNumberedListOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-numbered-list-solid" asset catalog image.
    static var heroiconNumberedListSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconNumberedListSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-paint-brush-outline" asset catalog image.
    static var heroiconPaintBrushOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPaintBrushOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-paint-brush-solid" asset catalog image.
    static var heroiconPaintBrushSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPaintBrushSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-paper-airplane-outline" asset catalog image.
    static var heroiconPaperAirplaneOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPaperAirplaneOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-paper-airplane-solid" asset catalog image.
    static var heroiconPaperAirplaneSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPaperAirplaneSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-paper-clip-outline" asset catalog image.
    static var heroiconPaperClipOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPaperClipOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-paper-clip-solid" asset catalog image.
    static var heroiconPaperClipSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPaperClipSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-pause-circle-outline" asset catalog image.
    static var heroiconPauseCircleOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPauseCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-pause-circle-solid" asset catalog image.
    static var heroiconPauseCircleSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPauseCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-pause-outline" asset catalog image.
    static var heroiconPauseOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPauseOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-pause-solid" asset catalog image.
    static var heroiconPauseSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPauseSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-pencil-outline" asset catalog image.
    static var heroiconPencilOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPencilOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-pencil-solid" asset catalog image.
    static var heroiconPencilSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPencilSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-pencil-square-outline" asset catalog image.
    static var heroiconPencilSquareOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPencilSquareOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-pencil-square-solid" asset catalog image.
    static var heroiconPencilSquareSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPencilSquareSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-percent-badge-outline" asset catalog image.
    static var heroiconPercentBadgeOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPercentBadgeOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-percent-badge-solid" asset catalog image.
    static var heroiconPercentBadgeSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPercentBadgeSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-phone-arrow-down-left-outline" asset catalog image.
    static var heroiconPhoneArrowDownLeftOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPhoneArrowDownLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-phone-arrow-down-left-solid" asset catalog image.
    static var heroiconPhoneArrowDownLeftSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPhoneArrowDownLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-phone-arrow-up-right-outline" asset catalog image.
    static var heroiconPhoneArrowUpRightOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPhoneArrowUpRightOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-phone-arrow-up-right-solid" asset catalog image.
    static var heroiconPhoneArrowUpRightSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPhoneArrowUpRightSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-phone-outline" asset catalog image.
    static var heroiconPhoneOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPhoneOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-phone-solid" asset catalog image.
    static var heroiconPhoneSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPhoneSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-phone-x-mark-outline" asset catalog image.
    static var heroiconPhoneXMarkOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPhoneXMarkOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-phone-x-mark-solid" asset catalog image.
    static var heroiconPhoneXMarkSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPhoneXMarkSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-photo-outline" asset catalog image.
    static var heroiconPhotoOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPhotoOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-photo-solid" asset catalog image.
    static var heroiconPhotoSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPhotoSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-play-circle-outline" asset catalog image.
    static var heroiconPlayCircleOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPlayCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-play-circle-solid" asset catalog image.
    static var heroiconPlayCircleSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPlayCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-play-outline" asset catalog image.
    static var heroiconPlayOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPlayOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-play-pause-outline" asset catalog image.
    static var heroiconPlayPauseOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPlayPauseOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-play-pause-solid" asset catalog image.
    static var heroiconPlayPauseSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPlayPauseSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-play-solid" asset catalog image.
    static var heroiconPlaySolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPlaySolid)
#else
        .init()
#endif
    }

    /// The "heroicon-plus-circle-outline" asset catalog image.
    static var heroiconPlusCircleOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPlusCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-plus-circle-solid" asset catalog image.
    static var heroiconPlusCircleSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPlusCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-plus-outline" asset catalog image.
    static var heroiconPlusOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPlusOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-plus-small-outline" asset catalog image.
    static var heroiconPlusSmallOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPlusSmallOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-plus-small-solid" asset catalog image.
    static var heroiconPlusSmallSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPlusSmallSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-plus-solid" asset catalog image.
    static var heroiconPlusSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPlusSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-power-outline" asset catalog image.
    static var heroiconPowerOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPowerOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-power-solid" asset catalog image.
    static var heroiconPowerSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPowerSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-presentation-chart-bar-outline" asset catalog image.
    static var heroiconPresentationChartBarOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPresentationChartBarOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-presentation-chart-bar-solid" asset catalog image.
    static var heroiconPresentationChartBarSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPresentationChartBarSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-presentation-chart-line-outline" asset catalog image.
    static var heroiconPresentationChartLineOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPresentationChartLineOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-presentation-chart-line-solid" asset catalog image.
    static var heroiconPresentationChartLineSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPresentationChartLineSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-printer-outline" asset catalog image.
    static var heroiconPrinterOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPrinterOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-printer-solid" asset catalog image.
    static var heroiconPrinterSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPrinterSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-puzzle-piece-outline" asset catalog image.
    static var heroiconPuzzlePieceOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPuzzlePieceOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-puzzle-piece-solid" asset catalog image.
    static var heroiconPuzzlePieceSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconPuzzlePieceSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-qr-code-outline" asset catalog image.
    static var heroiconQrCodeOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconQrCodeOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-qr-code-solid" asset catalog image.
    static var heroiconQrCodeSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconQrCodeSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-question-mark-circle-outline" asset catalog image.
    static var heroiconQuestionMarkCircleOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconQuestionMarkCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-question-mark-circle-solid" asset catalog image.
    static var heroiconQuestionMarkCircleSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconQuestionMarkCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-queue-list-outline" asset catalog image.
    static var heroiconQueueListOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconQueueListOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-queue-list-solid" asset catalog image.
    static var heroiconQueueListSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconQueueListSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-radio-outline" asset catalog image.
    static var heroiconRadioOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconRadioOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-radio-solid" asset catalog image.
    static var heroiconRadioSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconRadioSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-receipt-percent-outline" asset catalog image.
    static var heroiconReceiptPercentOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconReceiptPercentOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-receipt-percent-solid" asset catalog image.
    static var heroiconReceiptPercentSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconReceiptPercentSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-receipt-refund-outline" asset catalog image.
    static var heroiconReceiptRefundOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconReceiptRefundOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-receipt-refund-solid" asset catalog image.
    static var heroiconReceiptRefundSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconReceiptRefundSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-rectangle-group-outline" asset catalog image.
    static var heroiconRectangleGroupOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconRectangleGroupOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-rectangle-group-solid" asset catalog image.
    static var heroiconRectangleGroupSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconRectangleGroupSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-rectangle-stack-outline" asset catalog image.
    static var heroiconRectangleStackOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconRectangleStackOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-rectangle-stack-solid" asset catalog image.
    static var heroiconRectangleStackSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconRectangleStackSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-rocket-launch-outline" asset catalog image.
    static var heroiconRocketLaunchOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconRocketLaunchOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-rocket-launch-solid" asset catalog image.
    static var heroiconRocketLaunchSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconRocketLaunchSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-rss-outline" asset catalog image.
    static var heroiconRssOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconRssOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-rss-solid" asset catalog image.
    static var heroiconRssSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconRssSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-scale-outline" asset catalog image.
    static var heroiconScaleOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconScaleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-scale-solid" asset catalog image.
    static var heroiconScaleSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconScaleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-scissors-outline" asset catalog image.
    static var heroiconScissorsOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconScissorsOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-scissors-solid" asset catalog image.
    static var heroiconScissorsSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconScissorsSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-server-outline" asset catalog image.
    static var heroiconServerOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconServerOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-server-solid" asset catalog image.
    static var heroiconServerSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconServerSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-server-stack-outline" asset catalog image.
    static var heroiconServerStackOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconServerStackOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-server-stack-solid" asset catalog image.
    static var heroiconServerStackSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconServerStackSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-share-outline" asset catalog image.
    static var heroiconShareOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconShareOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-share-solid" asset catalog image.
    static var heroiconShareSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconShareSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-shield-check-outline" asset catalog image.
    static var heroiconShieldCheckOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconShieldCheckOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-shield-check-solid" asset catalog image.
    static var heroiconShieldCheckSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconShieldCheckSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-shield-exclamation-outline" asset catalog image.
    static var heroiconShieldExclamationOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconShieldExclamationOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-shield-exclamation-solid" asset catalog image.
    static var heroiconShieldExclamationSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconShieldExclamationSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-shopping-bag-outline" asset catalog image.
    static var heroiconShoppingBagOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconShoppingBagOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-shopping-bag-solid" asset catalog image.
    static var heroiconShoppingBagSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconShoppingBagSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-shopping-cart-outline" asset catalog image.
    static var heroiconShoppingCartOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconShoppingCartOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-shopping-cart-solid" asset catalog image.
    static var heroiconShoppingCartSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconShoppingCartSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-signal-outline" asset catalog image.
    static var heroiconSignalOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconSignalOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-signal-slash-outline" asset catalog image.
    static var heroiconSignalSlashOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconSignalSlashOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-signal-slash-solid" asset catalog image.
    static var heroiconSignalSlashSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconSignalSlashSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-signal-solid" asset catalog image.
    static var heroiconSignalSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconSignalSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-slash-outline" asset catalog image.
    static var heroiconSlashOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconSlashOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-slash-solid" asset catalog image.
    static var heroiconSlashSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconSlashSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-sparkles-outline" asset catalog image.
    static var heroiconSparklesOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconSparklesOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-sparkles-solid" asset catalog image.
    static var heroiconSparklesSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconSparklesSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-speaker-wave-outline" asset catalog image.
    static var heroiconSpeakerWaveOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconSpeakerWaveOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-speaker-wave-solid" asset catalog image.
    static var heroiconSpeakerWaveSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconSpeakerWaveSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-speaker-x-mark-outline" asset catalog image.
    static var heroiconSpeakerXMarkOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconSpeakerXMarkOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-speaker-x-mark-solid" asset catalog image.
    static var heroiconSpeakerXMarkSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconSpeakerXMarkSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-square-2-stack-outline" asset catalog image.
    static var heroiconSquare2StackOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconSquare2StackOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-square-2-stack-solid" asset catalog image.
    static var heroiconSquare2StackSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconSquare2StackSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-square-3-stack-3d-outline" asset catalog image.
    static var heroiconSquare3Stack3DOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconSquare3Stack3DOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-square-3-stack-3d-solid" asset catalog image.
    static var heroiconSquare3Stack3DSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconSquare3Stack3DSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-squares-2x2-outline" asset catalog image.
    static var heroiconSquares2X2Outline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconSquares2X2Outline)
#else
        .init()
#endif
    }

    /// The "heroicon-squares-2x2-solid" asset catalog image.
    static var heroiconSquares2X2Solid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconSquares2X2Solid)
#else
        .init()
#endif
    }

    /// The "heroicon-squares-plus-outline" asset catalog image.
    static var heroiconSquaresPlusOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconSquaresPlusOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-squares-plus-solid" asset catalog image.
    static var heroiconSquaresPlusSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconSquaresPlusSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-star-outline" asset catalog image.
    static var heroiconStarOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconStarOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-star-solid" asset catalog image.
    static var heroiconStarSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconStarSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-stop-circle-outline" asset catalog image.
    static var heroiconStopCircleOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconStopCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-stop-circle-solid" asset catalog image.
    static var heroiconStopCircleSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconStopCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-stop-outline" asset catalog image.
    static var heroiconStopOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconStopOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-stop-solid" asset catalog image.
    static var heroiconStopSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconStopSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-strikethrough-outline" asset catalog image.
    static var heroiconStrikethroughOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconStrikethroughOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-strikethrough-solid" asset catalog image.
    static var heroiconStrikethroughSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconStrikethroughSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-sun-outline" asset catalog image.
    static var heroiconSunOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconSunOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-sun-solid" asset catalog image.
    static var heroiconSunSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconSunSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-swatch-outline" asset catalog image.
    static var heroiconSwatchOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconSwatchOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-swatch-solid" asset catalog image.
    static var heroiconSwatchSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconSwatchSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-table-cells-outline" asset catalog image.
    static var heroiconTableCellsOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconTableCellsOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-table-cells-solid" asset catalog image.
    static var heroiconTableCellsSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconTableCellsSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-tag-outline" asset catalog image.
    static var heroiconTagOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconTagOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-tag-solid" asset catalog image.
    static var heroiconTagSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconTagSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-ticket-outline" asset catalog image.
    static var heroiconTicketOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconTicketOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-ticket-solid" asset catalog image.
    static var heroiconTicketSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconTicketSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-trash-outline" asset catalog image.
    static var heroiconTrashOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconTrashOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-trash-solid" asset catalog image.
    static var heroiconTrashSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconTrashSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-trophy-outline" asset catalog image.
    static var heroiconTrophyOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconTrophyOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-trophy-solid" asset catalog image.
    static var heroiconTrophySolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconTrophySolid)
#else
        .init()
#endif
    }

    /// The "heroicon-truck-outline" asset catalog image.
    static var heroiconTruckOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconTruckOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-truck-solid" asset catalog image.
    static var heroiconTruckSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconTruckSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-tv-outline" asset catalog image.
    static var heroiconTvOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconTvOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-tv-solid" asset catalog image.
    static var heroiconTvSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconTvSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-underline-outline" asset catalog image.
    static var heroiconUnderlineOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconUnderlineOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-underline-solid" asset catalog image.
    static var heroiconUnderlineSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconUnderlineSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-user-circle-outline" asset catalog image.
    static var heroiconUserCircleOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconUserCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-user-circle-solid" asset catalog image.
    static var heroiconUserCircleSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconUserCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-user-group-outline" asset catalog image.
    static var heroiconUserGroupOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconUserGroupOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-user-group-solid" asset catalog image.
    static var heroiconUserGroupSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconUserGroupSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-user-minus-outline" asset catalog image.
    static var heroiconUserMinusOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconUserMinusOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-user-minus-solid" asset catalog image.
    static var heroiconUserMinusSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconUserMinusSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-user-outline" asset catalog image.
    static var heroiconUserOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconUserOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-user-plus-outline" asset catalog image.
    static var heroiconUserPlusOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconUserPlusOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-user-plus-solid" asset catalog image.
    static var heroiconUserPlusSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconUserPlusSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-user-solid" asset catalog image.
    static var heroiconUserSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconUserSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-users-outline" asset catalog image.
    static var heroiconUsersOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconUsersOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-users-solid" asset catalog image.
    static var heroiconUsersSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconUsersSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-variable-outline" asset catalog image.
    static var heroiconVariableOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconVariableOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-variable-solid" asset catalog image.
    static var heroiconVariableSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconVariableSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-video-camera-outline" asset catalog image.
    static var heroiconVideoCameraOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconVideoCameraOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-video-camera-slash-outline" asset catalog image.
    static var heroiconVideoCameraSlashOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconVideoCameraSlashOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-video-camera-slash-solid" asset catalog image.
    static var heroiconVideoCameraSlashSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconVideoCameraSlashSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-video-camera-solid" asset catalog image.
    static var heroiconVideoCameraSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconVideoCameraSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-view-columns-outline" asset catalog image.
    static var heroiconViewColumnsOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconViewColumnsOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-view-columns-solid" asset catalog image.
    static var heroiconViewColumnsSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconViewColumnsSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-viewfinder-circle-outline" asset catalog image.
    static var heroiconViewfinderCircleOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconViewfinderCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-viewfinder-circle-solid" asset catalog image.
    static var heroiconViewfinderCircleSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconViewfinderCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-wallet-outline" asset catalog image.
    static var heroiconWalletOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconWalletOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-wallet-solid" asset catalog image.
    static var heroiconWalletSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconWalletSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-wifi-outline" asset catalog image.
    static var heroiconWifiOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconWifiOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-wifi-solid" asset catalog image.
    static var heroiconWifiSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconWifiSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-window-outline" asset catalog image.
    static var heroiconWindowOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconWindowOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-window-solid" asset catalog image.
    static var heroiconWindowSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconWindowSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-wrench-outline" asset catalog image.
    static var heroiconWrenchOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconWrenchOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-wrench-screwdriver-outline" asset catalog image.
    static var heroiconWrenchScrewdriverOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconWrenchScrewdriverOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-wrench-screwdriver-solid" asset catalog image.
    static var heroiconWrenchScrewdriverSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconWrenchScrewdriverSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-wrench-solid" asset catalog image.
    static var heroiconWrenchSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconWrenchSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-x-circle-outline" asset catalog image.
    static var heroiconXCircleOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconXCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-x-circle-solid" asset catalog image.
    static var heroiconXCircleSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconXCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-x-mark-outline" asset catalog image.
    static var heroiconXMarkOutline: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconXMarkOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-x-mark-solid" asset catalog image.
    static var heroiconXMarkSolid: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .heroiconXMarkSolid)
#else
        .init()
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// The "heroicon-academic-cap-outline" asset catalog image.
    static var heroiconAcademicCapOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconAcademicCapOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-academic-cap-solid" asset catalog image.
    static var heroiconAcademicCapSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconAcademicCapSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-adjustments-horizontal-outline" asset catalog image.
    static var heroiconAdjustmentsHorizontalOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconAdjustmentsHorizontalOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-adjustments-horizontal-solid" asset catalog image.
    static var heroiconAdjustmentsHorizontalSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconAdjustmentsHorizontalSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-adjustments-vertical-outline" asset catalog image.
    static var heroiconAdjustmentsVerticalOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconAdjustmentsVerticalOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-adjustments-vertical-solid" asset catalog image.
    static var heroiconAdjustmentsVerticalSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconAdjustmentsVerticalSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-archive-box-arrow-down-outline" asset catalog image.
    static var heroiconArchiveBoxArrowDownOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArchiveBoxArrowDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-archive-box-arrow-down-solid" asset catalog image.
    static var heroiconArchiveBoxArrowDownSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArchiveBoxArrowDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-archive-box-outline" asset catalog image.
    static var heroiconArchiveBoxOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArchiveBoxOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-archive-box-solid" asset catalog image.
    static var heroiconArchiveBoxSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArchiveBoxSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-archive-box-x-mark-outline" asset catalog image.
    static var heroiconArchiveBoxXMarkOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArchiveBoxXMarkOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-archive-box-x-mark-solid" asset catalog image.
    static var heroiconArchiveBoxXMarkSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArchiveBoxXMarkSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-down-circle-outline" asset catalog image.
    static var heroiconArrowDownCircleOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowDownCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-down-circle-solid" asset catalog image.
    static var heroiconArrowDownCircleSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowDownCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-down-left-outline" asset catalog image.
    static var heroiconArrowDownLeftOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowDownLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-down-left-solid" asset catalog image.
    static var heroiconArrowDownLeftSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowDownLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-down-on-square-outline" asset catalog image.
    static var heroiconArrowDownOnSquareOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowDownOnSquareOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-down-on-square-solid" asset catalog image.
    static var heroiconArrowDownOnSquareSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowDownOnSquareSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-down-on-square-stack-outline" asset catalog image.
    static var heroiconArrowDownOnSquareStackOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowDownOnSquareStackOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-down-on-square-stack-solid" asset catalog image.
    static var heroiconArrowDownOnSquareStackSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowDownOnSquareStackSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-down-outline" asset catalog image.
    static var heroiconArrowDownOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-down-right-outline" asset catalog image.
    static var heroiconArrowDownRightOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowDownRightOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-down-right-solid" asset catalog image.
    static var heroiconArrowDownRightSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowDownRightSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-down-solid" asset catalog image.
    static var heroiconArrowDownSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-down-tray-outline" asset catalog image.
    static var heroiconArrowDownTrayOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowDownTrayOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-down-tray-solid" asset catalog image.
    static var heroiconArrowDownTraySolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowDownTraySolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-left-circle-outline" asset catalog image.
    static var heroiconArrowLeftCircleOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowLeftCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-left-circle-solid" asset catalog image.
    static var heroiconArrowLeftCircleSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowLeftCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-left-end-on-rectangle-outline" asset catalog image.
    static var heroiconArrowLeftEndOnRectangleOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowLeftEndOnRectangleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-left-end-on-rectangle-solid" asset catalog image.
    static var heroiconArrowLeftEndOnRectangleSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowLeftEndOnRectangleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-left-on-rectangle-outline" asset catalog image.
    static var heroiconArrowLeftOnRectangleOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowLeftOnRectangleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-left-on-rectangle-solid" asset catalog image.
    static var heroiconArrowLeftOnRectangleSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowLeftOnRectangleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-left-outline" asset catalog image.
    static var heroiconArrowLeftOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-left-solid" asset catalog image.
    static var heroiconArrowLeftSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-left-start-on-rectangle-outline" asset catalog image.
    static var heroiconArrowLeftStartOnRectangleOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowLeftStartOnRectangleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-left-start-on-rectangle-solid" asset catalog image.
    static var heroiconArrowLeftStartOnRectangleSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowLeftStartOnRectangleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-long-down-outline" asset catalog image.
    static var heroiconArrowLongDownOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowLongDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-long-down-solid" asset catalog image.
    static var heroiconArrowLongDownSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowLongDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-long-left-outline" asset catalog image.
    static var heroiconArrowLongLeftOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowLongLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-long-left-solid" asset catalog image.
    static var heroiconArrowLongLeftSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowLongLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-long-right-outline" asset catalog image.
    static var heroiconArrowLongRightOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowLongRightOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-long-right-solid" asset catalog image.
    static var heroiconArrowLongRightSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowLongRightSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-long-up-outline" asset catalog image.
    static var heroiconArrowLongUpOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowLongUpOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-long-up-solid" asset catalog image.
    static var heroiconArrowLongUpSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowLongUpSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-path-outline" asset catalog image.
    static var heroiconArrowPathOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowPathOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-path-rounded-square-outline" asset catalog image.
    static var heroiconArrowPathRoundedSquareOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowPathRoundedSquareOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-path-rounded-square-solid" asset catalog image.
    static var heroiconArrowPathRoundedSquareSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowPathRoundedSquareSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-path-solid" asset catalog image.
    static var heroiconArrowPathSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowPathSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-right-circle-outline" asset catalog image.
    static var heroiconArrowRightCircleOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowRightCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-right-circle-solid" asset catalog image.
    static var heroiconArrowRightCircleSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowRightCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-right-end-on-rectangle-outline" asset catalog image.
    static var heroiconArrowRightEndOnRectangleOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowRightEndOnRectangleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-right-end-on-rectangle-solid" asset catalog image.
    static var heroiconArrowRightEndOnRectangleSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowRightEndOnRectangleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-right-on-rectangle-outline" asset catalog image.
    static var heroiconArrowRightOnRectangleOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowRightOnRectangleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-right-on-rectangle-solid" asset catalog image.
    static var heroiconArrowRightOnRectangleSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowRightOnRectangleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-right-outline" asset catalog image.
    static var heroiconArrowRightOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowRightOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-right-solid" asset catalog image.
    static var heroiconArrowRightSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowRightSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-right-start-on-rectangle-outline" asset catalog image.
    static var heroiconArrowRightStartOnRectangleOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowRightStartOnRectangleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-right-start-on-rectangle-solid" asset catalog image.
    static var heroiconArrowRightStartOnRectangleSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowRightStartOnRectangleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-small-down-outline" asset catalog image.
    static var heroiconArrowSmallDownOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowSmallDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-small-down-solid" asset catalog image.
    static var heroiconArrowSmallDownSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowSmallDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-small-left-outline" asset catalog image.
    static var heroiconArrowSmallLeftOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowSmallLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-small-left-solid" asset catalog image.
    static var heroiconArrowSmallLeftSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowSmallLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-small-right-outline" asset catalog image.
    static var heroiconArrowSmallRightOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowSmallRightOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-small-right-solid" asset catalog image.
    static var heroiconArrowSmallRightSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowSmallRightSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-small-up-outline" asset catalog image.
    static var heroiconArrowSmallUpOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowSmallUpOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-small-up-solid" asset catalog image.
    static var heroiconArrowSmallUpSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowSmallUpSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-top-right-on-square-outline" asset catalog image.
    static var heroiconArrowTopRightOnSquareOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowTopRightOnSquareOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-top-right-on-square-solid" asset catalog image.
    static var heroiconArrowTopRightOnSquareSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowTopRightOnSquareSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-trending-down-outline" asset catalog image.
    static var heroiconArrowTrendingDownOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowTrendingDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-trending-down-solid" asset catalog image.
    static var heroiconArrowTrendingDownSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowTrendingDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-trending-up-outline" asset catalog image.
    static var heroiconArrowTrendingUpOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowTrendingUpOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-trending-up-solid" asset catalog image.
    static var heroiconArrowTrendingUpSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowTrendingUpSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-down-left-outline" asset catalog image.
    static var heroiconArrowTurnDownLeftOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowTurnDownLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-down-left-solid" asset catalog image.
    static var heroiconArrowTurnDownLeftSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowTurnDownLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-down-right-outline" asset catalog image.
    static var heroiconArrowTurnDownRightOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowTurnDownRightOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-down-right-solid" asset catalog image.
    static var heroiconArrowTurnDownRightSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowTurnDownRightSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-left-down-outline" asset catalog image.
    static var heroiconArrowTurnLeftDownOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowTurnLeftDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-left-down-solid" asset catalog image.
    static var heroiconArrowTurnLeftDownSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowTurnLeftDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-left-up-outline" asset catalog image.
    static var heroiconArrowTurnLeftUpOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowTurnLeftUpOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-left-up-solid" asset catalog image.
    static var heroiconArrowTurnLeftUpSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowTurnLeftUpSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-right-down-outline" asset catalog image.
    static var heroiconArrowTurnRightDownOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowTurnRightDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-right-down-solid" asset catalog image.
    static var heroiconArrowTurnRightDownSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowTurnRightDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-right-up-outline" asset catalog image.
    static var heroiconArrowTurnRightUpOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowTurnRightUpOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-right-up-solid" asset catalog image.
    static var heroiconArrowTurnRightUpSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowTurnRightUpSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-up-left-outline" asset catalog image.
    static var heroiconArrowTurnUpLeftOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowTurnUpLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-up-left-solid" asset catalog image.
    static var heroiconArrowTurnUpLeftSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowTurnUpLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-up-right-outline" asset catalog image.
    static var heroiconArrowTurnUpRightOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowTurnUpRightOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-turn-up-right-solid" asset catalog image.
    static var heroiconArrowTurnUpRightSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowTurnUpRightSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-up-circle-outline" asset catalog image.
    static var heroiconArrowUpCircleOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowUpCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-up-circle-solid" asset catalog image.
    static var heroiconArrowUpCircleSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowUpCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-up-left-outline" asset catalog image.
    static var heroiconArrowUpLeftOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowUpLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-up-left-solid" asset catalog image.
    static var heroiconArrowUpLeftSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowUpLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-up-on-square-outline" asset catalog image.
    static var heroiconArrowUpOnSquareOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowUpOnSquareOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-up-on-square-solid" asset catalog image.
    static var heroiconArrowUpOnSquareSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowUpOnSquareSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-up-on-square-stack-outline" asset catalog image.
    static var heroiconArrowUpOnSquareStackOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowUpOnSquareStackOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-up-on-square-stack-solid" asset catalog image.
    static var heroiconArrowUpOnSquareStackSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowUpOnSquareStackSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-up-outline" asset catalog image.
    static var heroiconArrowUpOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowUpOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-up-right-outline" asset catalog image.
    static var heroiconArrowUpRightOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowUpRightOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-up-right-solid" asset catalog image.
    static var heroiconArrowUpRightSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowUpRightSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-up-solid" asset catalog image.
    static var heroiconArrowUpSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowUpSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-up-tray-outline" asset catalog image.
    static var heroiconArrowUpTrayOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowUpTrayOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-up-tray-solid" asset catalog image.
    static var heroiconArrowUpTraySolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowUpTraySolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-uturn-down-outline" asset catalog image.
    static var heroiconArrowUturnDownOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowUturnDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-uturn-down-solid" asset catalog image.
    static var heroiconArrowUturnDownSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowUturnDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-uturn-left-outline" asset catalog image.
    static var heroiconArrowUturnLeftOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowUturnLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-uturn-left-solid" asset catalog image.
    static var heroiconArrowUturnLeftSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowUturnLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-uturn-right-outline" asset catalog image.
    static var heroiconArrowUturnRightOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowUturnRightOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-uturn-right-solid" asset catalog image.
    static var heroiconArrowUturnRightSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowUturnRightSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-uturn-up-outline" asset catalog image.
    static var heroiconArrowUturnUpOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowUturnUpOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrow-uturn-up-solid" asset catalog image.
    static var heroiconArrowUturnUpSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowUturnUpSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrows-pointing-in-outline" asset catalog image.
    static var heroiconArrowsPointingInOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowsPointingInOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrows-pointing-in-solid" asset catalog image.
    static var heroiconArrowsPointingInSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowsPointingInSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrows-pointing-out-outline" asset catalog image.
    static var heroiconArrowsPointingOutOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowsPointingOutOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrows-pointing-out-solid" asset catalog image.
    static var heroiconArrowsPointingOutSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowsPointingOutSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrows-right-left-outline" asset catalog image.
    static var heroiconArrowsRightLeftOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowsRightLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrows-right-left-solid" asset catalog image.
    static var heroiconArrowsRightLeftSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowsRightLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-arrows-up-down-outline" asset catalog image.
    static var heroiconArrowsUpDownOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowsUpDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-arrows-up-down-solid" asset catalog image.
    static var heroiconArrowsUpDownSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconArrowsUpDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-at-symbol-outline" asset catalog image.
    static var heroiconAtSymbolOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconAtSymbolOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-at-symbol-solid" asset catalog image.
    static var heroiconAtSymbolSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconAtSymbolSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-backspace-outline" asset catalog image.
    static var heroiconBackspaceOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBackspaceOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-backspace-solid" asset catalog image.
    static var heroiconBackspaceSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBackspaceSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-backward-outline" asset catalog image.
    static var heroiconBackwardOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBackwardOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-backward-solid" asset catalog image.
    static var heroiconBackwardSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBackwardSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-banknotes-outline" asset catalog image.
    static var heroiconBanknotesOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBanknotesOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-banknotes-solid" asset catalog image.
    static var heroiconBanknotesSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBanknotesSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-2-outline" asset catalog image.
    static var heroiconBars2Outline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBars2Outline)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-2-solid" asset catalog image.
    static var heroiconBars2Solid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBars2Solid)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-3-bottom-left-outline" asset catalog image.
    static var heroiconBars3BottomLeftOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBars3BottomLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-3-bottom-left-solid" asset catalog image.
    static var heroiconBars3BottomLeftSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBars3BottomLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-3-bottom-right-outline" asset catalog image.
    static var heroiconBars3BottomRightOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBars3BottomRightOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-3-bottom-right-solid" asset catalog image.
    static var heroiconBars3BottomRightSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBars3BottomRightSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-3-center-left-outline" asset catalog image.
    static var heroiconBars3CenterLeftOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBars3CenterLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-3-center-left-solid" asset catalog image.
    static var heroiconBars3CenterLeftSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBars3CenterLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-3-outline" asset catalog image.
    static var heroiconBars3Outline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBars3Outline)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-3-solid" asset catalog image.
    static var heroiconBars3Solid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBars3Solid)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-4-outline" asset catalog image.
    static var heroiconBars4Outline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBars4Outline)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-4-solid" asset catalog image.
    static var heroiconBars4Solid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBars4Solid)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-arrow-down-outline" asset catalog image.
    static var heroiconBarsArrowDownOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBarsArrowDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-arrow-down-solid" asset catalog image.
    static var heroiconBarsArrowDownSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBarsArrowDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-arrow-up-outline" asset catalog image.
    static var heroiconBarsArrowUpOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBarsArrowUpOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bars-arrow-up-solid" asset catalog image.
    static var heroiconBarsArrowUpSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBarsArrowUpSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-battery-0-outline" asset catalog image.
    static var heroiconBattery0Outline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBattery0Outline)
#else
        .init()
#endif
    }

    /// The "heroicon-battery-0-solid" asset catalog image.
    static var heroiconBattery0Solid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBattery0Solid)
#else
        .init()
#endif
    }

    /// The "heroicon-battery-100-outline" asset catalog image.
    static var heroiconBattery100Outline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBattery100Outline)
#else
        .init()
#endif
    }

    /// The "heroicon-battery-100-solid" asset catalog image.
    static var heroiconBattery100Solid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBattery100Solid)
#else
        .init()
#endif
    }

    /// The "heroicon-battery-50-outline" asset catalog image.
    static var heroiconBattery50Outline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBattery50Outline)
#else
        .init()
#endif
    }

    /// The "heroicon-battery-50-solid" asset catalog image.
    static var heroiconBattery50Solid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBattery50Solid)
#else
        .init()
#endif
    }

    /// The "heroicon-beaker-outline" asset catalog image.
    static var heroiconBeakerOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBeakerOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-beaker-solid" asset catalog image.
    static var heroiconBeakerSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBeakerSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bell-alert-outline" asset catalog image.
    static var heroiconBellAlertOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBellAlertOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bell-alert-solid" asset catalog image.
    static var heroiconBellAlertSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBellAlertSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bell-outline" asset catalog image.
    static var heroiconBellOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBellOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bell-slash-outline" asset catalog image.
    static var heroiconBellSlashOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBellSlashOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bell-slash-solid" asset catalog image.
    static var heroiconBellSlashSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBellSlashSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bell-snooze-outline" asset catalog image.
    static var heroiconBellSnoozeOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBellSnoozeOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bell-snooze-solid" asset catalog image.
    static var heroiconBellSnoozeSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBellSnoozeSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bell-solid" asset catalog image.
    static var heroiconBellSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBellSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bold-outline" asset catalog image.
    static var heroiconBoldOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBoldOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bold-solid" asset catalog image.
    static var heroiconBoldSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBoldSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bolt-outline" asset catalog image.
    static var heroiconBoltOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBoltOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bolt-slash-outline" asset catalog image.
    static var heroiconBoltSlashOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBoltSlashOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bolt-slash-solid" asset catalog image.
    static var heroiconBoltSlashSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBoltSlashSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bolt-solid" asset catalog image.
    static var heroiconBoltSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBoltSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-book-open-outline" asset catalog image.
    static var heroiconBookOpenOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBookOpenOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-book-open-solid" asset catalog image.
    static var heroiconBookOpenSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBookOpenSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bookmark-outline" asset catalog image.
    static var heroiconBookmarkOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBookmarkOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bookmark-slash-outline" asset catalog image.
    static var heroiconBookmarkSlashOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBookmarkSlashOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bookmark-slash-solid" asset catalog image.
    static var heroiconBookmarkSlashSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBookmarkSlashSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bookmark-solid" asset catalog image.
    static var heroiconBookmarkSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBookmarkSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bookmark-square-outline" asset catalog image.
    static var heroiconBookmarkSquareOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBookmarkSquareOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bookmark-square-solid" asset catalog image.
    static var heroiconBookmarkSquareSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBookmarkSquareSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-briefcase-outline" asset catalog image.
    static var heroiconBriefcaseOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBriefcaseOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-briefcase-solid" asset catalog image.
    static var heroiconBriefcaseSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBriefcaseSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-bug-ant-outline" asset catalog image.
    static var heroiconBugAntOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBugAntOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-bug-ant-solid" asset catalog image.
    static var heroiconBugAntSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBugAntSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-building-library-outline" asset catalog image.
    static var heroiconBuildingLibraryOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBuildingLibraryOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-building-library-solid" asset catalog image.
    static var heroiconBuildingLibrarySolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBuildingLibrarySolid)
#else
        .init()
#endif
    }

    /// The "heroicon-building-office-2-outline" asset catalog image.
    static var heroiconBuildingOffice2Outline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBuildingOffice2Outline)
#else
        .init()
#endif
    }

    /// The "heroicon-building-office-2-solid" asset catalog image.
    static var heroiconBuildingOffice2Solid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBuildingOffice2Solid)
#else
        .init()
#endif
    }

    /// The "heroicon-building-office-outline" asset catalog image.
    static var heroiconBuildingOfficeOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBuildingOfficeOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-building-office-solid" asset catalog image.
    static var heroiconBuildingOfficeSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBuildingOfficeSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-building-storefront-outline" asset catalog image.
    static var heroiconBuildingStorefrontOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBuildingStorefrontOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-building-storefront-solid" asset catalog image.
    static var heroiconBuildingStorefrontSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconBuildingStorefrontSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-cake-outline" asset catalog image.
    static var heroiconCakeOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCakeOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-cake-solid" asset catalog image.
    static var heroiconCakeSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCakeSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-calculator-outline" asset catalog image.
    static var heroiconCalculatorOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCalculatorOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-calculator-solid" asset catalog image.
    static var heroiconCalculatorSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCalculatorSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-calendar-date-range-outline" asset catalog image.
    static var heroiconCalendarDateRangeOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCalendarDateRangeOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-calendar-date-range-solid" asset catalog image.
    static var heroiconCalendarDateRangeSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCalendarDateRangeSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-calendar-days" asset catalog image.
    static var heroiconCalendarDays: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCalendarDays)
#else
        .init()
#endif
    }

    /// The "heroicon-calendar-days-solid" asset catalog image.
    static var heroiconCalendarDaysSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCalendarDaysSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-calendar-outline" asset catalog image.
    static var heroiconCalendarOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCalendarOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-calendar-solid" asset catalog image.
    static var heroiconCalendarSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCalendarSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-camera" asset catalog image.
    static var heroiconCamera: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCamera)
#else
        .init()
#endif
    }

    /// The "heroicon-camera-solid" asset catalog image.
    static var heroiconCameraSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCameraSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chart-bar" asset catalog image.
    static var heroiconChartBar: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChartBar)
#else
        .init()
#endif
    }

    /// The "heroicon-chart-bar-solid" asset catalog image.
    static var heroiconChartBarSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChartBarSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chart-bar-square-outline" asset catalog image.
    static var heroiconChartBarSquareOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChartBarSquareOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-chart-bar-square-solid" asset catalog image.
    static var heroiconChartBarSquareSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChartBarSquareSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chart-pie" asset catalog image.
    static var heroiconChartPie: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChartPie)
#else
        .init()
#endif
    }

    /// The "heroicon-chart-pie-solid" asset catalog image.
    static var heroiconChartPieSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChartPieSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chat-bubble-bottom-center-outline" asset catalog image.
    static var heroiconChatBubbleBottomCenterOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChatBubbleBottomCenterOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-chat-bubble-bottom-center-solid" asset catalog image.
    static var heroiconChatBubbleBottomCenterSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChatBubbleBottomCenterSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chat-bubble-bottom-center-text" asset catalog image.
    static var heroiconChatBubbleBottomCenterText: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChatBubbleBottomCenterText)
#else
        .init()
#endif
    }

    /// The "heroicon-chat-bubble-bottom-center-text-solid" asset catalog image.
    static var heroiconChatBubbleBottomCenterTextSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChatBubbleBottomCenterTextSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chat-bubble-left-ellipsis" asset catalog image.
    static var heroiconChatBubbleLeftEllipsis: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChatBubbleLeftEllipsis)
#else
        .init()
#endif
    }

    /// The "heroicon-chat-bubble-left-ellipsis-solid" asset catalog image.
    static var heroiconChatBubbleLeftEllipsisSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChatBubbleLeftEllipsisSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chat-bubble-left-outline" asset catalog image.
    static var heroiconChatBubbleLeftOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChatBubbleLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-chat-bubble-left-right-outline" asset catalog image.
    static var heroiconChatBubbleLeftRightOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChatBubbleLeftRightOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-chat-bubble-left-right-solid" asset catalog image.
    static var heroiconChatBubbleLeftRightSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChatBubbleLeftRightSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chat-bubble-left-solid" asset catalog image.
    static var heroiconChatBubbleLeftSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChatBubbleLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chat-bubble-oval-left-ellipsis-outline" asset catalog image.
    static var heroiconChatBubbleOvalLeftEllipsisOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChatBubbleOvalLeftEllipsisOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-chat-bubble-oval-left-ellipsis-solid" asset catalog image.
    static var heroiconChatBubbleOvalLeftEllipsisSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChatBubbleOvalLeftEllipsisSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chat-bubble-oval-left-outline" asset catalog image.
    static var heroiconChatBubbleOvalLeftOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChatBubbleOvalLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-chat-bubble-oval-left-solid" asset catalog image.
    static var heroiconChatBubbleOvalLeftSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChatBubbleOvalLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-check-badge-outline" asset catalog image.
    static var heroiconCheckBadgeOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCheckBadgeOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-check-badge-solid" asset catalog image.
    static var heroiconCheckBadgeSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCheckBadgeSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-check-circle-outline" asset catalog image.
    static var heroiconCheckCircleOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCheckCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-check-circle-solid" asset catalog image.
    static var heroiconCheckCircleSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCheckCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-check-outline" asset catalog image.
    static var heroiconCheckOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCheckOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-check-solid" asset catalog image.
    static var heroiconCheckSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCheckSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-double-down-outline" asset catalog image.
    static var heroiconChevronDoubleDownOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChevronDoubleDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-double-down-solid" asset catalog image.
    static var heroiconChevronDoubleDownSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChevronDoubleDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-double-left-outline" asset catalog image.
    static var heroiconChevronDoubleLeftOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChevronDoubleLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-double-left-solid" asset catalog image.
    static var heroiconChevronDoubleLeftSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChevronDoubleLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-double-right-outline" asset catalog image.
    static var heroiconChevronDoubleRightOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChevronDoubleRightOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-double-right-solid" asset catalog image.
    static var heroiconChevronDoubleRightSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChevronDoubleRightSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-double-up-outline" asset catalog image.
    static var heroiconChevronDoubleUpOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChevronDoubleUpOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-double-up-solid" asset catalog image.
    static var heroiconChevronDoubleUpSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChevronDoubleUpSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-down-outline" asset catalog image.
    static var heroiconChevronDownOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChevronDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-down-solid" asset catalog image.
    static var heroiconChevronDownSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChevronDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-left-outline" asset catalog image.
    static var heroiconChevronLeftOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChevronLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-left-solid" asset catalog image.
    static var heroiconChevronLeftSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChevronLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-right-outline" asset catalog image.
    static var heroiconChevronRightOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChevronRightOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-right-solid" asset catalog image.
    static var heroiconChevronRightSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChevronRightSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-up-down-outline" asset catalog image.
    static var heroiconChevronUpDownOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChevronUpDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-up-down-solid" asset catalog image.
    static var heroiconChevronUpDownSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChevronUpDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-up-outline" asset catalog image.
    static var heroiconChevronUpOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChevronUpOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-chevron-up-solid" asset catalog image.
    static var heroiconChevronUpSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconChevronUpSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-circle-stack-outline" asset catalog image.
    static var heroiconCircleStackOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCircleStackOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-circle-stack-solid" asset catalog image.
    static var heroiconCircleStackSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCircleStackSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-clipboard-document-check-outline" asset catalog image.
    static var heroiconClipboardDocumentCheckOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconClipboardDocumentCheckOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-clipboard-document-check-solid" asset catalog image.
    static var heroiconClipboardDocumentCheckSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconClipboardDocumentCheckSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-clipboard-document-list-outline" asset catalog image.
    static var heroiconClipboardDocumentListOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconClipboardDocumentListOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-clipboard-document-list-solid" asset catalog image.
    static var heroiconClipboardDocumentListSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconClipboardDocumentListSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-clipboard-document-outline" asset catalog image.
    static var heroiconClipboardDocumentOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconClipboardDocumentOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-clipboard-document-solid" asset catalog image.
    static var heroiconClipboardDocumentSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconClipboardDocumentSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-clipboard-outline" asset catalog image.
    static var heroiconClipboardOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconClipboardOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-clipboard-solid" asset catalog image.
    static var heroiconClipboardSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconClipboardSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-clock-outline" asset catalog image.
    static var heroiconClockOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconClockOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-clock-solid" asset catalog image.
    static var heroiconClockSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconClockSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-cloud-arrow-down-outline" asset catalog image.
    static var heroiconCloudArrowDownOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCloudArrowDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-cloud-arrow-down-solid" asset catalog image.
    static var heroiconCloudArrowDownSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCloudArrowDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-cloud-arrow-up-outline" asset catalog image.
    static var heroiconCloudArrowUpOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCloudArrowUpOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-cloud-arrow-up-solid" asset catalog image.
    static var heroiconCloudArrowUpSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCloudArrowUpSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-cloud-outline" asset catalog image.
    static var heroiconCloudOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCloudOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-cloud-solid" asset catalog image.
    static var heroiconCloudSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCloudSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-code-bracket-outline" asset catalog image.
    static var heroiconCodeBracketOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCodeBracketOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-code-bracket-solid" asset catalog image.
    static var heroiconCodeBracketSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCodeBracketSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-code-bracket-square-outline" asset catalog image.
    static var heroiconCodeBracketSquareOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCodeBracketSquareOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-code-bracket-square-solid" asset catalog image.
    static var heroiconCodeBracketSquareSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCodeBracketSquareSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-cog-6-tooth-outline" asset catalog image.
    static var heroiconCog6ToothOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCog6ToothOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-cog-6-tooth-solid" asset catalog image.
    static var heroiconCog6ToothSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCog6ToothSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-cog-8-tooth-outline" asset catalog image.
    static var heroiconCog8ToothOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCog8ToothOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-cog-8-tooth-solid" asset catalog image.
    static var heroiconCog8ToothSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCog8ToothSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-cog-outline" asset catalog image.
    static var heroiconCogOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCogOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-cog-solid" asset catalog image.
    static var heroiconCogSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCogSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-command-line-outline" asset catalog image.
    static var heroiconCommandLineOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCommandLineOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-command-line-solid" asset catalog image.
    static var heroiconCommandLineSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCommandLineSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-computer-desktop-outline" asset catalog image.
    static var heroiconComputerDesktopOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconComputerDesktopOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-computer-desktop-solid" asset catalog image.
    static var heroiconComputerDesktopSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconComputerDesktopSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-cpu-chip-outline" asset catalog image.
    static var heroiconCpuChipOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCpuChipOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-cpu-chip-solid" asset catalog image.
    static var heroiconCpuChipSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCpuChipSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-credit-card-outline" asset catalog image.
    static var heroiconCreditCardOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCreditCardOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-credit-card-solid" asset catalog image.
    static var heroiconCreditCardSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCreditCardSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-cube-outline" asset catalog image.
    static var heroiconCubeOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCubeOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-cube-solid" asset catalog image.
    static var heroiconCubeSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCubeSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-cube-transparent-outline" asset catalog image.
    static var heroiconCubeTransparentOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCubeTransparentOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-cube-transparent-solid" asset catalog image.
    static var heroiconCubeTransparentSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCubeTransparentSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-currency-bangladeshi-outline" asset catalog image.
    static var heroiconCurrencyBangladeshiOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCurrencyBangladeshiOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-currency-bangladeshi-solid" asset catalog image.
    static var heroiconCurrencyBangladeshiSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCurrencyBangladeshiSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-currency-dollar-outline" asset catalog image.
    static var heroiconCurrencyDollarOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCurrencyDollarOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-currency-dollar-solid" asset catalog image.
    static var heroiconCurrencyDollarSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCurrencyDollarSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-currency-euro-outline" asset catalog image.
    static var heroiconCurrencyEuroOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCurrencyEuroOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-currency-euro-solid" asset catalog image.
    static var heroiconCurrencyEuroSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCurrencyEuroSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-currency-pound-outline" asset catalog image.
    static var heroiconCurrencyPoundOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCurrencyPoundOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-currency-pound-solid" asset catalog image.
    static var heroiconCurrencyPoundSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCurrencyPoundSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-currency-rupee-outline" asset catalog image.
    static var heroiconCurrencyRupeeOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCurrencyRupeeOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-currency-rupee-solid" asset catalog image.
    static var heroiconCurrencyRupeeSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCurrencyRupeeSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-currency-yen-outline" asset catalog image.
    static var heroiconCurrencyYenOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCurrencyYenOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-currency-yen-solid" asset catalog image.
    static var heroiconCurrencyYenSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCurrencyYenSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-cursor-arrow-rays-outline" asset catalog image.
    static var heroiconCursorArrowRaysOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCursorArrowRaysOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-cursor-arrow-rays-solid" asset catalog image.
    static var heroiconCursorArrowRaysSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCursorArrowRaysSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-cursor-arrow-ripple-outline" asset catalog image.
    static var heroiconCursorArrowRippleOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCursorArrowRippleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-cursor-arrow-ripple-solid" asset catalog image.
    static var heroiconCursorArrowRippleSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconCursorArrowRippleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-device-phone-mobile-outline" asset catalog image.
    static var heroiconDevicePhoneMobileOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDevicePhoneMobileOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-device-phone-mobile-solid" asset catalog image.
    static var heroiconDevicePhoneMobileSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDevicePhoneMobileSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-device-tablet-outline" asset catalog image.
    static var heroiconDeviceTabletOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDeviceTabletOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-device-tablet-solid" asset catalog image.
    static var heroiconDeviceTabletSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDeviceTabletSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-divide-outline" asset catalog image.
    static var heroiconDivideOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDivideOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-divide-solid" asset catalog image.
    static var heroiconDivideSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDivideSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-arrow-down-outline" asset catalog image.
    static var heroiconDocumentArrowDownOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentArrowDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-arrow-down-solid" asset catalog image.
    static var heroiconDocumentArrowDownSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentArrowDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-arrow-up-outline" asset catalog image.
    static var heroiconDocumentArrowUpOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentArrowUpOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-arrow-up-solid" asset catalog image.
    static var heroiconDocumentArrowUpSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentArrowUpSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-chart-bar-outline" asset catalog image.
    static var heroiconDocumentChartBarOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentChartBarOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-chart-bar-solid" asset catalog image.
    static var heroiconDocumentChartBarSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentChartBarSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-check-outline" asset catalog image.
    static var heroiconDocumentCheckOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentCheckOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-check-solid" asset catalog image.
    static var heroiconDocumentCheckSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentCheckSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-currency-bangladeshi-outline" asset catalog image.
    static var heroiconDocumentCurrencyBangladeshiOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentCurrencyBangladeshiOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-currency-bangladeshi-solid" asset catalog image.
    static var heroiconDocumentCurrencyBangladeshiSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentCurrencyBangladeshiSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-currency-dollar-outline" asset catalog image.
    static var heroiconDocumentCurrencyDollarOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentCurrencyDollarOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-currency-dollar-solid" asset catalog image.
    static var heroiconDocumentCurrencyDollarSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentCurrencyDollarSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-currency-euro-outline" asset catalog image.
    static var heroiconDocumentCurrencyEuroOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentCurrencyEuroOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-currency-euro-solid" asset catalog image.
    static var heroiconDocumentCurrencyEuroSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentCurrencyEuroSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-currency-pound-outline" asset catalog image.
    static var heroiconDocumentCurrencyPoundOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentCurrencyPoundOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-currency-pound-solid" asset catalog image.
    static var heroiconDocumentCurrencyPoundSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentCurrencyPoundSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-currency-rupee-outline" asset catalog image.
    static var heroiconDocumentCurrencyRupeeOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentCurrencyRupeeOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-currency-rupee-solid" asset catalog image.
    static var heroiconDocumentCurrencyRupeeSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentCurrencyRupeeSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-currency-yen-outline" asset catalog image.
    static var heroiconDocumentCurrencyYenOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentCurrencyYenOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-currency-yen-solid" asset catalog image.
    static var heroiconDocumentCurrencyYenSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentCurrencyYenSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-duplicate-outline" asset catalog image.
    static var heroiconDocumentDuplicateOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentDuplicateOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-duplicate-solid" asset catalog image.
    static var heroiconDocumentDuplicateSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentDuplicateSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-magnifying-glass-outline" asset catalog image.
    static var heroiconDocumentMagnifyingGlassOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentMagnifyingGlassOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-magnifying-glass-solid" asset catalog image.
    static var heroiconDocumentMagnifyingGlassSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentMagnifyingGlassSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-minus-outline" asset catalog image.
    static var heroiconDocumentMinusOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentMinusOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-minus-solid" asset catalog image.
    static var heroiconDocumentMinusSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentMinusSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-outline" asset catalog image.
    static var heroiconDocumentOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-plus-outline" asset catalog image.
    static var heroiconDocumentPlusOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentPlusOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-plus-solid" asset catalog image.
    static var heroiconDocumentPlusSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentPlusSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-solid" asset catalog image.
    static var heroiconDocumentSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-document-text-outline" asset catalog image.
    static var heroiconDocumentTextOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentTextOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-document-text-solid" asset catalog image.
    static var heroiconDocumentTextSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconDocumentTextSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-ellipsis-horizontal-circle-outline" asset catalog image.
    static var heroiconEllipsisHorizontalCircleOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconEllipsisHorizontalCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-ellipsis-horizontal-circle-solid" asset catalog image.
    static var heroiconEllipsisHorizontalCircleSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconEllipsisHorizontalCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-ellipsis-horizontal-outline" asset catalog image.
    static var heroiconEllipsisHorizontalOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconEllipsisHorizontalOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-ellipsis-horizontal-solid" asset catalog image.
    static var heroiconEllipsisHorizontalSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconEllipsisHorizontalSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-ellipsis-vertical-outline" asset catalog image.
    static var heroiconEllipsisVerticalOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconEllipsisVerticalOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-ellipsis-vertical-solid" asset catalog image.
    static var heroiconEllipsisVerticalSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconEllipsisVerticalSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-envelope-open-outline" asset catalog image.
    static var heroiconEnvelopeOpenOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconEnvelopeOpenOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-envelope-open-solid" asset catalog image.
    static var heroiconEnvelopeOpenSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconEnvelopeOpenSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-envelope-outline" asset catalog image.
    static var heroiconEnvelopeOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconEnvelopeOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-envelope-solid" asset catalog image.
    static var heroiconEnvelopeSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconEnvelopeSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-equals-outline" asset catalog image.
    static var heroiconEqualsOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconEqualsOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-equals-solid" asset catalog image.
    static var heroiconEqualsSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconEqualsSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-exclamation-circle-outline" asset catalog image.
    static var heroiconExclamationCircleOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconExclamationCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-exclamation-circle-solid" asset catalog image.
    static var heroiconExclamationCircleSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconExclamationCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-exclamation-triangle-outline" asset catalog image.
    static var heroiconExclamationTriangleOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconExclamationTriangleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-exclamation-triangle-solid" asset catalog image.
    static var heroiconExclamationTriangleSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconExclamationTriangleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-eye-dropper-outline" asset catalog image.
    static var heroiconEyeDropperOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconEyeDropperOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-eye-dropper-solid" asset catalog image.
    static var heroiconEyeDropperSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconEyeDropperSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-eye-outline" asset catalog image.
    static var heroiconEyeOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconEyeOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-eye-slash-outline" asset catalog image.
    static var heroiconEyeSlashOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconEyeSlashOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-eye-slash-solid" asset catalog image.
    static var heroiconEyeSlashSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconEyeSlashSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-eye-solid" asset catalog image.
    static var heroiconEyeSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconEyeSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-face-frown-outline" asset catalog image.
    static var heroiconFaceFrownOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconFaceFrownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-face-frown-solid" asset catalog image.
    static var heroiconFaceFrownSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconFaceFrownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-face-smile-outline" asset catalog image.
    static var heroiconFaceSmileOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconFaceSmileOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-face-smile-solid" asset catalog image.
    static var heroiconFaceSmileSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconFaceSmileSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-film-outline" asset catalog image.
    static var heroiconFilmOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconFilmOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-film-solid" asset catalog image.
    static var heroiconFilmSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconFilmSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-finger-print-outline" asset catalog image.
    static var heroiconFingerPrintOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconFingerPrintOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-finger-print-solid" asset catalog image.
    static var heroiconFingerPrintSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconFingerPrintSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-fire-outline" asset catalog image.
    static var heroiconFireOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconFireOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-fire-solid" asset catalog image.
    static var heroiconFireSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconFireSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-flag-outline" asset catalog image.
    static var heroiconFlagOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconFlagOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-flag-solid" asset catalog image.
    static var heroiconFlagSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconFlagSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-folder-arrow-down-outline" asset catalog image.
    static var heroiconFolderArrowDownOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconFolderArrowDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-folder-arrow-down-solid" asset catalog image.
    static var heroiconFolderArrowDownSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconFolderArrowDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-folder-minus-outline" asset catalog image.
    static var heroiconFolderMinusOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconFolderMinusOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-folder-minus-solid" asset catalog image.
    static var heroiconFolderMinusSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconFolderMinusSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-folder-open-outline" asset catalog image.
    static var heroiconFolderOpenOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconFolderOpenOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-folder-open-solid" asset catalog image.
    static var heroiconFolderOpenSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconFolderOpenSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-folder-outline" asset catalog image.
    static var heroiconFolderOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconFolderOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-folder-plus-outline" asset catalog image.
    static var heroiconFolderPlusOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconFolderPlusOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-folder-plus-solid" asset catalog image.
    static var heroiconFolderPlusSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconFolderPlusSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-folder-solid" asset catalog image.
    static var heroiconFolderSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconFolderSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-forward-outline" asset catalog image.
    static var heroiconForwardOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconForwardOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-forward-solid" asset catalog image.
    static var heroiconForwardSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconForwardSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-funnel-outline" asset catalog image.
    static var heroiconFunnelOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconFunnelOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-funnel-solid" asset catalog image.
    static var heroiconFunnelSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconFunnelSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-gif-outline" asset catalog image.
    static var heroiconGifOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconGifOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-gif-solid" asset catalog image.
    static var heroiconGifSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconGifSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-gift-outline" asset catalog image.
    static var heroiconGiftOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconGiftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-gift-solid" asset catalog image.
    static var heroiconGiftSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconGiftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-gift-top-outline" asset catalog image.
    static var heroiconGiftTopOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconGiftTopOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-gift-top-solid" asset catalog image.
    static var heroiconGiftTopSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconGiftTopSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-globe-alt-outline" asset catalog image.
    static var heroiconGlobeAltOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconGlobeAltOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-globe-alt-solid" asset catalog image.
    static var heroiconGlobeAltSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconGlobeAltSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-globe-americas-outline" asset catalog image.
    static var heroiconGlobeAmericasOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconGlobeAmericasOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-globe-americas-solid" asset catalog image.
    static var heroiconGlobeAmericasSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconGlobeAmericasSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-globe-asia-australia-outline" asset catalog image.
    static var heroiconGlobeAsiaAustraliaOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconGlobeAsiaAustraliaOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-globe-asia-australia-solid" asset catalog image.
    static var heroiconGlobeAsiaAustraliaSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconGlobeAsiaAustraliaSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-globe-europe-africa-outline" asset catalog image.
    static var heroiconGlobeEuropeAfricaOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconGlobeEuropeAfricaOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-globe-europe-africa-solid" asset catalog image.
    static var heroiconGlobeEuropeAfricaSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconGlobeEuropeAfricaSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-h1-outline" asset catalog image.
    static var heroiconH1Outline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconH1Outline)
#else
        .init()
#endif
    }

    /// The "heroicon-h1-solid" asset catalog image.
    static var heroiconH1Solid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconH1Solid)
#else
        .init()
#endif
    }

    /// The "heroicon-h2-outline" asset catalog image.
    static var heroiconH2Outline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconH2Outline)
#else
        .init()
#endif
    }

    /// The "heroicon-h2-solid" asset catalog image.
    static var heroiconH2Solid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconH2Solid)
#else
        .init()
#endif
    }

    /// The "heroicon-h3-outline" asset catalog image.
    static var heroiconH3Outline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconH3Outline)
#else
        .init()
#endif
    }

    /// The "heroicon-h3-solid" asset catalog image.
    static var heroiconH3Solid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconH3Solid)
#else
        .init()
#endif
    }

    /// The "heroicon-hand-raised-outline" asset catalog image.
    static var heroiconHandRaisedOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconHandRaisedOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-hand-raised-solid" asset catalog image.
    static var heroiconHandRaisedSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconHandRaisedSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-hand-thumb-down-outline" asset catalog image.
    static var heroiconHandThumbDownOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconHandThumbDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-hand-thumb-down-solid" asset catalog image.
    static var heroiconHandThumbDownSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconHandThumbDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-hand-thumb-up-outline" asset catalog image.
    static var heroiconHandThumbUpOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconHandThumbUpOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-hand-thumb-up-solid" asset catalog image.
    static var heroiconHandThumbUpSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconHandThumbUpSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-hashtag-outline" asset catalog image.
    static var heroiconHashtagOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconHashtagOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-hashtag-solid" asset catalog image.
    static var heroiconHashtagSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconHashtagSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-heart-outline" asset catalog image.
    static var heroiconHeartOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconHeartOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-heart-solid" asset catalog image.
    static var heroiconHeartSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconHeartSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-home-modern-outline" asset catalog image.
    static var heroiconHomeModernOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconHomeModernOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-home-modern-solid" asset catalog image.
    static var heroiconHomeModernSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconHomeModernSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-home-outline" asset catalog image.
    static var heroiconHomeOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconHomeOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-home-solid" asset catalog image.
    static var heroiconHomeSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconHomeSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-identification-outline" asset catalog image.
    static var heroiconIdentificationOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconIdentificationOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-identification-solid" asset catalog image.
    static var heroiconIdentificationSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconIdentificationSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-inbox-arrow-down-outline" asset catalog image.
    static var heroiconInboxArrowDownOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconInboxArrowDownOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-inbox-arrow-down-solid" asset catalog image.
    static var heroiconInboxArrowDownSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconInboxArrowDownSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-inbox-outline" asset catalog image.
    static var heroiconInboxOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconInboxOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-inbox-solid" asset catalog image.
    static var heroiconInboxSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconInboxSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-inbox-stack-outline" asset catalog image.
    static var heroiconInboxStackOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconInboxStackOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-inbox-stack-solid" asset catalog image.
    static var heroiconInboxStackSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconInboxStackSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-information-circle-outline" asset catalog image.
    static var heroiconInformationCircleOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconInformationCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-information-circle-solid" asset catalog image.
    static var heroiconInformationCircleSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconInformationCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-italic-outline" asset catalog image.
    static var heroiconItalicOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconItalicOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-italic-solid" asset catalog image.
    static var heroiconItalicSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconItalicSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-key-outline" asset catalog image.
    static var heroiconKeyOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconKeyOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-key-solid" asset catalog image.
    static var heroiconKeySolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconKeySolid)
#else
        .init()
#endif
    }

    /// The "heroicon-language-outline" asset catalog image.
    static var heroiconLanguageOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconLanguageOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-language-solid" asset catalog image.
    static var heroiconLanguageSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconLanguageSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-lifebuoy-outline" asset catalog image.
    static var heroiconLifebuoyOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconLifebuoyOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-lifebuoy-solid" asset catalog image.
    static var heroiconLifebuoySolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconLifebuoySolid)
#else
        .init()
#endif
    }

    /// The "heroicon-light-bulb-outline" asset catalog image.
    static var heroiconLightBulbOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconLightBulbOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-light-bulb-solid" asset catalog image.
    static var heroiconLightBulbSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconLightBulbSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-link-outline" asset catalog image.
    static var heroiconLinkOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconLinkOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-link-slash-outline" asset catalog image.
    static var heroiconLinkSlashOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconLinkSlashOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-link-slash-solid" asset catalog image.
    static var heroiconLinkSlashSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconLinkSlashSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-link-solid" asset catalog image.
    static var heroiconLinkSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconLinkSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-list-bullet-outline" asset catalog image.
    static var heroiconListBulletOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconListBulletOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-list-bullet-solid" asset catalog image.
    static var heroiconListBulletSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconListBulletSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-lock-closed-outline" asset catalog image.
    static var heroiconLockClosedOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconLockClosedOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-lock-closed-solid" asset catalog image.
    static var heroiconLockClosedSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconLockClosedSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-lock-open-outline" asset catalog image.
    static var heroiconLockOpenOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconLockOpenOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-lock-open-solid" asset catalog image.
    static var heroiconLockOpenSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconLockOpenSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-magnifying-glass-circle-outline" asset catalog image.
    static var heroiconMagnifyingGlassCircleOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconMagnifyingGlassCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-magnifying-glass-circle-solid" asset catalog image.
    static var heroiconMagnifyingGlassCircleSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconMagnifyingGlassCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-magnifying-glass-minus-outline" asset catalog image.
    static var heroiconMagnifyingGlassMinusOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconMagnifyingGlassMinusOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-magnifying-glass-minus-solid" asset catalog image.
    static var heroiconMagnifyingGlassMinusSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconMagnifyingGlassMinusSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-magnifying-glass-outline" asset catalog image.
    static var heroiconMagnifyingGlassOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconMagnifyingGlassOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-magnifying-glass-plus-outline" asset catalog image.
    static var heroiconMagnifyingGlassPlusOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconMagnifyingGlassPlusOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-magnifying-glass-plus-solid" asset catalog image.
    static var heroiconMagnifyingGlassPlusSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconMagnifyingGlassPlusSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-magnifying-glass-solid" asset catalog image.
    static var heroiconMagnifyingGlassSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconMagnifyingGlassSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-map-outline" asset catalog image.
    static var heroiconMapOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconMapOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-map-pin-outline" asset catalog image.
    static var heroiconMapPinOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconMapPinOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-map-pin-solid" asset catalog image.
    static var heroiconMapPinSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconMapPinSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-map-solid" asset catalog image.
    static var heroiconMapSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconMapSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-megaphone-outline" asset catalog image.
    static var heroiconMegaphoneOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconMegaphoneOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-megaphone-solid" asset catalog image.
    static var heroiconMegaphoneSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconMegaphoneSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-microphone-outline" asset catalog image.
    static var heroiconMicrophoneOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconMicrophoneOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-microphone-solid" asset catalog image.
    static var heroiconMicrophoneSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconMicrophoneSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-minus-circle-outline" asset catalog image.
    static var heroiconMinusCircleOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconMinusCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-minus-circle-solid" asset catalog image.
    static var heroiconMinusCircleSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconMinusCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-minus-outline" asset catalog image.
    static var heroiconMinusOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconMinusOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-minus-small-outline" asset catalog image.
    static var heroiconMinusSmallOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconMinusSmallOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-minus-small-solid" asset catalog image.
    static var heroiconMinusSmallSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconMinusSmallSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-minus-solid" asset catalog image.
    static var heroiconMinusSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconMinusSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-moon-outline" asset catalog image.
    static var heroiconMoonOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconMoonOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-moon-solid" asset catalog image.
    static var heroiconMoonSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconMoonSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-musical-note-outline" asset catalog image.
    static var heroiconMusicalNoteOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconMusicalNoteOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-musical-note-solid" asset catalog image.
    static var heroiconMusicalNoteSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconMusicalNoteSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-newspaper-outline" asset catalog image.
    static var heroiconNewspaperOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconNewspaperOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-newspaper-solid" asset catalog image.
    static var heroiconNewspaperSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconNewspaperSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-no-symbol-outline" asset catalog image.
    static var heroiconNoSymbolOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconNoSymbolOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-no-symbol-solid" asset catalog image.
    static var heroiconNoSymbolSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconNoSymbolSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-numbered-list-outline" asset catalog image.
    static var heroiconNumberedListOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconNumberedListOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-numbered-list-solid" asset catalog image.
    static var heroiconNumberedListSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconNumberedListSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-paint-brush-outline" asset catalog image.
    static var heroiconPaintBrushOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPaintBrushOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-paint-brush-solid" asset catalog image.
    static var heroiconPaintBrushSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPaintBrushSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-paper-airplane-outline" asset catalog image.
    static var heroiconPaperAirplaneOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPaperAirplaneOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-paper-airplane-solid" asset catalog image.
    static var heroiconPaperAirplaneSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPaperAirplaneSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-paper-clip-outline" asset catalog image.
    static var heroiconPaperClipOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPaperClipOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-paper-clip-solid" asset catalog image.
    static var heroiconPaperClipSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPaperClipSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-pause-circle-outline" asset catalog image.
    static var heroiconPauseCircleOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPauseCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-pause-circle-solid" asset catalog image.
    static var heroiconPauseCircleSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPauseCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-pause-outline" asset catalog image.
    static var heroiconPauseOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPauseOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-pause-solid" asset catalog image.
    static var heroiconPauseSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPauseSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-pencil-outline" asset catalog image.
    static var heroiconPencilOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPencilOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-pencil-solid" asset catalog image.
    static var heroiconPencilSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPencilSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-pencil-square-outline" asset catalog image.
    static var heroiconPencilSquareOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPencilSquareOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-pencil-square-solid" asset catalog image.
    static var heroiconPencilSquareSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPencilSquareSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-percent-badge-outline" asset catalog image.
    static var heroiconPercentBadgeOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPercentBadgeOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-percent-badge-solid" asset catalog image.
    static var heroiconPercentBadgeSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPercentBadgeSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-phone-arrow-down-left-outline" asset catalog image.
    static var heroiconPhoneArrowDownLeftOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPhoneArrowDownLeftOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-phone-arrow-down-left-solid" asset catalog image.
    static var heroiconPhoneArrowDownLeftSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPhoneArrowDownLeftSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-phone-arrow-up-right-outline" asset catalog image.
    static var heroiconPhoneArrowUpRightOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPhoneArrowUpRightOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-phone-arrow-up-right-solid" asset catalog image.
    static var heroiconPhoneArrowUpRightSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPhoneArrowUpRightSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-phone-outline" asset catalog image.
    static var heroiconPhoneOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPhoneOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-phone-solid" asset catalog image.
    static var heroiconPhoneSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPhoneSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-phone-x-mark-outline" asset catalog image.
    static var heroiconPhoneXMarkOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPhoneXMarkOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-phone-x-mark-solid" asset catalog image.
    static var heroiconPhoneXMarkSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPhoneXMarkSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-photo-outline" asset catalog image.
    static var heroiconPhotoOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPhotoOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-photo-solid" asset catalog image.
    static var heroiconPhotoSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPhotoSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-play-circle-outline" asset catalog image.
    static var heroiconPlayCircleOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPlayCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-play-circle-solid" asset catalog image.
    static var heroiconPlayCircleSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPlayCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-play-outline" asset catalog image.
    static var heroiconPlayOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPlayOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-play-pause-outline" asset catalog image.
    static var heroiconPlayPauseOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPlayPauseOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-play-pause-solid" asset catalog image.
    static var heroiconPlayPauseSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPlayPauseSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-play-solid" asset catalog image.
    static var heroiconPlaySolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPlaySolid)
#else
        .init()
#endif
    }

    /// The "heroicon-plus-circle-outline" asset catalog image.
    static var heroiconPlusCircleOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPlusCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-plus-circle-solid" asset catalog image.
    static var heroiconPlusCircleSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPlusCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-plus-outline" asset catalog image.
    static var heroiconPlusOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPlusOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-plus-small-outline" asset catalog image.
    static var heroiconPlusSmallOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPlusSmallOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-plus-small-solid" asset catalog image.
    static var heroiconPlusSmallSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPlusSmallSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-plus-solid" asset catalog image.
    static var heroiconPlusSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPlusSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-power-outline" asset catalog image.
    static var heroiconPowerOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPowerOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-power-solid" asset catalog image.
    static var heroiconPowerSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPowerSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-presentation-chart-bar-outline" asset catalog image.
    static var heroiconPresentationChartBarOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPresentationChartBarOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-presentation-chart-bar-solid" asset catalog image.
    static var heroiconPresentationChartBarSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPresentationChartBarSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-presentation-chart-line-outline" asset catalog image.
    static var heroiconPresentationChartLineOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPresentationChartLineOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-presentation-chart-line-solid" asset catalog image.
    static var heroiconPresentationChartLineSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPresentationChartLineSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-printer-outline" asset catalog image.
    static var heroiconPrinterOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPrinterOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-printer-solid" asset catalog image.
    static var heroiconPrinterSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPrinterSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-puzzle-piece-outline" asset catalog image.
    static var heroiconPuzzlePieceOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPuzzlePieceOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-puzzle-piece-solid" asset catalog image.
    static var heroiconPuzzlePieceSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconPuzzlePieceSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-qr-code-outline" asset catalog image.
    static var heroiconQrCodeOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconQrCodeOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-qr-code-solid" asset catalog image.
    static var heroiconQrCodeSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconQrCodeSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-question-mark-circle-outline" asset catalog image.
    static var heroiconQuestionMarkCircleOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconQuestionMarkCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-question-mark-circle-solid" asset catalog image.
    static var heroiconQuestionMarkCircleSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconQuestionMarkCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-queue-list-outline" asset catalog image.
    static var heroiconQueueListOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconQueueListOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-queue-list-solid" asset catalog image.
    static var heroiconQueueListSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconQueueListSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-radio-outline" asset catalog image.
    static var heroiconRadioOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconRadioOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-radio-solid" asset catalog image.
    static var heroiconRadioSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconRadioSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-receipt-percent-outline" asset catalog image.
    static var heroiconReceiptPercentOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconReceiptPercentOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-receipt-percent-solid" asset catalog image.
    static var heroiconReceiptPercentSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconReceiptPercentSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-receipt-refund-outline" asset catalog image.
    static var heroiconReceiptRefundOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconReceiptRefundOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-receipt-refund-solid" asset catalog image.
    static var heroiconReceiptRefundSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconReceiptRefundSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-rectangle-group-outline" asset catalog image.
    static var heroiconRectangleGroupOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconRectangleGroupOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-rectangle-group-solid" asset catalog image.
    static var heroiconRectangleGroupSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconRectangleGroupSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-rectangle-stack-outline" asset catalog image.
    static var heroiconRectangleStackOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconRectangleStackOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-rectangle-stack-solid" asset catalog image.
    static var heroiconRectangleStackSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconRectangleStackSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-rocket-launch-outline" asset catalog image.
    static var heroiconRocketLaunchOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconRocketLaunchOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-rocket-launch-solid" asset catalog image.
    static var heroiconRocketLaunchSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconRocketLaunchSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-rss-outline" asset catalog image.
    static var heroiconRssOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconRssOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-rss-solid" asset catalog image.
    static var heroiconRssSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconRssSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-scale-outline" asset catalog image.
    static var heroiconScaleOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconScaleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-scale-solid" asset catalog image.
    static var heroiconScaleSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconScaleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-scissors-outline" asset catalog image.
    static var heroiconScissorsOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconScissorsOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-scissors-solid" asset catalog image.
    static var heroiconScissorsSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconScissorsSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-server-outline" asset catalog image.
    static var heroiconServerOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconServerOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-server-solid" asset catalog image.
    static var heroiconServerSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconServerSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-server-stack-outline" asset catalog image.
    static var heroiconServerStackOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconServerStackOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-server-stack-solid" asset catalog image.
    static var heroiconServerStackSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconServerStackSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-share-outline" asset catalog image.
    static var heroiconShareOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconShareOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-share-solid" asset catalog image.
    static var heroiconShareSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconShareSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-shield-check-outline" asset catalog image.
    static var heroiconShieldCheckOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconShieldCheckOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-shield-check-solid" asset catalog image.
    static var heroiconShieldCheckSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconShieldCheckSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-shield-exclamation-outline" asset catalog image.
    static var heroiconShieldExclamationOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconShieldExclamationOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-shield-exclamation-solid" asset catalog image.
    static var heroiconShieldExclamationSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconShieldExclamationSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-shopping-bag-outline" asset catalog image.
    static var heroiconShoppingBagOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconShoppingBagOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-shopping-bag-solid" asset catalog image.
    static var heroiconShoppingBagSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconShoppingBagSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-shopping-cart-outline" asset catalog image.
    static var heroiconShoppingCartOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconShoppingCartOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-shopping-cart-solid" asset catalog image.
    static var heroiconShoppingCartSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconShoppingCartSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-signal-outline" asset catalog image.
    static var heroiconSignalOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconSignalOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-signal-slash-outline" asset catalog image.
    static var heroiconSignalSlashOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconSignalSlashOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-signal-slash-solid" asset catalog image.
    static var heroiconSignalSlashSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconSignalSlashSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-signal-solid" asset catalog image.
    static var heroiconSignalSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconSignalSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-slash-outline" asset catalog image.
    static var heroiconSlashOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconSlashOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-slash-solid" asset catalog image.
    static var heroiconSlashSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconSlashSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-sparkles-outline" asset catalog image.
    static var heroiconSparklesOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconSparklesOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-sparkles-solid" asset catalog image.
    static var heroiconSparklesSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconSparklesSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-speaker-wave-outline" asset catalog image.
    static var heroiconSpeakerWaveOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconSpeakerWaveOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-speaker-wave-solid" asset catalog image.
    static var heroiconSpeakerWaveSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconSpeakerWaveSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-speaker-x-mark-outline" asset catalog image.
    static var heroiconSpeakerXMarkOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconSpeakerXMarkOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-speaker-x-mark-solid" asset catalog image.
    static var heroiconSpeakerXMarkSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconSpeakerXMarkSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-square-2-stack-outline" asset catalog image.
    static var heroiconSquare2StackOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconSquare2StackOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-square-2-stack-solid" asset catalog image.
    static var heroiconSquare2StackSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconSquare2StackSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-square-3-stack-3d-outline" asset catalog image.
    static var heroiconSquare3Stack3DOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconSquare3Stack3DOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-square-3-stack-3d-solid" asset catalog image.
    static var heroiconSquare3Stack3DSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconSquare3Stack3DSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-squares-2x2-outline" asset catalog image.
    static var heroiconSquares2X2Outline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconSquares2X2Outline)
#else
        .init()
#endif
    }

    /// The "heroicon-squares-2x2-solid" asset catalog image.
    static var heroiconSquares2X2Solid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconSquares2X2Solid)
#else
        .init()
#endif
    }

    /// The "heroicon-squares-plus-outline" asset catalog image.
    static var heroiconSquaresPlusOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconSquaresPlusOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-squares-plus-solid" asset catalog image.
    static var heroiconSquaresPlusSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconSquaresPlusSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-star-outline" asset catalog image.
    static var heroiconStarOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconStarOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-star-solid" asset catalog image.
    static var heroiconStarSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconStarSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-stop-circle-outline" asset catalog image.
    static var heroiconStopCircleOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconStopCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-stop-circle-solid" asset catalog image.
    static var heroiconStopCircleSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconStopCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-stop-outline" asset catalog image.
    static var heroiconStopOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconStopOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-stop-solid" asset catalog image.
    static var heroiconStopSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconStopSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-strikethrough-outline" asset catalog image.
    static var heroiconStrikethroughOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconStrikethroughOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-strikethrough-solid" asset catalog image.
    static var heroiconStrikethroughSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconStrikethroughSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-sun-outline" asset catalog image.
    static var heroiconSunOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconSunOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-sun-solid" asset catalog image.
    static var heroiconSunSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconSunSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-swatch-outline" asset catalog image.
    static var heroiconSwatchOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconSwatchOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-swatch-solid" asset catalog image.
    static var heroiconSwatchSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconSwatchSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-table-cells-outline" asset catalog image.
    static var heroiconTableCellsOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconTableCellsOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-table-cells-solid" asset catalog image.
    static var heroiconTableCellsSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconTableCellsSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-tag-outline" asset catalog image.
    static var heroiconTagOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconTagOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-tag-solid" asset catalog image.
    static var heroiconTagSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconTagSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-ticket-outline" asset catalog image.
    static var heroiconTicketOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconTicketOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-ticket-solid" asset catalog image.
    static var heroiconTicketSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconTicketSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-trash-outline" asset catalog image.
    static var heroiconTrashOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconTrashOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-trash-solid" asset catalog image.
    static var heroiconTrashSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconTrashSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-trophy-outline" asset catalog image.
    static var heroiconTrophyOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconTrophyOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-trophy-solid" asset catalog image.
    static var heroiconTrophySolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconTrophySolid)
#else
        .init()
#endif
    }

    /// The "heroicon-truck-outline" asset catalog image.
    static var heroiconTruckOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconTruckOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-truck-solid" asset catalog image.
    static var heroiconTruckSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconTruckSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-tv-outline" asset catalog image.
    static var heroiconTvOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconTvOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-tv-solid" asset catalog image.
    static var heroiconTvSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconTvSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-underline-outline" asset catalog image.
    static var heroiconUnderlineOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconUnderlineOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-underline-solid" asset catalog image.
    static var heroiconUnderlineSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconUnderlineSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-user-circle-outline" asset catalog image.
    static var heroiconUserCircleOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconUserCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-user-circle-solid" asset catalog image.
    static var heroiconUserCircleSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconUserCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-user-group-outline" asset catalog image.
    static var heroiconUserGroupOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconUserGroupOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-user-group-solid" asset catalog image.
    static var heroiconUserGroupSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconUserGroupSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-user-minus-outline" asset catalog image.
    static var heroiconUserMinusOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconUserMinusOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-user-minus-solid" asset catalog image.
    static var heroiconUserMinusSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconUserMinusSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-user-outline" asset catalog image.
    static var heroiconUserOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconUserOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-user-plus-outline" asset catalog image.
    static var heroiconUserPlusOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconUserPlusOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-user-plus-solid" asset catalog image.
    static var heroiconUserPlusSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconUserPlusSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-user-solid" asset catalog image.
    static var heroiconUserSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconUserSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-users-outline" asset catalog image.
    static var heroiconUsersOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconUsersOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-users-solid" asset catalog image.
    static var heroiconUsersSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconUsersSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-variable-outline" asset catalog image.
    static var heroiconVariableOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconVariableOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-variable-solid" asset catalog image.
    static var heroiconVariableSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconVariableSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-video-camera-outline" asset catalog image.
    static var heroiconVideoCameraOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconVideoCameraOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-video-camera-slash-outline" asset catalog image.
    static var heroiconVideoCameraSlashOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconVideoCameraSlashOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-video-camera-slash-solid" asset catalog image.
    static var heroiconVideoCameraSlashSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconVideoCameraSlashSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-video-camera-solid" asset catalog image.
    static var heroiconVideoCameraSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconVideoCameraSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-view-columns-outline" asset catalog image.
    static var heroiconViewColumnsOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconViewColumnsOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-view-columns-solid" asset catalog image.
    static var heroiconViewColumnsSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconViewColumnsSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-viewfinder-circle-outline" asset catalog image.
    static var heroiconViewfinderCircleOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconViewfinderCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-viewfinder-circle-solid" asset catalog image.
    static var heroiconViewfinderCircleSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconViewfinderCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-wallet-outline" asset catalog image.
    static var heroiconWalletOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconWalletOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-wallet-solid" asset catalog image.
    static var heroiconWalletSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconWalletSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-wifi-outline" asset catalog image.
    static var heroiconWifiOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconWifiOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-wifi-solid" asset catalog image.
    static var heroiconWifiSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconWifiSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-window-outline" asset catalog image.
    static var heroiconWindowOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconWindowOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-window-solid" asset catalog image.
    static var heroiconWindowSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconWindowSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-wrench-outline" asset catalog image.
    static var heroiconWrenchOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconWrenchOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-wrench-screwdriver-outline" asset catalog image.
    static var heroiconWrenchScrewdriverOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconWrenchScrewdriverOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-wrench-screwdriver-solid" asset catalog image.
    static var heroiconWrenchScrewdriverSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconWrenchScrewdriverSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-wrench-solid" asset catalog image.
    static var heroiconWrenchSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconWrenchSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-x-circle-outline" asset catalog image.
    static var heroiconXCircleOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconXCircleOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-x-circle-solid" asset catalog image.
    static var heroiconXCircleSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconXCircleSolid)
#else
        .init()
#endif
    }

    /// The "heroicon-x-mark-outline" asset catalog image.
    static var heroiconXMarkOutline: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconXMarkOutline)
#else
        .init()
#endif
    }

    /// The "heroicon-x-mark-solid" asset catalog image.
    static var heroiconXMarkSolid: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .heroiconXMarkSolid)
#else
        .init()
#endif
    }

}
#endif

// MARK: - Thinnable Asset Support -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ColorResource {

    private init?(thinnableName: Swift.String, bundle: Foundation.Bundle) {
#if canImport(AppKit) && os(macOS)
        if AppKit.NSColor(named: NSColor.Name(thinnableName), bundle: bundle) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIColor(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}
#endif

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ImageResource {

    private init?(thinnableName: Swift.String, bundle: Foundation.Bundle) {
#if canImport(AppKit) && os(macOS)
        if bundle.image(forResource: NSImage.Name(thinnableName)) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIImage(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

