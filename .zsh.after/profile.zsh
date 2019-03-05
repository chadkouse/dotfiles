# Adds `~/.scripts` and all subdirectories to $PATH
export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':')"

[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

export TERMINAL=tilix
export BROWSER=google-chrome-stable
export SUDO_ASKPASS="$HOME/.scripts/tools/dmenupass"



if [ -e ~/.secrets ]; then
  source ~/.secrets
fi

setxkbmap us -variant colemak

# caps locks to escape
xmodmap -e "clear lock"
xmodmap -e "keycode 66 = Escape NoSymbol Escape"

# set keyboard repeat delay / rate
xset r rate 200 35
