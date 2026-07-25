__ls_show () {
  ls
}

add-zsh-hook chpwd __ls_show # after cd execute ls

