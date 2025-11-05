# pkg_checker Project Guidelines

## Commands
- **Run main script**: `./pkg_checker.sh` or `zsh pkg_checker.sh`
- **Test npm command**: `./cmd.sh` or `sh cmd.sh`
- **Make executable**: `chmod +x pkg_checker.sh cmd.sh`
- **Lint shell scripts**: `shellcheck *.sh`

## Code Style - Shell Scripts
- Use `#!/bin/zsh` for zsh scripts, `#!/bin/bash` for bash compatibility
- Indent with 2 spaces, no tabs
- Use lowercase with underscores for variable names: `pkg_name`, `installed_pkgs`
- Use UPPERCASE for constants/arrays at file level: `pkgs_to_check`
- Quote variables: `"$var"` not `$var`
- Use `$()` for command substitution, not backticks
- Array syntax: `arr=(item1 item2)` for declaration, `"${arr[@]}"` for expansion

## Zsh-Specific Patterns
- Associative arrays: `typeset -A map_name`
- Array splitting: `(${(f)var})` splits on newlines
- Existence check: `(( ${+map[$key]} ))` for associative array keys
- Parameter expansion: `${var%pattern}` (remove suffix), `${var##pattern}` (remove prefix)

## Error Handling
- Check command success: `if ! command; then handle_error; fi`
- Use `set -e` for scripts that should exit on error
- Validate dependencies exist before use (e.g., check for `npm`, `jq`)

## Project Structure
- `pkg_checker.sh`: Main script checking global npm packages
- `cmd.sh`: Helper script for npm/jq command
- Keep scripts modular and focused on single responsibility