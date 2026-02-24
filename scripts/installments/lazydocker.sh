#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

uninstall_if_found lazydocker

echo " Installing lazydocker..."

if brew install lazydocker; then 
  echo_ok " lazydocker installation succeeded"

else
  echo_err "  lazydocker did not install"
fi

