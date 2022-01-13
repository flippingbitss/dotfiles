# Path
export ANDROID_HOME="$HOME/dev/tools/android/sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export LOCAL_BIN="$HOME/.local/bin"

export PATH="$PATH:$HOME/dev/tools/flutter/bin"
export PATH="$PATH:$LOCAL_BIN"
export PATH="$PATH:$ANDROID_HOME/tools/bin:$ANDROID_HOME/emulator"

# UI Scaling
#export GDK_DPI_SCALE=1.5

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


