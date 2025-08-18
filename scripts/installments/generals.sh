#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"


# Install fzf using Homebrew
uninstall_if_found fzf
echo "Installing fzf..."
brew install fzf

# Install tldr using Homebrew
uninstall_if_found tldr
echo "Installing tldr..."
brew install tldr
