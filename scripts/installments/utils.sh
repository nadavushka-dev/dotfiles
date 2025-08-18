echo_err() {
  local text="$1"
  echo -e "\033[31m$text\033[0m"
}

echo_warn() {
  local text="$1"
echo -e "\033[33m$text\033[0m"
}

echo_ok() {
  local text="$1"
  echo -e "\033[32m$text\033[0m"
}

symlink_with_dirs() {
  local source="$1"
  local destination="$2"
  
  if [[ ! -e "$source" ]]; then
    echo_err "Symlink source does not exist: $source"
    return 1
  fi
  
  # Handle existing destination
  if [[ -e "$destination" ]]; then
    if [[ -L "$destination" ]]; then
      echo_warn "Removing existing symlink: $destination"
      rm "$destination"
    elif [[ -d "$destination" ]]; then
      echo_err "Destination is a directory: $destination"
      echo_err "Please remove manually or backup first"
      return 1
    else
      echo_err "Destination exists: $destination"
      return 1
    fi
  fi
  
  mkdir -p "$(dirname "$destination")"
  ln -s "$source" "$destination"
  echo_ok "Created symlink: $destination -> $source"
}

uninstall_if_found() {
  local name="$1"
  if command -v "$name" $> /dev/null; then
    echo " unInstalling previous "$name"..."
    brew uninstall "$name"
  fi
}

