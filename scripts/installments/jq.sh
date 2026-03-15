#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

uninstall_if_found jq

echo " Installing jq..."

if brew install jq; then 
  echo_ok " jq installation succeeded"

else
  echo_err "  jq did not install"
fi

