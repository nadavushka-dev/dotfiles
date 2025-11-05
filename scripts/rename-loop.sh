#!/bin/bash

# Check if a base name argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <base_name>"
  echo "Example: $0 foo"
  exit 1
fi

# Assign the first argument to a variable for clarity
BASE_NAME="$1"

# Initialize counter
i=1

echo "Renaming files in the current directory ('.') with base name '$BASE_NAME'..."

# Loop through all items in the current directory
for file in *; do
  # Check if it's a regular file (not a directory, symlink, etc.)
  # This also ignores the script itself if it's in the same directory.
  if [ -f "$file" ]; then
    # Get the file's extension
    # If the file is "my_doc.pdf", extension becomes "pdf"
    # If the file is "archive.tar.gz", extension becomes "gz" (after the last dot)
    extension="${file##*.}"

    # Determine the new name
    local_new_name="" # Use a local variable for the new name
    # Check if the original file had a dot (and thus potentially an extension)
    if [[ "$file" == *.* ]]; then
      # Construct new name with base, incremented number, and original extension
      local_new_name="${BASE_NAME}-${i}.${extension}"
    else
      # If no extension (e.g., "README"), just use base-number
      local_new_name="${BASE_NAME}-${i}"
    fi

    # Perform the rename
    # Adding -v for verbose output from mv (optional, but good for feedback)
    mv -v "$file" "$local_new_name"

    # Increment counter
    ((i++))
  fi
done

echo "--- Renaming complete! ---"
echo "A total of $((i-1)) files were renamed."
