#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

scripts=(
    "packageManager.sh"
    "wezterm.sh"
    "fzf.sh"
    "eza.sh"
    "bat.sh"
    "nvm.sh"
    "go.sh"
    "zoxide.sh"
    "nvim.sh"
    "tmux.sh"
    "btop.sh"
    "tldr.sh"
    "mailsy.sh"
    "atuin.sh"
    "jq.sh"
    "lazydocker.sh"
    "lazygit.sh"
    "glow.sh"
    "raycast.sh"
    "aerospace.sh"
    "whatsapp.sh
    "chrome.sh
    "spotify.sh
)

for script in "${scripts[@]}"; do
    if [[ -f "$SCRIPT_DIR/$script" ]]; then
        echo "Installing $(basename "$script" .sh)..."
        source "$SCRIPT_DIR/$script"
    else
        echo "Warning: $script not found"
    fi
done
