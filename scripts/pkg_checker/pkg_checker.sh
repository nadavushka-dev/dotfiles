#!/usr/bin/env sh

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Detect which shell to use
if [ -n "$ZSH_VERSION" ]; then
  # Running in zsh
  exec zsh "$SCRIPT_DIR/pkg_checker_zsh.sh" "$@"
elif [ -n "$BASH_VERSION" ]; then
  # Running in bash
  exec bash "$SCRIPT_DIR/pkg_checker_bash.sh" "$@"
else
  # Try to detect shell from parent process or use bash as default
  if command -v bash >/dev/null 2>&1; then
    exec bash "$SCRIPT_DIR/pkg_checker_bash.sh" "$@"
  elif command -v zsh >/dev/null 2>&1; then
    exec zsh "$SCRIPT_DIR/pkg_checker_zsh.sh" "$@"
  else
    echo "Error: Neither bash nor zsh found on system"
    exit 1
  fi
fi
