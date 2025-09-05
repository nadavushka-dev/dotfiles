. "$HOME/.cargo/env"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

. "$HOME/.local/bin/env"

[ -f "$HOME/.config/secrets/ai_keys.env" ] && export $(grep -vE '^\s*#' "$HOME/.config/secrets/ai_keys.env" | xargs)
