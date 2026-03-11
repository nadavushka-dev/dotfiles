#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

scripts=(
    "packageManager.sh"
    "wezterm.sh"
    "fzf.sh"
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
    # "kitty.sh"
    # "yazi.sh"
)

for script in "${scripts[@]}"; do
    if [[ -f "$SCRIPT_DIR/$script" ]]; then
        echo "Installing $(basename "$script" .sh)..."
        source "$SCRIPT_DIR/$script"
    else
        echo "Warning: $script not found"
    fi
done
