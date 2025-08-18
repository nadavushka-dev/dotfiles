#!/bin/bash

#variables
session="llm"
window1="teminal"
window2="ollama"

#paths
project_path="$HOME/code/personal/llm/first_rag/"

#commands
vLlm="cd $project_path && v"

SESSION_EXISTS=$(tmux list-sessions | grep -w $session)

if [ -z "$SESSION_EXISTS" ]; then
  tmux new-session -d -s "$session" -n "$window1" 
  tmux send-keys -t "$window1" "$vLlm" C-m

  tmux new-window -t "$session":2 -n "$window2"
  tmux send-keys -t "$window2" "ollama serve" C-m

fi

tmux attach-session -t "$session":1
