#!/usr/bin/env bash
# Zips each skill into dist/<skill>.zip for upload to the Claude app (Settings → Capabilities → Skills).
set -euo pipefail
cd "$(dirname "$0")/.."
rm -rf dist && mkdir -p dist
for d in plugins/*/skills/*/; do
  name=$(basename "$d"); parent=$(dirname "$d")
  (cd "$parent" && zip -qr "../../../dist/$name.zip" "$name" -x '*.DS_Store')
done
ls -1 dist
