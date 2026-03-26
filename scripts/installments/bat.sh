#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"



uninstall_if_found bat

echo " Installing bat..."

if brew install bat; then 
  echo_ok " bat installation succeeded"

else
  echo_err "  bat did not install"
fi

