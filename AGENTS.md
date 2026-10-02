# AGENTS.md - device/apple/snowcastle

Agents must read this file before touching anything in this repository.

Part of the mainline repository set. Map of all repos: `vendor/mainline/docs/REPOSITORIES.md`.

Device tree for Apple devices running HoolockLinux based kernels,
booted through m1n1. Never include Apple firmware in builds or
commits.

## Read first

| Task | Read |
|------|------|
| Anything about bringup, kernel, boot, init, SELinux | `device/mainline/common/docs/README.md` |
| Commits, style, review | `hardware/mainline/common/docs/` |
| Bootloader and install steps | `README.md` |

## Hard rules

- Do not build, flash or run tests; the human does and reports back.
- Do not search from the AOSP tree root; use precise directories.
- Keep device specific values here. Things that apply to more devices
  belong in the common trees (ask first).
- Do not copy the shared kernel patch table into the README; link to
  `device/mainline/common/docs/KERNEL_PATCHES.md`.
- Do not add firmware or proprietary files.
