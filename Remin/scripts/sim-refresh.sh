#!/usr/bin/env bash
set -euo pipefail

PROJECT="${XCODE_PROJECT:-BasicJournal.xcodeproj}"
SCHEME="${XCODE_SCHEME:-Remin}"
CONFIGURATION="${XCODE_CONFIGURATION:-Debug}"
DEVICE_NAME="${SIM_DEVICE_NAME:-iPhone 16}"
DERIVED_DATA_PATH="${DERIVED_DATA_PATH:-$HOME/Library/Developer/Xcode/DerivedData/Remin-sim-refresh}"
BUNDLE_ID="${APP_BUNDLE_ID:-}"
SIM_UDID="${SIM_UDID:-}"
CLEAN_BUILD=1

# Prefer full Xcode tools when installed, even if xcode-select points to CLT.
if [[ -z "${DEVELOPER_DIR:-}" && -d "/Applications/Xcode.app/Contents/Developer" ]]; then
  export DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer"
fi

usage() {
  cat <<'EOF'
Refresh a local iOS Simulator build, install, and relaunch the app.

Usage:
  scripts/sim-refresh.sh [options]

Options:
  --project <path>         Xcode project path (default: BasicJournal.xcodeproj)
  --scheme <name>          Xcode scheme (default: Remin)
  --config <name>          Build configuration (default: Debug)
  --device <name>          Simulator name if none booted (default: iPhone 16)
  --udid <udid>            Force a specific simulator UDID
  --bundle-id <id>         Override app bundle id
  --derived-data <path>    DerivedData path (default: ~/Library/.../Remin-sim-refresh)
  --no-clean               Build without clean
  --help                   Show this help

Environment overrides:
  XCODE_PROJECT, XCODE_SCHEME, XCODE_CONFIGURATION
  SIM_DEVICE_NAME, SIM_UDID, APP_BUNDLE_ID, DERIVED_DATA_PATH
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project)
      PROJECT="$2"
      shift 2
      ;;
    --scheme)
      SCHEME="$2"
      shift 2
      ;;
    --config)
      CONFIGURATION="$2"
      shift 2
      ;;
    --device)
      DEVICE_NAME="$2"
      shift 2
      ;;
    --udid)
      SIM_UDID="$2"
      shift 2
      ;;
    --bundle-id)
      BUNDLE_ID="$2"
      shift 2
      ;;
    --derived-data)
      DERIVED_DATA_PATH="$2"
      shift 2
      ;;
    --no-clean)
      CLEAN_BUILD=0
      shift
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage
      exit 1
      ;;
  esac
done

if [[ ! -d "$PROJECT" ]]; then
  echo "Project not found: $PROJECT" >&2
  exit 1
fi

if ! xcodebuild -version >/dev/null 2>&1; then
  echo "xcodebuild is unavailable for the current developer directory." >&2
  echo "Set full Xcode tools, then rerun:" >&2
  echo "  sudo xcode-select -s /Applications/Xcode.app/Contents/Developer" >&2
  exit 1
fi

if ! xcrun --find simctl >/dev/null 2>&1; then
  echo "simctl is unavailable. Ensure full Xcode is selected and iOS Simulator is installed." >&2
  exit 1
fi

mkdir -p "$DERIVED_DATA_PATH"

if [[ -z "$SIM_UDID" ]]; then
  BOOTED_UDID="$(
    xcrun simctl list devices booted \
      | sed -nE 's/.*\(([0-9A-F-]+)\) \(Booted\).*/\1/p' \
      | head -n 1
  )"
  if [[ -n "$BOOTED_UDID" ]]; then
    SIM_UDID="$BOOTED_UDID"
  else
    DEVICE_LINE="$(
      xcrun simctl list devices available \
        | grep -F "$DEVICE_NAME (" \
        | head -n 1 || true
    )"
    SIM_UDID="$(printf '%s\n' "$DEVICE_LINE" | sed -nE 's/.*\(([0-9A-F-]+)\).*/\1/p')"
  fi
fi

if [[ -z "$SIM_UDID" ]]; then
  echo "No matching simulator found. Boot one manually or pass --udid." >&2
  exit 1
fi

DESTINATION="platform=iOS Simulator,id=$SIM_UDID"

BUILD_SETTINGS="$(
  xcodebuild \
    -project "$PROJECT" \
    -scheme "$SCHEME" \
    -configuration "$CONFIGURATION" \
    -destination "$DESTINATION" \
    -derivedDataPath "$DERIVED_DATA_PATH" \
    -showBuildSettings
)"

if [[ -z "$BUNDLE_ID" ]]; then
  BUNDLE_ID="$(printf '%s\n' "$BUILD_SETTINGS" | awk -F' = ' '/PRODUCT_BUNDLE_IDENTIFIER/ { print $2; exit }')"
fi

TARGET_BUILD_DIR="$(printf '%s\n' "$BUILD_SETTINGS" | awk -F' = ' '/TARGET_BUILD_DIR/ { print $2; exit }')"
FULL_PRODUCT_NAME="$(printf '%s\n' "$BUILD_SETTINGS" | awk -F' = ' '/FULL_PRODUCT_NAME/ { print $2; exit }')"

if [[ -z "$BUNDLE_ID" ]]; then
  echo "Unable to determine bundle id. Pass --bundle-id." >&2
  exit 1
fi

if [[ -z "$TARGET_BUILD_DIR" || -z "$FULL_PRODUCT_NAME" ]]; then
  echo "Unable to determine app output path from build settings." >&2
  exit 1
fi

APP_PATH="$TARGET_BUILD_DIR/$FULL_PRODUCT_NAME"

echo "Using simulator: $SIM_UDID"
echo "Project: $PROJECT"
echo "Scheme: $SCHEME"
echo "Configuration: $CONFIGURATION"
echo "DerivedData: $DERIVED_DATA_PATH"
echo "Bundle ID: $BUNDLE_ID"

open -a Simulator >/dev/null 2>&1 || true
xcrun simctl boot "$SIM_UDID" >/dev/null 2>&1 || true
xcrun simctl bootstatus "$SIM_UDID" -b

BUILD_CMD=(
  xcodebuild
  -project "$PROJECT"
  -scheme "$SCHEME"
  -configuration "$CONFIGURATION"
  -destination "$DESTINATION"
  -derivedDataPath "$DERIVED_DATA_PATH"
)

if [[ "$CLEAN_BUILD" -eq 1 ]]; then
  "${BUILD_CMD[@]}" clean build
else
  "${BUILD_CMD[@]}" build
fi

if [[ ! -d "$APP_PATH" ]]; then
  APP_PATH="$(find "$DERIVED_DATA_PATH/Build/Products" -type d -name '*.app' -print | head -n 1)"
fi

if [[ -z "${APP_PATH:-}" || ! -d "$APP_PATH" ]]; then
  echo "Built app not found in DerivedData." >&2
  exit 1
fi

xcrun simctl terminate "$SIM_UDID" "$BUNDLE_ID" >/dev/null 2>&1 || true
xcrun simctl install "$SIM_UDID" "$APP_PATH"
xcrun simctl launch "$SIM_UDID" "$BUNDLE_ID"

echo "Refresh complete."
