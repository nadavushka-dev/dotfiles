# custom aliasses:
alias e=exit
alias v=nvim
alias lg="lazygit"
alias ll="ls -la -G"
alias la="ls -a -G"
alias ls="ls -G"

# dir paths aliasses:
alias nb="cd ~/code/personal"
alias dt="cd ~/dotfiles"

# git aliasses:
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

