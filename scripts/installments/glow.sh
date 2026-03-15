#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

uninstall_if_found glow

echo " Installing glow..."

if brew install glow; then 
  echo_ok " glow installation succeeded"

else
  echo_err "  glow did not install"
fi

