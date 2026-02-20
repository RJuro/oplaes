#!/usr/bin/env bash
set -euo pipefail

MACOS_DIR="app/src-tauri/target/release/bundle/macos"
TAURI_CONF="app/src-tauri/tauri.conf.json"

detect_latest_app() {
  ls -td "$MACOS_DIR"/*.app 2>/dev/null | head -n 1 || true
}

detect_version() {
  if [[ -f "$TAURI_CONF" ]]; then
    grep -m1 '"version"' "$TAURI_CONF" \
      | sed -E 's/.*"version"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/'
  else
    echo "0.1.0"
  fi
}

DEFAULT_APP_PATH="$(detect_latest_app || true)"
if [[ -z "${DEFAULT_APP_PATH:-}" ]]; then
  DEFAULT_APP_PATH="$MACOS_DIR/OpLæs.app"
fi

APP_PATH="${1:-$DEFAULT_APP_PATH}"
APP_VERSION="$(detect_version)"
OUT_DMG="${2:-app/src-tauri/target/release/bundle/dmg/OpLaes-${APP_VERSION}-aarch64.dmg}"
VOLNAME="${3:-OpLæs}"

if [[ ! -d "$APP_PATH" ]]; then
  echo "App bundle not found: $APP_PATH" >&2
  echo "Build first: npm run tauri -- build --bundles app" >&2
  exit 1
fi

mkdir -p "$(dirname "$OUT_DMG")"
STAGE_DIR="$(mktemp -d "${TMPDIR:-/tmp}/oplaes-dmg.XXXXXX")"
trap 'rm -rf "$STAGE_DIR"' EXIT

cp -R "$APP_PATH" "$STAGE_DIR/"

# Strip any ad-hoc signature so the app is cleanly unsigned.
# A broken/partial signature triggers "is damaged and can't be opened".
# A cleanly unsigned app triggers "unidentified developer" which users
# can bypass via Right-click → Open.
APP_NAME="$(basename "$APP_PATH")"
codesign --remove-signature --deep "$STAGE_DIR/$APP_NAME" 2>/dev/null || true

ln -s /Applications "$STAGE_DIR/Applications"

hdiutil create \
  -volname "$VOLNAME" \
  -srcfolder "$STAGE_DIR" \
  -ov \
  -format UDZO \
  "$OUT_DMG"

echo "Created DMG: $OUT_DMG"
