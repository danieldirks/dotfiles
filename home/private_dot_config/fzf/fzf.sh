export FZF_BASE='/usr/bin/fzf'

export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS" -m\
    --color=fg:-1,bg:-1,hl:6 \
    --color=fg+:-1:regular,bg+:0,hl+:-1:regular \
    --color=gutter:-1,border:8 \
    --color=info:14,prompt:6,pointer:6 \
    --color=marker:4,spinner:14,header:4 \
    --prompt=\"» \" --pointer=\"›\" --marker=\"›\" \
    --bind ctrl-j:down,ctrl-k:up \
    --scroll-off=5 \
    --preview-window=right,border-left" #--preview \"less {}\""

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="$FZF_DEFAULT_OPTS"

export FZF_CTRL_R_OPTS="$FZF_DEFAULT_OPTS"

export FZF_ALT_C_COMMAND="fd --type directory --hidden --exclude .git"
export FZF_ALT_C_OPTS="$FZF_DEFAULT_OPTS"

export FZF_TMUX=1
