# Daily Check-In Flow (iOS) – Implementation Plan

Purpose:
Build a calm, once-per-day voice check-in flow that feels like a private conversation, not a journaling task.

Constraints:
- One entry per local calendar day (user's device calendar)
- Voice only
- Read-only transcripts (generated via Apple Speech framework)
- No analysis or insights shown yet
- Minimal steps, low friction
- Emotionally safe and calm

---

## Core UX Principles

- This is a daily ritual, not a productivity tool
- Every screen should reduce pressure
- Language must sound human, not technical
- Fewer choices is better than flexibility
- The app should never feel like it is judging or analyzing the user

---

## Final User Flow (Left → Right)

1. Greeting
2. Mood selection
3. Daily prompt
4. Recording
5. Playback and close

Five screens total. No branching.

Past-date entries: Users may also create entries for past dates via the calendar view. The same flow applies, anchored to the selected date instead of today.

---

## Screen 1: Greeting

### Purpose
Invite the user into the daily check-in without pressure.

### UI Elements
- Date (e.g. Tuesday, 27 January)
- Personalized greeting line
- One primary action
- One secondary escape action

### Copy
Greeting line:
- "[Time of day], [Name]." (e.g. "Good evening, Ben.")
- Time-of-day logic: Morning (5–12), Afternoon (12–17), Evening (17–21), Night (21–5)
- Fallback if no name set: "Good [time of day]."

Subtitle:
- "Take a moment for yourself"

Primary button:
- "Start"

Secondary action:
- "Later" (text button, no fill)

### Name Source
- Collected during onboarding (4th page: "What should we call you?")
- Editable in Settings under a "Profile" section

### Behaviour
- If user taps "Later", do not prompt again that day
- If user taps "Later", navigate to the Timeline tab
- This screen appears only once per day
- After dismissal, returning to the Today tab shows the mood selection screen (no repeat greeting)

---

## Screen 2: Mood Selection

### Purpose
Capture a simple emotional snapshot for the day.

### UI Elements
- Prompt text
- Five mood pills displayed in horizontal scroll
- Explicit "Next" button in bottom dock (disabled until mood selected)

### Prompt Copy
- "How does today feel, overall?"

### Mood Set
Left to right:
- Low
- Down
- Okay
- Happy
- Amazing

### Interaction
- Tap to select mood
- Selected mood:
  - Slight scale up
  - Higher contrast or subtle glow
  - Haptic feedback: `UISelectionFeedbackGenerator` (`.selection`)
- User taps "Next" to advance (explicit confirmation, not auto-advance)

### Notes
- Do not ask the same question again later
- This screen anchors the entry emotionally
- Explicit "Next" prevents accidental mis-taps on the horizontal scroller

---

## Screen 3: Daily Prompt

### Purpose
Gently guide reflection without overthinking.

### UI Elements
- Small helper text
- One open-ended question
- One primary action button
- One secondary "Back" button

### Helper Text
- "Just one question for today"

### Prompt Examples
- "What stayed with you today?"
- "Did anything surprise you today?"
- "Was there a moment you keep replaying?"

(Only one prompt shown per day — cached on first generation, reused for the full calendar day regardless of back/forward navigation)

### Primary Button
- "I'm ready"

### Secondary Button
- "Back" (returns to mood selection)

### Notes
- Avoid randomness language
- Prompts should feel intentional and calm

---

## Screen 4: Recording

### Purpose
Let the user speak freely with minimal distraction.

### UI Elements
- Recording timer
- Reactive waveform
- Large central stop button
- One destructive action in bottom dock

### Behaviour
- Recording starts when user taps "I'm ready" on Screen 3 (button-initiated, not auto-start)
- Waveform reacts clearly but calmly to voice
- Timer counts up
- Haptic feedback: `UIImpactFeedbackGenerator(style: .medium)` on recording start

### Button States
- Recording state:
  - Central button shows Stop
  - Optional red accent to signal active recording
  - Haptic feedback: `UINotificationFeedbackGenerator` (`.success`) on stop
- Destructive action in dock:
  - "Discard recording"

### Safeguards
- Tapping "Discard recording" shows `.confirmationDialog`:
  - Title: "Discard today's entry?"
  - Actions: "Discard" (destructive), "Keep recording" (cancel)
  - Haptic feedback: `UINotificationFeedbackGenerator` (`.warning`) on discard confirmation
- Losing a recording should never be easy or accidental

### Helper Text
Optional small line:
- "You can stop anytime"

### App Backgrounding
- If the app is backgrounded during recording: auto-stop and save the entry
- When the user returns, show Screen 5 (Playback and Close) with the auto-saved entry
- Observe `UIApplication.willResignActiveNotification` for this behaviour

---

## Screen 5: Playback and Close

### Purpose
Provide emotional closure and reassurance.

### UI Elements
- Audio playback control (reuse AudioPlaybackView)
- Entry metadata (date, mood pill)
- Transcript preview (read-only, max ~3 lines, expandable)
- Single closing action
- Haptic feedback: `UINotificationFeedbackGenerator` (`.success`) on entry to this screen

### Title Copy
- "Saved for today"
or
- "That's today"

### Transcript
- Read-only
- Preview only (max ~3 lines, "See more" if longer)
- No edit affordances
- Small note:
  - "Transcript saved automatically"
- If transcription fails: show "Transcript unavailable" (non-blocking)

### Final Action
- Button: "Done"

### Behaviour
- Returns user to home state
- Entry is locked and complete

---

## Data Rules

- One entry per local calendar day (user's device `Calendar.current`)
- Entry includes:
  - Date
  - Mood value (0–4)
  - Audio file (.m4a, stored in app documents directory)
  - Generated transcript (optional — nil if transcription fails)
- Entries are immutable after save
- No insights, summaries, or trends exposed yet
- Past-date entries are allowed via calendar view

### Edge Cases
- Midnight during recording: entry is saved with the date at recording start
- Discarded entry: user may re-record for the same date
- Force-quit during recording: recording is lost (acceptable trade-off)

---

## Microphone Permission Flow

- Request permission in context (when user first taps "I'm ready"), not during onboarding
- Flow:
  1. Check `AVAudioSession.sharedInstance().recordPermission`
  2. If `.undetermined`: show soft pre-permission alert ("Remin needs your microphone to record voice entries"), then trigger system prompt
  3. If `.granted`: proceed to recording
  4. If `.denied`: show inline message with "Open Settings" button linking to Settings app

### Required Info.plist Keys (add in Xcode Target → Info)
- `NSMicrophoneUsageDescription`: "Remin uses your microphone to record voice journal entries."
- `NSSpeechRecognitionUsageDescription`: "Remin uses speech recognition to transcribe your voice entries on-device."

---

## Transcription

- Use Apple Speech framework (`SFSpeechRecognizer`)
- Prefer on-device recognition (`supportsOnDeviceRecognition`, iOS 17+)
- Request speech recognition authorization separately from microphone permission
- Process the saved audio file after recording stops
- On failure: set transcript to `nil`, UI shows "Transcript unavailable"

---

## Design Notes for iOS Implementation

- Prefer spacing and layout over heavy typography changes
- Use Dynamic Type friendly layouts (`.relativeTo:` text styles, `@ScaledMetric`)
- Use haptics sparingly, only for:
  - Mood selection (`.selection`)
  - Recording start (`.impactMedium`)
  - Recording stop (`.notification(.success)`)
  - Discard confirmation (`.notification(.warning)`)
  - Save completion (`.notification(.success)`)
- Avoid alerts unless destructive
- Accessibility:
  - Add `.accessibilityLabel` to mood pills (e.g. "Mood: Okay")
  - Add `.accessibilityHint` to recording button ("Double tap to stop recording")
  - Ensure VoiceOver can navigate the mood scroll view meaningfully

---

## Error States

| Scenario | Behaviour |
|----------|-----------|
| Transcription fails | Show "Transcript unavailable" — non-blocking |
| Audio save fails | Show alert, allow retry |
| App backgrounded during recording | Auto-stop and save |
| Force-quit during recording | Recording lost (acceptable) |
| Microphone denied | Inline message + "Open Settings" button |

---

## Explicit Non-Goals (Do Not Build)

- No text journaling
- No editing transcripts
- No streaks or gamification
- No analytics language
- No multiple entries per day
- No insights UI yet

---

## Success Criteria

A tired user should be able to:
- Open the app
- Complete the entire flow
- Feel slightly lighter
- Finish in under 60 seconds

If the UI feels like it is asking for effort, it is wrong.

---

End of plan.
