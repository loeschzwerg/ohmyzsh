# Put your custom themes in this folder.
# See: https://github.com/ohmyzsh/ohmyzsh/wiki/Customization#overriding-and-adding-themes
#
# Author: loeschzwerg

PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "
# ref: colors(n)
# ref: terminfo(5)
# ref: stty(1)
# ref: zshmisc(1) SIMPLE_PROMPT_ESCAPES
# login
P_TTY='%l'          # %y
P_MACHINE='%m'      # %M
P_USER='%n'

# state
P_PRIV='%#'
P_RETURN='%?'
P_PARSER='%0_'      # %^
P_CWD='%/'          # %d | %~ | %c | %. | %C
P_EVALDEPTH='%e'
P_EVALLINE='%i'
P_HISTORY='%!'      # %h
P_EVALNAME='%N'     # %x
P_JOBS='%j'
P_SHLVL='%L'

# date and time
P_DATETIME='%T'     # %D | %* | %t | %@ | %w | %W | %D{strftime}

# Visuals
P_BOLD='%B'
P_bold='%b'
P_CLEAREOL='%E'
P_ULINE='%U'
P_uline='%u'
P_STANDOUT='%S'
P_standout='%s'
P_FG='%F'           # %F1 | %F{red}
P_fg='%f'
P_BG='%K'           # %K1 | %K{red}
P_SEQ='%{seq%2G%}'  # 'seq' with width=2

# conditional
P_PSVAR='%v'           # %2v
P_IF='%(if.then.else)' # %(?_0_1) | %(!|priv|user) | %20(S/long/short) | %10(l:true:false)
P_TRUNC='%10<...<%~%<<%#' # truncated dir with appended %/#


# prompt
anchor=$THEME_NAME
LINE=$'%F{blue}${(l.((${COLUMNS}-${#THEME_NAME}-5))..─.)}$reset_color $THEME_NAME $fg[blue]───$reset_color'

# :omz:plugin:feature
zstyle ':omz:git:*' prompt-enabled yes
zstyle ':omz:git:*' prompt-sign '\ue702' # 
zstyle ':omz:git:UNTRACKED' prompt-add '?'
zstyle ':omz:git:ADDED' prompt-add '+'
zstyle ':omz:git:MODIFIED' prompt-add '~'
zstyle ':omz:git:RENAMED' prompt-add '=>'
zstyle ':omz:git:DELETED' prompt-add 'x'
zstyle ':omz:git:UNMERGED' prompt-add '><'
zstyle ':omz:git:AHEAD' prompt-add '>>'
zstyle ':omz:git:BEHIND' prompt-add '<<'
zstyle ':omz:git:DIVERGED' prompt-add '<>'
zstyle ':omz:git:STASHED' prompt-add 's'
zstyle ':omz:git:DIRTY' prompt-add '🖓' # '☹'
zstyle ':omz:git:CLEAN' prompt-add '🖒' # '☻'
zstyle ':omz:git:EQUAL_REMOTE' prompt-add '='
zstyle ':omz:git:AHEAD_REMOTE' prompt-add '=>'
zstyle ':omz:github:*' prompt-enabled yes
zstyle ':omz:github:*' prompt-sign '\ue709' # 
zstyle ':omz:python:*' prompt-sign '\ue73c' # 
zstyle ':omz:shell:*' prompt-sign '\ue760' # 
zstyle ':omz:rust:*' prompt-sign '\ue7a8' # 
zstyle ':omz:vim:*' prompt-sign '\ue7c5' #  # \ue62b 
zstyle ':omz:javascript:*' prompt-sign '\uf2ee' # 
zstyle ':omz:json:*' prompt-sign '\ueb0f' # 
zstyle ':omz:html:*' prompt-sign '\ue736' # 
zstyle ':omz:lua:*' prompt-sign '\ue620' # 

zstyle ':omz:*:git:*' check '.git'
zstyle ':omz:*:github:*' check '.github'
zstyle ':omz:*:python:*' check '{{pyproject,uv}.toml,uv.lock,.venv}'
zstyle ':omz:*:shell:*' check '*.{bash,zsh,sh}'
zstyle ':omz:*:rust:*' check 'Cargo.toml'
zstyle ':omz:*:vim:*' check '*.vim'
zstyle ':omz:*:javascript:*' check 
zstyle ':omz:*:json:*' check 
zstyle ':omz:*:html:*' check 
zstyle ':omz:*:lua:*' check '*.lua'

function dtl::prompt() {
    zstyle -s ':dtl:git:${}' sign REPLY 
    zstyle -s ':d'
    zstyle -s ':omz:git:UNTRACKED'  ZSH_THEME_GIT_PROMPT_UNTRACKED
    'ADDED'     "$ZSH_THEME_GIT_PROMPT_ADDED"
    'MODIFIED'  "$ZSH_THEME_GIT_PROMPT_MODIFIED"
    'RENAMED'   "$ZSH_THEME_GIT_PROMPT_RENAMED"
    'DELETED'   "$ZSH_THEME_GIT_PROMPT_DELETED"
    'UNMERGED'  "$ZSH_THEME_GIT_PROMPT_UNMERGED"
    'AHEAD'     "$ZSH_THEME_GIT_PROMPT_AHEAD"
    'BEHIND'    "$ZSH_THEME_GIT_PROMPT_BEHIND"
    'DIVERGED'  "$ZSH_THEME_GIT_PROMPT_DIVERGED"
    'STASHED'   "$ZSH_THEME_GIT_PROMPT_STASHED"
}

# primary prompt: dashed separator, directory and vcs info
PS1=$'%237F%(l.%(afmagic_dashes)..─.)%f\n'
PS1+=$'%32F%~$(git_prompt_info)$(hg_prompt_info) %105F%?%f '
PS2="%F1\ %f"

PS1=$'%255K %254K %253K %252K% %251K %250K %249K %248K %247K %246K %245K %244K %243K %242K %241K %240K %239K %238K %237K %236K %235K %234K %233K %232K'
# right prompt: return code, virtualenv and context (user@host)
RPS1="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
if (( $+functions[virtualenv_prompt_info] )); then
  RPS1+='$(virtualenv_prompt_info)'
fi
RPS1+=" ${FG[237]}%n@%m%{$reset_color%}"
PROMPT=$'$(git_prompt_info)'

add-zsh-hook chpwd ls # after cd execute ls

# vim: textwidth=80 shiftwidth=4 smarttab
