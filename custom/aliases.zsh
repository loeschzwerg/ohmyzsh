# $ZSH_CUSTOM/aliases.zsh

# For a full list of active aliases, run `alias -L`.

if command -p tty --silent ; then
    echo ". $0: $*"
fi

alias e='$EDITOR'
alias f="file -b"
alias o="xdg-open"
alias s="stat"

alias zshconfig='$EDITOR $ZDOTDIR/.zshrc'
alias omzconfig='$EDITOR $ZSH'
alias tmuxconfig='$EDITOR $TMUX_CONF'
alias sshconfig='$EDITOR ~/.ssh/config'

if [[ $TERM == "xterm-kitty" ]]; then
    alias ssh='kitten ssh' # alias kssh="kitten ssh"
    alias kask="kitten ask"
    alias kclip="kitten clipboard"
    alias kdiff="kitten diff"
    alias kfiles="kitten choose-files"
    alias kfonts="kitten choose-fonts"
    alias knotify="kitten notify"

    alias kittyconfig='$EDITOR $XDG_CONFIG_HOME/kitty/kitty.conf'
fi

# history
# ~/.config/oh-my-zsh/plugins/history/
alias h='history'
alias hl='history | less'
alias hs='history | grep'
alias hsi='history | grep -i'

if command -pv lsd &>/dev/null; then
    alias ls="lsd"
    alias lstree="lsd --tree"
    alias lsdconfig='$EDITOR ~/.config/lsd'
fi

alias -g HG='--help 2>&1 | grep'

DOTFILES_CONFIG="$HOME/.cfg/"
alias dotfiles='command -p git --git-dir=$DOTFILES_CONFIG --work-tree=$HOME'

# vim: textwidth=4 shiftwidth=4 smarttab
