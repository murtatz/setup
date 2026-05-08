# murtatz/setup

Public bootstrap entry point for setting up a fresh Mac to mirror murtatz's
personal-mac environment. Pulls the actual config from the private repo
[murtatz/dotfiles](https://github.com/murtatz/dotfiles).

## Quick start

**One-line shortcut (self-responsibility):**

```bash
curl -fsSL https://raw.githubusercontent.com/murtatz/setup/v1.0.0/install.sh | bash
```

**Recommended (review before exec):**

```bash
curl -fsSL -o install.sh https://raw.githubusercontent.com/murtatz/setup/v1.0.0/install.sh
shasum -a 256 install.sh   # verify against published hash below
less install.sh            # eyeball
bash install.sh
```

**Published SHA256 (v1.0.0)**: `c8bca98d10bd770c2439ee8004d3e28728044b13819ddf20cc4543faeb136c65`

## What it does

`install.sh` performs the following on macOS:

1. Xcode Command Line Tools install (waits until done)
2. Homebrew install
3. `brew install gh chezmoi`
4. Claude Code install
5. `gh auth login` (browser-based OAuth)
6. `chezmoi init --apply tatsuma/dotfiles`

After completion: open `claude` and run `/setup-mac apply` for the rest of setup.

## Hardening

- Pinned to release tag, not `main` (URL above uses `v1.0.0`)
- All commits to `main` are signed and require PR review
- Branch protection enforced
- 5-second banner with cancellation window before any action
- Script is ≤80 lines for visual reviewability

## Do not put secrets here

This repo is public. The actual config lives in `tatsuma/dotfiles` (private).
Secrets stay in 1Password (SSH agent + `op run` for runtime).
