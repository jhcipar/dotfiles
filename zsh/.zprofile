eval "$(/opt/homebrew/bin/brew shellenv)"
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

export PATH="$HOME/.local/scripts:$PATH"
export PATH="$HOME/go/bin/:$PATH"
