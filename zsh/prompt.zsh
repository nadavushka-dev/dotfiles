function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1] > /p'
}

COLOR_DEF=$'%f'
COLOR_DIR=$'%F{214}'      # Gruvbox yellow
COLOR_GIT=$'%F{109}'      # Gruvbox muted blue  
COLOR_USER=$'%F{175}'     # Gruvbox purple
COLOR_SEP=$'%F{246}'      # Gruvbox gray
COLOR_PROMPT=$'%F{108}'   # Gruvbox green

setopt PROMPT_SUBST
export PROMPT='${COLOR_USER}%n${COLOR_SEP}@${COLOR_DIR}%~ ${COLOR_PROMPT}>${COLOR_GIT} $(parse_git_branch)${COLOR_DEF}'
