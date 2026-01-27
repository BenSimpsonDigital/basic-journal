# Project Playbook — UI/UX Rules & Layouts

This playbook defines the UI/UX rules for Remin so new screens and changes stay consistent.

The reference screenshots are used for **layout, hierarchy, and composition** (hero-first screens, card grids, pill docks). The **visual style** (palette, tokens, components) comes from the existing design system in `Views/Theme.swift` and shared patterns like `Views/ScreenHeaderView.swift`.

## North Star
- Calm, premium, minimal; “one strong idea per screen”.
- Editorial hierarchy: large serif moments + quiet UI chrome.
- Atmosphere comes from soft, mood-driven gradients and subtle texture; UI surfaces stay restrained.
- Generous spacing, big radii, light shadows; avoid dense lists.

## Hard Rules (Non-Negotiables)
- Use design tokens from `Views/Theme.swift` (colors, type, spacing, radius). Do not hardcode arbitrary colors/fonts in views.
- Prefer existing components: `ScreenHeaderView`, `SoftCard`, `PillButtonStyle`, `MoodPill`, `VoiceInputPill`, background orbs/mesh.
- One hero headline per screen section; keep secondary text short.
- Tap targets >= 44pt; support Dynamic Type; respect Reduce Motion.

## Layout System

### Spacing & Rhythm
- Use `Theme.Spacing` values (xs/sm/md/lg/xl/xxl) as the primary spacing scale.
- Default vertical stack spacing: `Theme.Spacing.md` or `Theme.Spacing.lg`.
- Hero sections can breathe: `Theme.Spacing.xl`.
- Screen horizontal padding: prefer `Theme.Spacing.lg` (24) for content; use `Theme.Spacing.md` only when needed.

### Safe Areas
- Backgrounds can `ignoresSafeArea()`.
- Content respects safe areas; bottom controls sit above the home indicator with comfortable padding.

### Shape Language
- Primary surfaces: large rounded rectangles (use `Theme.Radius.large`).
- Pills and chips: capsule / fully rounded.
- Avoid sharp corners and heavy borders.

## Typography

### Voice
- Serif display type is for **hero** and **key states**.
- Sans (default) is for UI chrome: labels, metadata, buttons, supporting text.

### Rules
- Use `Theme.Typography.displayLarge/Medium/Small()` for hero moments.
- Use `Theme.Typography.body/subheadline/caption()` for supporting copy and controls.
- Eyebrow/subtitle: uppercase, tracked, subtle (match `ScreenHeaderView`).
- Keep hero copy short; don’t stack multiple competing headlines.

## Color, Backgrounds, and “Atmosphere”

### Background Pattern
- Default: warm cream base (`Theme.Colors.background`) + a mood-driven atmospheric layer.
- iOS 18+: prefer `BottomMeshGradient(mood:animationState:)` for the screen background.
- iOS 17 fallback: use `GradientOrb`/`AnimatedGradientOrb` for soft, luminous depth.

### Mood
- Mood drives gradients and accent moments; avoid introducing off-palette “random” colors.
- Mood changes may trigger a single “hype” burst, then settle (see Motion).

### Contrast on Gradients
- If text sits on a saturated/bright area, add a soft surface behind it (glass/panel) instead of adding heavy shadows to text.

## Surfaces (Cards, Panels, Chips)

### Soft Cards (Default Container)
- Use `SoftCard { ... }` for most content groupings.
- Keep decoration minimal: type + spacing + a small icon/metadata chip.
- Shadows are subtle; borders (if any) are hairline and low opacity.

### Glass Panels (Use Sparingly)
- Use when placing controls/text directly on an atmospheric gradient.
- Rules: large radius, subtle translucency, minimal stroke, strong text contrast.

### Pills & Chips
- Capsule shape, short labels (1–3 words), never wrap.
- Chips are secondary; they should not compete with hero text.

## Canonical Layout Templates

These are the preferred screen layouts. Start from one of these and adapt.

### 1) Gradient Hero Screen (Hero + One Action Cluster)
Use for: Today, onboarding steps, single-focus prompts.

Structure:
1. Background: `Theme.Colors.background` + mood atmosphere (mesh/orbs).
2. Header: `ScreenHeaderView` (subtitle/eyebrow + hero title).
3. Hero content: one short serif headline or prompt.
4. Supporting panel: a single `SoftCard` or glass panel (one job).
5. Bottom actions: primary pill + secondary text action, or a small pill dock.

Rules:
- Keep the middle clear; don’t stack multiple panels.
- One “primary” action; secondary action is quiet.

### 2) Card Grid / Dashboard (Varied Rhythm)
Use for: Timeline highlights, weekly summaries, insights.

Structure:
- Mixed card sizes (large feature card + smaller companion cards).
- Each card has one purpose: metric, tip, next entry, highlight.

Rules:
- Avoid uniform same-height rows; intentional variation creates rhythm.
- Reduce UI chrome; let typography and whitespace do the work.

### 3) Big Metric Card
Use for: streak, completion, mood trend, “state” messaging.

Structure:
- Eyebrow label (caption/uppercase).
- Big serif metric/state.
- One supporting line.
- Optional minimal visualization (quiet, low-contrast).

Rules:
- Visualization is decorative/supporting, not the focus.

### 4) Bottom Dock Actions (Pill Dock)
Use for: playback/recording controls, multi-action moments.

Structure:
- 2–4 pill buttons, equal height, evenly spaced.
- Dock sits above the home indicator; keep generous padding.

Rules:
- Labels are short.
- If there’s a “danger” action (delete), separate it or require confirmation.

## Motion & Interaction

### Principles
- Ambient motion is slow, organic, and background-only.
- State changes get one clear emphasis (scale/opacity/position), not multiple competing effects.
- Respect Reduce Motion: disable continuous motion when enabled.

### Recommended Mapping (Existing Patterns)
- Ambient: `BottomMeshGradient` with `.subtle`.
- Mood change: brief `.hyped`, then back to `.subtle`.
- Recording: `.calm` to reduce visual noise.
- Buttons: small press scale (already in `PillButtonStyle`).

## Accessibility & Quality Bar
- Tap targets >= 44pt; spacing ensures no accidental taps.
- Dynamic Type: ensure hero text can wrap; avoid fixed-height containers that clip.
- Contrast: test text on the brightest part of gradients.
- Reduce Motion: honor `accessibilityReduceMotion`.
- Test layouts on iPhone 15 and a smaller device size (e.g., iPhone SE/mini class) if supported.

## Implementation Guardrails
- If a pattern appears twice, promote it to a reusable component.
- Keep view styling in tokens/components; views should read like layout.
- Prefer `Theme.Spacing`/`Theme.Radius` over ad-hoc numbers.
- Avoid adding new fonts or icon families; stay consistent with existing typography and `AppIcon`.

## Review Checklist (Before Merging UI)
- The screen has a single dominant hierarchy: hero -> supporting -> controls.
- Spacing and radii match tokens.
- Cards feel soft (no heavy borders, no harsh shadows).
- Background atmosphere supports content (doesn’t fight readability).
- Motion is calm and purposeful; Reduce Motion works.
