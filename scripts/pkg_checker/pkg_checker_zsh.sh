#!/usr/bin/env zsh
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/pkgs_to_check.sh"

# Check for -l flag
local_mode=false
if [[ "$1" == "-l" ]]; then
  local_mode=true
fi

# Debug
echo "DEBUG: arg1='$1', local_mode=$local_mode"

typeset -A installed_map

get_global_pkgs() {
  npm ls -g --depth=0 --json | jq -r '.dependencies | to_entries[] | "\(.key)@\(.value.version)"'
}

get_local_pkgs() {
  npm ls --depth=0 --json | jq -r '.dependencies | to_entries[] | "\(.key)@\(.value.version)"'
}

if $local_mode; then
  echo "Checking local packages..."
  echo
  raw_pkgs_output=$(get_local_pkgs 2>&1)
else
  echo "Checking global packages..."
  echo
  raw_pkgs_output=$(get_global_pkgs 2>&1)
fi

# Debug: show if we got any output
if [[ -z "$raw_pkgs_output" ]]; then
  echo "Warning: No packages found or command failed"
fi

installed_pkgs=(${(f)raw_pkgs_output})

for entry in "${installed_pkgs[@]}"; do
  name="${entry%@*}"      
  ver="${entry##*@}"      
  installed_map[$name]="$ver"
done

for pkg in "${pkgs_to_check[@]}"; do 
  if (( ${+installed_map[$pkg]} )); then
    echo "✅ $pkg is installed (v${installed_map[$pkg]})"
  else
    echo "❌ $pkg is NOT installed"
  fi
done
