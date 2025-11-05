export EDITOR="nvim"
bindkey -v
#
# Function to set cursor shape
function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]] ; then
    # Normal mode: steady block
    echo -ne '\033[2 q'
  else
    # Insert mode (main/viins): blinking bar
    echo -ne '\033[5 q'
  fi
}
zle -N zle-keymap-select

# Also fix cursor shape at shell startup
function zle-line-init {
  zle -K viins
  echo -ne '\033[5 q'   # blinking bar at start
}
zle -N zle-line-init

# Ensure cursor resets on exit
function reset-cursor-shape {
  echo -ne '\033[0 q'
}
preexec() { reset-cursor-shape }

