# custom aliasses:
alias :q=exit
alias v=nvim

# brew
alias up="brew update&&brew upgrade"
  
# custom commands:
alias aliases="v ~/dotfiles/zsh/aliases.zsh"
alias so="source ~/.zshrc && echo '.zshrc sourced successfuly'"
alias notes="v ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/ObsidianVault"
alias vconf="v ~/dotfiles/config/nvim"
alias qt="open -a qutebrowser"
alias wttr="curl -s wttr.in/Tel%20Aviv"

# eza aliasses:
alias ls="eza --icons"
alias ll="eza -la --icons"
alias la="eza -a --icons"
alias ls1="eza --icons --oneline"

# dir paths aliasses:
alias nb="cd ~/code/personal"
alias dt="cd ~/dotfiles"

# git aliasses:
alias sc="lazygit"
alias ga='git add .'
alias gc='git commit'
alias gp='git pull'
alias gf='git fetch'
alias gP='git push'
alias gb='git checkout'
alias gbn='git checkout -b'
alias gm='git merge'
alias gl='git log --oneline'
alias gg='git log --graph --oneline'
alias gs='git status'

alias fm=y

# scripts aliasses:
alias work="~/scripts/work-programs.sh"

#tmux
alias t="~/scripts/tmux_script.sh"
alias tllm="~/scripts/tmux_llm_script.sh"
alias tls="tmux ls"
alias tk="tmux kill-session && echo session killed"

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

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
