#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/pkgs_to_check.sh"

# Check for -l flag
local_mode=false
if [[ "$1" == "-l" ]]; then
  local_mode=true
fi

get_global_pkgs() {
  npm ls -g --depth=0 --json | jq -r '.dependencies | to_entries[] | "\(.key)@\(.value.version)"'
}

get_local_pkgs() {
  npm ls --depth=0 --json | jq -r '.dependencies | to_entries[] | "\(.key)@\(.value.version)"'
}

if $local_mode; then
  echo "Checking local packages..."
  echo
  raw_pkgs_output=$(get_local_pkgs)
else
  echo "Checking global packages..."
  echo
  raw_pkgs_output=$(get_global_pkgs)
fi

# Convert string to array in bash
IFS=$'\n'
installed_pkgs=($raw_pkgs_output)
unset IFS

for pkg in "${pkgs_to_check[@]}"; do 
  found=false
  for entry in "${installed_pkgs[@]}"; do
    name="${entry%@*}"
    if [[ "$name" == "$pkg" ]]; then
      ver="${entry##*@}"
      echo "✅ $pkg is installed (v${ver})"
      found=true
      break
    fi
  done
  if ! $found; then
    echo "❌ $pkg is NOT installed"
  fi
done
