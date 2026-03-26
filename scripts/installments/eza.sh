#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"



uninstall_if_found eza

echo " Installing eza..."

if brew install eza; then 
  echo_ok " eza installation succeeded"

else
  echo_err "  eza did not install"
fi

