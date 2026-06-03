#!/usr/bin/env bash
set -euo pipefail

cat <<'BANNER'
================================================
 murtatz/setup  v1.0.0
 これから以下を実行します：
   1. Xcode Command Line Tools install
   2. Homebrew install
   3. brew install gh chezmoi
   4. Claude Code install
   5. gh auth login (ブラウザ)
   6. chezmoi init --apply murtatz/dotfiles (private)
 不審な場合は Ctrl-C を 5 秒以内に。
================================================
BANNER
sleep 5

# 1. Xcode CLT (idempotent, wait until done)
if ! xcode-select -p &>/dev/null; then
  xcode-select --install || true
  echo "→ Xcode CLT install ダイアログを承認してください（このまま待機します）"
  until xcode-select -p &>/dev/null; do
    printf "."
    sleep 30
  done
  echo " ✅ done"
fi

# 2. Homebrew
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# 3. Core CLIs
brew install gh chezmoi

# 4. Claude Code
if ! command -v claude &>/dev/null; then
  curl -fsSL https://claude.ai/install.sh | bash
fi

# 5. gh auth (interactive browser flow)
if ! gh auth status &>/dev/null; then
  gh auth login --hostname github.com --git-protocol https --web
fi

# 6. chezmoi init (HTTPS uses gh credential helper → private repo OK)
chezmoi init --apply --verbose murtatz/dotfiles

cat <<'NEXT'
================================================
 ✅ Bootstrap 完了。次のステップ：
    1. ターミナル再起動 (Apple Terminal を quit → iTerm 起動)
    2. claude を起動
    3. /setup-mac apply を実行
================================================
NEXT
