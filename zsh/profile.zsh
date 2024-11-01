eval "$(/opt/homebrew/bin/brew shellenv)"
eval $(thefuck --alias)

source <(fzf --zsh)

export ANDROID_SDK_ROOT=/Users/Nadavushka/Library/Android/sdk
export ANDROID_HOME=$HOME/Library/Android/sdk

export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export PATH=$PATH:$ANDROID_SDK_ROOT/tools
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin

export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

export NVM_DIR=~/.nvm
export JAVA_HOME=$(/usr/libexec/java_home)

source $(brew --prefix nvm)/nvm.sh
