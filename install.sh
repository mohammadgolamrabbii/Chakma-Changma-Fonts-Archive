#!/usr/bin/env bash
# Open Typography Foundation - Chakma (Ajhā Pāṭh) Font Installer
set -e

DEST_DIR="$HOME/.local/share/fonts/opentypography/Chakma-Changma-Fonts-Archive"
if [[ "$OSTYPE" == "darwin"* ]]; then
  DEST_DIR="$HOME/Library/Fonts/Chakma-Changma-Fonts-Archive"
fi

mkdir -p "$DEST_DIR"
echo "Installing 2+ Chakma (Ajhā Pāṭh) fonts to $DEST_DIR..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
find "$SCRIPT_DIR" -maxdepth 1 -type f \( -name "*.ttf" -o -name "*.otf" \) -exec cp -v {} "$DEST_DIR/" \;

if command -v fc-cache >/dev/null 2>&1; then
  fc-cache -fv "$DEST_DIR"
fi

echo "Successfully installed Chakma (Ajhā Pāṭh) fonts!"
