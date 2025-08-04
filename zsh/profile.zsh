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

export PYTHON=/opt/homebrew/opt/python@3.11/bin/python3
export CXXFLAGS="-I$(brew --prefix llvm)/include/c++/v1"
export LDFLAGS="-L$(brew --prefix llvm)/lib"

# export CGO_CXXFLAGS="~/Library/Containers/com.isaacmarovitz.Whisky/Bottles/12D0AF5A-05C1-4395-98BE-86168501731A/dosdevices/z:/opt/homebrew/include/leptonica ~/Library/Containers/com.isaacmarovitz.Whisky/Bottles/12D0AF5A-05C1-4395-98BE-86168501731A/dosdevices/z:/opt/homebrew/include/tesseract"
export CGO_CXXFLAGS="-I\"~/Library/Containers/com.isaacmarovitz.Whisky/Bottles/12D0AF5A-05C1-4395-98BE-86168501731A/dosdevices/z:/opt/homebrew/include/leptonica\""
export CGO_LDFLAGS="-L~/Library/Containers/com.isaacmarovitz.Whisky/Bottles/12D0AF5A-05C1-4395-98BE-86168501731A/dosdevices/z:/opt/homebrew/lib"

