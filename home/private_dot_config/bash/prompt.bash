PROMPT_COMMAND=__prompt_command

__prompt_command() {
    local EXIT="$?"
    local R='\[\e[0;31m\]'
    local G='\[\e[0;32m\]'
    local Y='\[\e[0;33m\]'
    local B='\[\e[0;34m\]'
    local C='\[\e[0;36m\]'
    local CL='\[\e[0m\]'

    PS1="b ${B}\W${CL}:${C}\$(env LANG=C ls -l|grep -v \"total\"|wc -l|xargs)${CL}"
    PS1+="${Y}\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/')${CL}"
    # color prompt based on last command
    if [[ $EXIT != 0 ]]; then
        PS1+=" ${R}"
    else
        PS1+=" ${G}"
    fi
    # show # if root and » otherwise
    if [[ $EUID -eq 0 ]]; then
        PS1+="#"
    else
        PS1+="»"
    fi
    PS1+="${CL} "
    PS2='› '
}