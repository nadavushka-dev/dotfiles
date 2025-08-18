#!/bin/bash

#variables
session="sesh"
window1="teminal"
window2="Obsidian"
window3="vimConf"
window4="aliases"

#paths
notes_path="$HOME/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/ObsidianVault"
vim_conf_path="$HOME/.config/nvim"
aliases_path="$HOME/dotfiles/zsh/aliases.zsh"

#commands
vObs="cd $notes_path && v"
vConf="cd $vim_conf_path && v"
vAliases="v $aliases_path"

SESSION_EXISTS=$(tmux list-sessions | grep -w $session)

if [ -z "$SESSION_EXISTS" ]; then
  tmux new-session -d -s "$session" -n "$window1" 

  tmux new-window -t "$session":2 -n "$window2"
  tmux send-keys -t "$window2" "$vObs" C-m

  tmux new-window -t "$session":3 -n "$window3"
  tmux send-keys -t "$window3" "$vConf" C-m

  tmux new-window -t "$session":4 -n "$window4"
  tmux send-keys -t "$window4" "$vAliases" C-m
fi

tmux attach-session -t "$session":1
