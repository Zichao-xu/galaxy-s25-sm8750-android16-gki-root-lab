# Galaxy S25 SM8750 Android 16 GKI Root Lab

Experimental Samsung Galaxy S25 series / SM8750 Android 16 GKI kernel workspace. Current test device: SM-S937B.


The goal is to build a clean Android 16 based kernel path for root
experiments, instead of continuing to patch an Android 15 / 6.6.77 base on an
Android 16 system.

## Device Baseline

- Device family: Samsung Galaxy S25 series / SM8750
- Current test device: Samsung SM-S937B
- Current firmware family: Android 16 / OneUI 8.x
- Samsung open source package: `SM-S937B_16_Opensource.zip`
- Matched Samsung source row:
  - `S937BXXU7CZDP`
  - `S937BXXS7CZE1`

## Current Problem

PairIP protected apps crash in `libpairipcore.so` under built-in
built-in GKI root, while LKM mode works.

Observed facts:

- LKM mode works.
- Built-in ReSukiSU mode crashes.
- Crashes occur even without user modules.
- ChatGPT and X both crash in `libpairipcore.so`.
- Aggressive SuSFS hiding did not fix the crash.

Working hypothesis:

- The issue is likely a built-in root/kernel behavior difference, not a simple
  app compatibility issue.
- The old Android 15 / 6.6.77 base may be too far from the Android 16 stock
  kernel environment.

## Strategy

1. Preserve the exact Samsung Android 16 source package metadata.
2. Reproduce a clean stock build path from Samsung source.
3. Add a minimal root integration.
4. Test PairIP apps before adding SuSFS or additional patches.
5. Add SuSFS only after the minimal built-in root build is proven.

## Source Handling

The full Samsung source package is large and is not committed directly in this
initial repository skeleton. See `docs/source-package.md` for checksums and
local extraction paths.

