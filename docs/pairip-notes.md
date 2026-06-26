# PairIP Notes

This project exists because multiple PairIP protected apps crash under the
current built-in root kernel environment.

Known crash signature:

- Native crash in `libpairipcore.so`
- Seen in at least:
  - `com.openai.chatgpt`
  - `com.twitter.android`

Prior local experiments that did not solve the issue:

- Hiding `/data/adb` and KernelSU paths with SuSFS
- Adding `sus_map`
- Disabling `auto_try_umount`
- Disabling `kernel_umount`
- Disabling `su_compat`
- Disabling the root manager package
- Disabling SuSFS logging

Useful external clues:

- Some public reports connect `libpairipcore.so` SIGSEGV with KernelSU/SuSFS
  mount interactions.
- LKM mode working locally suggests Android itself and the apps are not the root
  cause.
- Built-in root behavior is the primary suspect.


## Candidate Root Implementations

Current preferred test order:

1. Stock Samsung Android 16 kernel build with no root.
2. Minimal KernelSU Next built-in root, without SuSFS or extra patches.
3. Add SuSFS only if the minimal built-in root build passes PairIP apps.
4. Use ReSukiSU / SukiSU Ultra as follow-up candidates, not as mandatory base.
5. Keep APatch as an alternate root-family experiment if KernelSU-family built-in
   root cannot pass PairIP reliably.

ReSukiSU and Kokuban remain useful references for CI, Samsung packaging,
AnyKernel flow, SuSFS patches, and S25-specific integration details.
