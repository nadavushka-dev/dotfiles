#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

scripts=(
    "packageManager.sh"
    # "kitty.sh"
    "wezterm.sh"
    "nvim.sh"
    "tmux.sh"
    "raycast.sh"
    "btop.sh"
    "aerospace.sh"
    "yazi.sh"
    "general.sh"
)

for script in "${scripts[@]}"; do
    if [[ -f "$SCRIPT_DIR/$script" ]]; then
        echo "Installing $(basename "$script" .sh)..."
        source "$SCRIPT_DIR/$script"
    else
        echo "Warning: $script not found"
    fi
done
