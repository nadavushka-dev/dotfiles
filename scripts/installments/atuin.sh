#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"



uninstall_if_found atuin

echo " Installing atuin..."

if brew install atuin; then 
  echo_ok " atuin installation succeeded"

else
  echo_err "  atuin did not install"
fi

