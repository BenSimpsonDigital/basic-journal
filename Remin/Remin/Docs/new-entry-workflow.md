# Daily Check-In Flow (iOS)

Purpose:
Build a calm, once-per-day voice check-in flow that feels conversational and low-pressure.

## Core Rules

- One entry per local calendar day
- Voice-only capture
- Transcript is read-only
- No mood selection in any part of the app
- Past-date entries are allowed from calendar history

## Final User Flow

1. Greeting + suggested prompt (once per day)
2. Recording
3. Playback and close

### Today Flow

- If no entry exists for today and the user has not seen the prompt today:
  - Show greeting (`Good morning` / `Good afternoon` / `Good evening`)
  - Show `Suggested prompt` and the cached daily prompt text
  - `Continue` starts recording immediately
  - `Later` dismisses for that day and navigates to timeline/history
- If no entry exists for today and prompt was already dismissed:
  - Show ready-to-record screen (`recordPrompt`)
  - `Start recording` begins recording

### Past-Date Flow

- User taps a day with no entry in calendar history
- App sets pending date and opens ready-to-record (`recordPrompt`)
- No suggested prompt is shown for past dates
- Recording saves entry for the selected date

## Flow State Machine

`startingPrompt -> recording -> saved -> recordPrompt`

Fallback state:
- `recordPrompt` is used for:
  - today after `Later`
  - past-date entry starts
  - post-save reset

## History / Calendar

- Calendar no longer uses mood colors
- Day cells use neutral styling
- A small dot indicates that a recording exists for that date
- Tapping an existing-entry day opens entry detail
- Tapping an empty day starts entry creation for that date

## Entry Metadata

- No mood metadata anywhere
- Entry cards and saved states show time/date only

## Error Handling

- If transcription fails: show `Transcript unavailable`
- If app backgrounds during recording: auto-stop and save
- Discard actions remain confirmation-gated

## Non-Goals

- No mood tracking
- No transcript editing
- No streak/gamification features
