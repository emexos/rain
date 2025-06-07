#!/usr/bin/env bash
set -e

REPO="emexos/rain"
RAW_BASE="https://raw.githubusercontent.com/$REPO/main"
TMP_BIN="./rain"
TARGET="/usr/local/bin/rain"

confirm() {
  read -p "$1 [y/N] " yn
  case "$yn" in
    [Yy]*) return 0 ;;
    *) echo "[x] Aborted"; exit 1 ;;
  esac
}

echo "-=======================================-"
echo " -> Install 'rain' to $TARGET"
confirm "   Proceed with installation to $TARGET?"
confirm "   Are you absolutely sure this is the correct target directory?"

if [ -f "$TARGET" ]; then
  confirm "  'rain' already exists at $TARGET. Overwrite?"
fi

curl -fsSL "$RAW_BASE/rain" -o "$TMP_BIN"
if [ ! -f "$TMP_BIN" ]; then
  echo "-> Error: download failed."
  exit 1
fi

echo "-----------------------"
echo " -> chmod +x $TMP_BIN..."
chmod +x "$TMP_BIN"
echo "\n"

echo "------------------------------------------"
echo " -> move $TMP_BIN to $TARGET..."
sudo mv "$TMP_BIN" "$TARGET"
echo "\n"

echo " -> Finish - start the programm with "rain""
