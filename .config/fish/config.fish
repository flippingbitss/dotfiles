# Path
export ANDROID_HOME="$HOME/dev/tools/android/sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export LOCAL_BIN="$HOME/.local/bin"

fish_add_path "$HOME/dev/tools/flutter/bin"
fish_add_path "$LOCAL_BIN"
fish_add_path "$ANDROID_HOME/tools/bin"
fish_add_path "$ANDROID_HOME/emulator"
fish_add_path "$HOME/.cargo/bin/"
fish_add_path "$HOME/.bun/bin/"
# UI Scaling
#export GDK_DPI_SCALE=1.5

abbr -a gs 'git status'


if command -v exa > /dev/null
	abbr -a l 'exa'
	abbr -a ls 'exa'
	abbr -a ll 'exa -l'
	abbr -a lll 'exa -la'
else
	abbr -a l 'ls'
	abbr -a ll 'ls -l'
	abbr -a lll 'ls -la'
end

# Dotfiles repo
alias dotfiles "git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME"

# Base16 Shell
if status --is-interactive
#    set BASE16_SHELL "$HOME/.config/base16-shell/"
#    source "$BASE16_SHELL/profile_helper.fish"
end

if set -q NVIM
    fish_default_key_bindings
end

# opam configuration
source /home/matharu/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
zoxide init fish | source
