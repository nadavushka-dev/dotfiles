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

# Install btop using Homebrew
echo "Installing btop..."
brew install btop

# Install fzf using Homebrew
echo "Installing fzf..."
brew install fzf

# Install yazi using Homebrew
echo "Installing yazi..."
brew install yazi

# Install kitty using Homebrew
echo "Installing kitty..."
brew install --cask kitty

# Install raycast using Homebrew
echo "Installing raycast..."
brew install --cask raycast

# Install thefuck using Homebrew
echo "Installing thefuck..."
brew install thefuck

# Install tldr using Homebrew
echo "Installing tldr..."
brew install tldr

# Install gpg using Homebrew
echo "Installing gpg..."
brew install gpg

echo "Installation complete. try it out."
