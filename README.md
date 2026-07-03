# murtatz/setup

Public bootstrap entry point for setting up a fresh Mac to mirror murtatz's
personal-mac environment. Pulls the actual config from the private repo
[murtatz/dotfiles](https://github.com/murtatz/dotfiles).

## Quick start

**One-line shortcut (self-responsibility):**

```bash
curl -fsSL https://raw.githubusercontent.com/murtatz/setup/v1.0.1/install.sh | bash
```

**Recommended (review before exec):**

```bash
curl -fsSL -o install.sh https://raw.githubusercontent.com/murtatz/setup/v1.0.1/install.sh
shasum -a 256 install.sh   # verify against published hash below
less install.sh            # eyeball
bash install.sh
```

**Published SHA256 (v1.0.1)**: `88c15e4025eaad29029bf1f2859b26553f174d48e7f16a365a9c7548eadbf9fa`

## What it does

`install.sh` performs the following on macOS:

1. Xcode Command Line Tools install (waits until done)
2. Homebrew install
3. `brew install gh chezmoi`
4. Claude Code install
5. `gh auth login` (browser-based OAuth)
6. `chezmoi init --apply murtatz/dotfiles`

After completion: open `claude` and run `/setup-mac apply` for the rest of setup
(brew bundle, runtimes, Claude Code plugins, `products-sync clone`, skill symlinks,
memory seed, doctor).

**Full reproduction guide** — repos, the `~/.claude/skills` symlink farm, and
work/company-machine caveats — lives in `INSTALL.md` inside the private
`murtatz/dotfiles` repo (kept private because it documents personal-account and
1Password specifics).

## Hardening

- Pinned to release tag, not `main` (URL above uses `v1.0.1`)
- All commits to `main` are signed and require PR review
- Branch protection enforced
- 5-second banner with cancellation window before any action
- Script is ≤80 lines for visual reviewability

## Do not put secrets here

This repo is public. The actual config lives in `murtatz/dotfiles` (private).
Secrets stay in 1Password (SSH agent + `op run` for runtime).
