# Put your custom themes in this folder.
# See: https://github.com/ohmyzsh/ohmyzsh/wiki/Customization#overriding-and-adding-themes
#
# Author: loeschzwerg

PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "
# ref: colors(n)
# ref: terminfo(5)
# ref: stty(1)
# ref: zshmisc(1) SIMPLE_PROMPT_ESCAPES
# ref: zshall(1)

# login
P_TTY='%l'          # %y
P_MACHINE='%m'      # %M
P_USER='%n'

# state
P_PRIV='%#'
P_RETURN='%?'
P_PARSER='%0_'      # %^ current parser shell construct (if, for, QUOTE, ..)
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
THEME_NAME="DTL"
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

#     1234567890123456789
BOX=$'╷╶┌╴┐─┬╵│└├┘┤┴┼╭╮╰╯' # NOTE: ZSH-Indexing: 1..
DOT=$'·'
BOXC=${DOT}                # Center
# Order: L R T D - Left Right Top Down
BOXLR=${BOX[6]}
BOXL=${BOX[4]}
BOXR=${BOX[2]}
BOXTD=${BOX[9]}
BOXT=${BOX[8]}
BOXD=${BOX[1]}
BOXRT=${BOX[18]}
BOXRD=${BOX[16]}
BOXLT=${BOX[19]}
BOXLD=${BOX[17]}
BOXRTD=${BOX[11]}

# DATE="%{%B%D${BOXC}%T%b%14G%}"
DATE="%B%D${BOXC}%*%b"
# RET_CODE=$'%{%(?.%5F.%1F)%B%?%b%f%3G%}' # Always display colored %? return code
RET_CODE=$'%(?.%5F.%1F)%B%?%b%f' # Always display colored %? return code

function color_matrix () {
    local colors="  0 "
    for i in {0..255} ; do
        colors+="%${i}K "
        case $i in 
            (15|51|87|123|159|195|231)
                # 0-15 primary
                # 6*6*6 colors
                # 24 shades of grey
                colors+="%k ${(r:3:)i}\n${(l:3:)$((i + 1))} "
                ;;
            (255)
                colors+="%k 255"
                ;;
            (*)
                ;;
        esac
    done
    print -P "$colors"
}


function dtl::rule () {
    local __lw_off="\e[?7l" # disable line wrapping
    local __lw_on="\e[?7h" # enable line wrapping
    local cols=$(tput cols)
    # FIXME: the prefix-replacement is on raw strings
    # NOTE: replacement MUST be literal
    local prefix=${1}
    local count=${#prefix}
    local final="$prefix${(r(cols)(─))BOXLR}" 
    print -n $__lw_off

    print -P "%[>]%4F$final%f"  # %[>] enables truncation
    print -n $__lw_on
}

PROMPT_BANG=1 # If the PROMPT_BANG option is set, a '!' in the prompt is replaced by the current history event number.  A literal '!' may then be represented as '!!'.

PS1=''
PS1+="%4F${BOXTD} " # continue box
# PS1+=$'%2F%~ '
PS1+=$' $(git_prompt_info)'
PS1+="${RET_CODE} "

# right prompt: return code, virtualenv and context (user@host)
RPS1=''
# RPS1="%(?..%{$fg[red]%}%?↵ %{$reset_color%})"
# RPS1+=$'%237F$(git_prompt_info)%f '
RPS1+="%237F%n@%M%f"
# if (( $+functions[virtualenv_prompt_info] )); then
#   RPS1+='$(virtualenv_prompt_info)'
# fi

PS2="%4F${BOXRTD}%3F%B%_%b%f"
RPS2="%3F%B%^%b%f"

PS4="%4F${BOXRTD}%3F%x:%i>"

# RPS2=$RPROMPT2
## Spelling correction
# SPROMPT 

function dtl::chpwd () {
    print "CHPWD"
    # =ls # =x resolve x to path
    ls
}

function dtl::precmd () {
    # NOTE: does not support git_prompt_info (maybe because it is executed async)
    # local precmd_prefix="${BOX[16]}${BOX[4]}PRECMD${BOX24}${DATE}${BOX24}!%!${BOX24}%(1j.%B.)%%%j%b"
    local precmd_prefix="${BOXRD}"
    precmd_prefix+="${BOXL}${DATE}${BOXR}"
    precmd_prefix+="${BOXL}!%!${BOXR}" #
    precmd_prefix+="${BOXL}%(1j.%B.)%%%j%b${BOXR}" # >=1 job
    precmd_prefix+="${BOXL}%6F%B%~%b%4F${BOXR}"
    print
    dtl::rule "$precmd_prefix"
}

function dtl::preexec () {
    # local preexec_prefix="${BOX[18]}${BOX[4]}PREEXEC${BOX[2]}${BOX[4]}${DATE}"
    local preexec_prefix="${BOXRT}${BOXL}${DATE}${BOXR}"
    dtl::rule "$preexec_prefix"
    print
}

# add-zsh-hook chpwd dtl::chpwd # after cd execute ls
add-zsh-hook precmd dtl::precmd # execute precmd
add-zsh-hook preexec dtl::preexec # execute preexec

# vim: textwidth=80 shiftwidth=4 smarttab
