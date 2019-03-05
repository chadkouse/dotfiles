# Adds `~/.scripts` and all subdirectories to $PATH
export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':')"

export TERMINAL=tilix
export BROWSER=google-chrome-stable
export SUDO_ASKPASS="$HOME/.scripts/tools/dmenupass"

if [ -e ~/.secrets ]; then
  source ~/.secrets
fi

export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

