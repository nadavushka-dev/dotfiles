#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

uninstall_if_found zoxide

echo " Installing zoxide..."

if brew install zoxide; then 
  echo_ok " zoxide installation succeeded"

else
  echo_err "  zoxide did not install"
fi

