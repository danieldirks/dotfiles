export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#eceff4,bg:#2e3440,hl:#5e81ac --color=fg+:#88c0d0,bg+:#2e3440,hl+:#5e81ac --color=info:#b48ead,prompt:#5e81ac,pointer:#88c0d0 --color=marker:#a3be8c,spinner:#b48ead,header:#81a1c1 --bind ctrl-j:down,ctrl-k:up'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --bind ctrl-j:down,ctrl-k:up'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --scroll-off=5'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --border=none'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --prompt="» " --pointer="›" --marker="›"'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --preview-window=right,border-left --preview "bat --color=always --style=numbers --line-range=:500 {}"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="$FZF_DEFAULT_OPTS"
export FZF_CTRL_R_OPTS="$FZF_DEFAULT_OPTS --preview-window=hidden"
export FZF_ALT_C_COMMAND="fd --type directory --hidden --exclude .git"
export FZF_ALT_C_OPTS="$FZF_DEFAULT_OPTS --preview-window=hidden"
export FZF_TMUX=1
