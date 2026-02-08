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
    @State private var isAuraExpanded = false
    @State private var recordingBlend: CGFloat = 0

    private var clampedMicLevel: CGFloat {
        clamp(micLevel, min: 0, max: 1)
    }

    var body: some View {
        GeometryReader { proxy in
            let width = max(proxy.size.width, 1)
            let idleDiameter = clamp(width * 0.34, min: 120, max: 180)
            let recordingDiameter = clamp(width * 0.46, min: 170, max: 250)
            let diameter = lerp(idleDiameter, recordingDiameter, recordingBlend)

            let breathingMin = lerp(0.98, 0.99, recordingBlend)
            let breathingMax = lerp(1.01, 1.06, recordingBlend)
            let breathingScale = reduceMotion ? 1.0 : (isBreathing ? breathingMax : breathingMin)
            let micScale = isRecording ? (clampedMicLevel * 0.035) : 0

            let driftValue: CGFloat = reduceMotion ? 0 : (isDrifting ? 1 : 0)
            let warpX = reduceMotion ? 1.0 : lerp(0.995, 1.025, driftValue)
            let warpY = reduceMotion ? 1.0 : lerp(1.01, 0.975, driftValue)

            let auraOpacity = 0.08 + (recordingBlend * 0.14) + ((isRecording ? clampedMicLevel : 0) * 0.22)
            let auraScale = reduceMotion ? 1.02 : (isAuraExpanded ? 1.18 : 1.04)

            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            stops: [
                                .init(color: Color(red: 0.63, green: 0.74, blue: 1.00).opacity(auraOpacity), location: 0.15),
                                .init(color: Color(red: 0.85, green: 0.78, blue: 0.99).opacity(auraOpacity * 0.62), location: 0.46),
                                .init(color: .clear, location: 1.0)
                            ],
                            center: UnitPoint(x: 0.48 + (driftValue * 0.04), y: 0.5 - (driftValue * 0.03)),
                            startRadius: diameter * 0.10,
                            endRadius: diameter * 0.78
                        )
                    )
                    .frame(width: diameter * 1.42, height: diameter * 1.42)
                    .scaleEffect(auraScale)
                    .blur(radius: reduceMotion ? 18 : 26)
                    .opacity(isRecording || clampedMicLevel > 0.01 ? 1 : 0.72)

                blobBody(diameter: diameter, driftValue: driftValue)
                    .frame(width: diameter, height: diameter)
                    .scaleEffect(x: warpX, y: warpY)
                    .scaleEffect(breathingScale + micScale)
                    .shadow(
                        color: Color(red: 0.68, green: 0.77, blue: 0.98).opacity(0.22 + (recordingBlend * 0.12)),
                        radius: lerp(18, 30, recordingBlend),
                        y: lerp(8, 14, recordingBlend)
                    )
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

        ZStack {
            Circle()
                .fill(
                    RadialGradient(
                        stops: [
                            .init(color: Color(red: 0.97, green: 0.98, blue: 1.00), location: 0.00),
                            .init(color: Color(red: 0.77, green: 0.88, blue: 1.00), location: 0.32),
                            .init(color: Color(red: 0.84, green: 0.78, blue: 0.98), location: 0.62),
                            .init(color: Color(red: 0.98, green: 0.95, blue: 0.98), location: 1.00)
                        ],
                        center: UnitPoint(x: 0.32 + (driftValue * 0.16), y: 0.25 - (driftValue * 0.10)),
                        startRadius: diameter * 0.03,
                        endRadius: diameter * 0.74
                    )
                )

            Circle()
                .fill(
                    LinearGradient(
                        stops: [
                            .init(color: Color(red: 0.99, green: 0.98, blue: 1.00).opacity(0.56), location: 0.00),
                            .init(color: Color(red: 0.82, green: 0.94, blue: 1.00).opacity(0.38), location: 0.40),
                            .init(color: Color(red: 0.86, green: 0.82, blue: 1.00).opacity(0.32), location: 0.75),
                            .init(color: Color(red: 1.00, green: 0.95, blue: 0.98).opacity(0.30), location: 1.00)
                        ],
                        startPoint: UnitPoint(x: 0.14 + (driftValue * 0.20), y: 0.08),
                        endPoint: UnitPoint(x: 0.88 - (driftValue * 0.14), y: 0.96)
                    )
                )
                .blendMode(.screen)

            Circle()
                .strokeBorder(Color.white.opacity(0.46), lineWidth: 1.0)
                .blur(radius: 0.5)
                .opacity(0.68)

            Circle()
                .fill(
                    LinearGradient(
                        stops: [
                            .init(color: Color.white.opacity(0.54), location: 0.00),
                            .init(color: Color.white.opacity(0.10), location: 0.62),
                            .init(color: .clear, location: 1.00)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .blur(radius: diameter * 0.05)
                .scaleEffect(x: 0.80, y: 0.44)
                .offset(x: sheenX, y: -diameter * 0.24)
                .opacity(0.46 + (recordingBlend * 0.16))
        }
        .compositingGroup()
        .blur(radius: 0.4 + (recordingBlend * 0.8))
    }

    private func configureContinuousAnimations() {
        var transaction = Transaction()
        transaction.disablesAnimations = true
        withTransaction(transaction) {
            isBreathing = false
            isDrifting = false
            isSheenShifting = false
            isAuraExpanded = false
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
        withAnimation(.easeInOut(duration: isRecording ? 2.2 : 8.0).repeatForever(autoreverses: true)) {
            isAuraExpanded = true
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
