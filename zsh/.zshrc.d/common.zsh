source ~/.zshrc.d/zsh_config.zsh

export EDITOR=vim
export VISUAL=vim
export BROWSER=/home/josip/.bin/brwsr
export GOPATH=~/code/go

# export XDG_CURRENT_DESKTOP=kde

export TERM="xterm-256color"

if [[ "$IS_PATH_SET" = "" ]]; then
  export PATH="$HOME/.bin:$PATH"
  export PATH="$PATH:$HOME/.npm/bin"
  export PATH="$PATH:$GOPATH/bin"
  export PATH="$PATH:./node_modules/.bin"
  export IS_PATH_SET=1
fi

if [[ "$SWAYSOCK" != "" ]]; then
  export QT_QPA_PLATFORM=wayland-egl
  export SDL_VIDEODRIVER=wayland
  export CLUTTER_BACKEND=wayland
fi


export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_DEFAULT_OPTS='-s --no-mouse --inline-info'

alias rg="rg -S"

alias setkbd="xset r rate 180 65 && setxkbmap -layout hr -variant us -option caps:escape"
alias ipy=ipython
alias py=python
alias py2=python2

alias dps="docker ps"
alias dk="docker kill"
alias drm="docker rm -f"
alias dim="docker images"
alias o="xdg-open"
alias open="xdg-open"
alias y="yay"
alias git='hub'
alias mosh='mosh --bind-server=any'
alias ti='tig --all'

alias vimt='vipe < /dev/null'

alias scu='systemctl --user'
alias sc='sudo systemctl'

function search_and_replace () {
  if [[ -z "$2" ]] || [[ -z "$2" ]]; then
    echo "Usage: search_and_replace TERM_TO_REPLACE TERM_TO_REPLACE_WITH"
    return 1
  fi
  rg "$1" -l | xargs sed -E -i "s|$1|$2|g"
}

export MOZ_USE_XINPUT2=1 # firefox smooth scroll
