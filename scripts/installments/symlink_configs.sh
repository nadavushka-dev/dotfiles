#!/usr/bin/env bash

folders=()

# Loop through directories in the current path
for d in ~/dotfiles/config/*/; do
  # Remove the trailing slash and add to the array
  folders+=("${d%/}")
done


cd ~/.config/

current=$(pwd)
for dir in "${folders[@]}"; do
  dirname=$(basename $dir)
  ln -s $dir ./${dirname}
  echo "Created symlink for ${dir} in ${current}/${dirname}"
done
