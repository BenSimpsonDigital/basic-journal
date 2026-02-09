//
//  RecordingBlobView.swift
//  Remin
//
//  Soft procedural blob for record prompt and active recording states.
//

import SwiftUI

struct RecordingBlobView: View {
    let isRecording: Bool
    let micLevel: CGFloat

    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    @State private var isBreathing = false
    @State private var isDrifting = false
    @State private var isSheenShifting = false
    @State private var recordingBlend: CGFloat = 0

    private var clampedMicLevel: CGFloat {
        clamp(micLevel, min: 0, max: 1)
    }

    var body: some View {
        GeometryReader { proxy in
            let width = max(proxy.size.width, 1)
            let idleDiameter = clamp(width * 0.40, min: 150, max: 220)
            let recordingDiameter = clamp(width * 0.50, min: 190, max: 270)
            let diameter = lerp(idleDiameter, recordingDiameter, recordingBlend)

            let breathingMin = lerp(0.98, 0.99, recordingBlend)
            let breathingMax = lerp(1.01, 1.06, recordingBlend)
            let breathingScale = reduceMotion ? 1.0 : (isBreathing ? breathingMax : breathingMin)
            let micScale = isRecording ? (clampedMicLevel * 0.035) : 0

            let driftValue: CGFloat = reduceMotion ? 0 : (isDrifting ? 1 : 0)
            let warpX = reduceMotion ? 1.0 : lerp(0.992, 1.012, driftValue)
            let warpY = reduceMotion ? 1.0 : lerp(1.008, 0.988, driftValue)

            ZStack {
                blobBody(diameter: diameter, driftValue: driftValue)
                    .frame(width: diameter, height: diameter)
                    .scaleEffect(x: warpX, y: warpY)
                    .scaleEffect(breathingScale + micScale)
                    .offset(y: reduceMotion ? 0 : lerp(-1.5, 2.5, driftValue))
                    .shadow(color: Color.black.opacity(0.05), radius: 10, y: 8)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .animation(.spring(response: 0.68, dampingFraction: 0.84), value: isRecording)
            .animation(.easeInOut(duration: 0.45), value: recordingBlend)
        }
        .frame(maxWidth: .infinity, minHeight: 250, maxHeight: 280)
        .onAppear {
            recordingBlend = isRecording ? 1 : 0
            configureContinuousAnimations()
        }
        .onChange(of: isRecording) { _, newValue in
            if newValue {
                withAnimation(.easeInOut(duration: 0.45)) {
                    recordingBlend = 1
                }
            } else {
                withAnimation(.easeOut(duration: 0.32)) {
                    recordingBlend = 0
                }
            }
            configureContinuousAnimations()
        }
        .onChange(of: reduceMotion) { _, _ in
            configureContinuousAnimations()
        }
    }

    @ViewBuilder
    private func blobBody(diameter: CGFloat, driftValue: CGFloat) -> some View {
        let sheenShift = reduceMotion ? 0 : (isSheenShifting ? 1.0 : 0.0)
        let sheenX = lerp(-diameter * 0.20, diameter * 0.16, sheenShift)
        let highlightOffsetX = lerp(-diameter * 0.08, diameter * 0.06, driftValue)
        let highlightOffsetY = lerp(-diameter * 0.12, diameter * 0.05, driftValue)
        let saturation = 1.28 + (recordingBlend * 0.30)

        ZStack {
            // Soft feathered edge shell to avoid harsh outlines.
            Circle()
                .fill(Theme.BlobPalette.iceBlue.opacity(0.46))
                .scaleEffect(1.03)
                .blur(radius: diameter * 0.08)

            Circle()
                .fill(Theme.BlobPalette.powderBlue.opacity(0.56 + (recordingBlend * 0.08)))
                .scaleEffect(0.96)
                .blur(radius: diameter * 0.06)

            Circle()
                .fill(Theme.BlobPalette.cobalt.opacity(0.40 + (recordingBlend * 0.14)))
                .scaleEffect(0.90)
                .offset(
                    x: lerp(diameter * 0.14, -diameter * 0.10, driftValue),
                    y: lerp(diameter * 0.10, -diameter * 0.08, driftValue)
                )
                .blur(radius: diameter * 0.14)
                .blendMode(.multiply)
                .opacity(0.70)

            Circle()
                .fill(Theme.BlobPalette.peach.opacity(0.72 + (recordingBlend * 0.08)))
                .scaleEffect(0.56)
                .offset(
                    x: lerp(-diameter * 0.02, diameter * 0.05, driftValue),
                    y: lerp(-diameter * 0.03, diameter * 0.04, driftValue)
                )
                .blur(radius: diameter * 0.13)

            Circle()
                .fill(Theme.BlobPalette.skyBlue.opacity(0.62 + (recordingBlend * 0.12)))
                .scaleEffect(0.60)
                .offset(
                    x: lerp(-diameter * 0.12, diameter * 0.04, driftValue),
                    y: lerp(diameter * 0.14, diameter * 0.02, driftValue)
                )
                .blur(radius: diameter * 0.14)
                .blendMode(.multiply)
                .opacity(0.68)

            Circle()
                .fill(Theme.BlobPalette.rose.opacity(0.54 + (recordingBlend * 0.12)))
                .scaleEffect(0.44)
                .offset(
                    x: lerp(diameter * 0.04, -diameter * 0.12, driftValue),
                    y: lerp(-diameter * 0.06, diameter * 0.03, driftValue)
                )
                .blur(radius: diameter * 0.15)
                .opacity(0.82)

            Circle()
                .fill(Theme.BlobPalette.lilac.opacity(0.52 + (recordingBlend * 0.12)))
                .scaleEffect(0.52)
                .offset(
                    x: lerp(diameter * 0.15, diameter * 0.02, driftValue),
                    y: lerp(-diameter * 0.04, diameter * 0.10, driftValue)
                )
                .blur(radius: diameter * 0.14)

            Circle()
                .fill(Theme.BlobPalette.cloud.opacity(0.32))
                .scaleEffect(0.86)
                .offset(x: highlightOffsetX, y: highlightOffsetY)
                .blendMode(.screen)
                .blur(radius: diameter * 0.18)

            Circle()
                .fill(Theme.BlobPalette.cobalt.opacity(0.26 + (recordingBlend * 0.10)))
                .scaleEffect(0.38)
                .offset(
                    x: lerp(diameter * 0.19, diameter * 0.09, driftValue),
                    y: lerp(diameter * 0.12, diameter * 0.04, driftValue)
                )
                .blur(radius: diameter * 0.14)
                .blendMode(.multiply)
                .opacity(0.72)

            Circle()
                .fill(Color.white.opacity(0.08 + (recordingBlend * 0.03)))
                .scaleEffect(x: 0.58, y: 0.24)
                .offset(x: sheenX, y: -diameter * 0.24)
                .blur(radius: diameter * 0.09)
                .opacity(0.08 + (recordingBlend * 0.04))
        }
        .compositingGroup()
        .saturation(saturation)
        .contrast(1.04 + (recordingBlend * 0.06))
        .blur(radius: 1.4 + (recordingBlend * 1.3))
    }

    private func configureContinuousAnimations() {
        var transaction = Transaction()
        transaction.disablesAnimations = true
        withTransaction(transaction) {
            isBreathing = false
            isDrifting = false
            isSheenShifting = false
        }

        guard !reduceMotion else { return }

        withAnimation(.easeInOut(duration: isRecording ? 2.4 : 6.5).repeatForever(autoreverses: true)) {
            isBreathing = true
        }
        withAnimation(.easeInOut(duration: isRecording ? 6.6 : 15.5).repeatForever(autoreverses: true)) {
            isDrifting = true
        }
        withAnimation(.easeInOut(duration: isRecording ? 5.8 : 12.0).repeatForever(autoreverses: true)) {
            isSheenShifting = true
        }
    }

    private func clamp(_ value: CGFloat, min minValue: CGFloat, max maxValue: CGFloat) -> CGFloat {
        Swift.max(minValue, Swift.min(maxValue, value))
    }

    private func lerp(_ start: CGFloat, _ end: CGFloat, _ t: CGFloat) -> CGFloat {
        start + ((end - start) * t)
    }
}

#Preview("Idle Blob") {
    ZStack {
        Theme.Colors.background.ignoresSafeArea()
        RecordingBlobView(isRecording: false, micLevel: 0)
            .padding(.horizontal, Theme.Spacing.lg)
    }
}

#Preview("Recording Blob") {
    ZStack {
        Theme.Colors.background.ignoresSafeArea()
        RecordingBlobView(isRecording: true, micLevel: 0.65)
            .padding(.horizontal, Theme.Spacing.lg)
    }
}
