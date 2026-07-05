function check-health () {
  set +o pipefail
  set +o errexit
  typeset -a missing
  check () {
    command -p $1 || missing+=${2:-$1}
  }
  check zsh
  check git
  check nvim neovim
  git config get --global core.editor || git config set --global core.editor 'nvim'
  check delta git-delta
  git config get --global core.pager  || git config set --global core.pager 'delta'
  check fd fd-find
  check rg ripgrep
  check tmux
  check fzf
  check lsd
  check duf # disk usage free

  dnf install ${missing[*]}
}

function check-env () {
  typeset -p1
}

function check-rpm-install () {
  packages=$(rpm -qa | sort)                    # list all installed packages
  programs=$(rpm -qf /usr/bin/* | sort | uniq)  # list all installed packages that provides the binary
  delta =(<<<$programs) =(<<<$packages)
}

alias check-rpm-owner='rpm --query --queryformat "%-30{NAME} %-4{SIZE:humaniec} %{INSTALLTIME:date}\n" --file'
alias check-rpm-verify='sudo rpm --verify --all'
