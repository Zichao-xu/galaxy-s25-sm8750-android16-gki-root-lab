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

