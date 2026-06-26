#!/usr/bin/env bash
set -euo pipefail

ZIP_PATH="${1:-/Users/adams/Downloads/SM-S937B_16_Opensource.zip}"
OUT_DIR="${2:-/Users/adams/Documents/New project/s937b_android16_src_inspect}"
KERNEL_OUT="${3:-/Users/adams/Documents/New project/s937b-android16-gki-resukisu}"

rm -rf "$OUT_DIR" "$KERNEL_OUT"
mkdir -p "$OUT_DIR" "$KERNEL_OUT"

unzip -q "$ZIP_PATH" -d "$OUT_DIR"
tar -xzf "$OUT_DIR/Kernel.tar.gz" -C "$KERNEL_OUT"

echo "Extracted Samsung package to: $OUT_DIR"
echo "Extracted kernel source to: $KERNEL_OUT"

