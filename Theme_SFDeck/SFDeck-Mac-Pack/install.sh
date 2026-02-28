#!/usr/bin/env bash
set -euo pipefail

TARGET_BASE="$HOME/Library/Application Support/Ulanzi/UlanziDeck"
SOURCE_BASE="$(cd "$(dirname "$0")" && pwd)"

if [ ! -d "$TARGET_BASE" ]; then
  echo "Ulanzi Deck data folder not found: $TARGET_BASE"
  exit 1
fi

# Backup do estado atual do usuário antes de aplicar
TS="$(date +%Y%m%d-%H%M%S)"
BK_DIR="$TARGET_BASE/backups/sfdeck-mac-install-$TS"
mkdir -p "$BK_DIR"

if [ -d "$TARGET_BASE/System" ]; then
  cp -R "$TARGET_BASE/System" "$BK_DIR/System"
fi

rm -rf "$TARGET_BASE/System"
cp -R "$SOURCE_BASE/System" "$TARGET_BASE/System"

mkdir -p "$TARGET_BASE/ProfilesV2"

# Merge de profiles: adiciona apenas os que ainda não existem no usuário.
ADDED=0
SKIPPED=0
if [ -d "$SOURCE_BASE/ProfilesV2" ]; then
  for src_profile in "$SOURCE_BASE"/ProfilesV2/*.ulanziProfile; do
    [ -e "$src_profile" ] || continue
    name="$(basename "$src_profile")"
    dst_profile="$TARGET_BASE/ProfilesV2/$name"
    if [ -d "$dst_profile" ]; then
      SKIPPED=$((SKIPPED + 1))
      continue
    fi
    cp -R "$src_profile" "$dst_profile"
    ADDED=$((ADDED + 1))
  done
fi

echo "SF Deck Mac pack installed."
echo "Backup: $BK_DIR"
echo "Profiles added: $ADDED | skipped (already existed): $SKIPPED"
