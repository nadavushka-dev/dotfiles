#!/bin/bash

# Check for Homebrew and install if it's not installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Ensure Homebrew is updated
echo "Updating Homebrew..."
brew update

