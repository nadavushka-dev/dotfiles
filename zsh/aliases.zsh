# custom aliasses:
alias :q=exit
alias v=nvim
alias rss=newsboat
  
# custom commands:
alias aliases="v ~/dotfiles/zsh/aliases.zsh"
alias so="source ~/.zshrc && echo '.zshrc sourced successfuly'"
alias notes="v ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/ObsidianVault"
alias vconfig="v ~/dotfiles/config/nvim"
alias qute="open -a qutebrowser"

# eza aliasses:
alias ls="eza --icons"
alias ll="eza -la --icons"
alias la="eza -a --icons"
alias ls1="eza --icons --oneline"

# dir paths aliasses:
alias nb="cd ~/code/personal"
alias dt="cd ~/dotfiles"

# git aliasses:
alias lg="lazygit"
alias ga='git add .'
alias gc='git commit -m'
alias gp='git pull'
alias gf='git fetch'
alias gP='git push'
alias gb='git checkout'
alias gbn='git checkout -b'
alias gm='git merge'
alias gl='git log --oneline'
alias gg='git log --graph --oneline'

alias fm='yazi'

# scripts aliasses:
alias cypher='~/.scripts/cypher.sh'
alias work="~/.scripts/work-programs.sh"

fzfvi() {
  local fzfQ
  local fileName
  local initialQuery="$1"

  # Define the fzf command with options and an initial query if provided
  if [ -n "$initialQuery" ]; then
    fzfQ="fzf --height 40% --reverse --border=double --tmux --preview='head -10 {}' --exit-0 --query='$initialQuery'"
  else
    fzfQ="fzf --height 40% --reverse --border=double --tmux --preview='head -10 {}' --exit-0"
  fi
  
  # Get the selected file name from fzf
  fileName=$(eval $fzfQ)
  
  # Check if a file was selected
  if [ -n "$fileName" ]; then
    # Open the selected file in vi
    vi "$fileName"
  fi
}

# Create an alias for the function
alias ff="fzfvi"

