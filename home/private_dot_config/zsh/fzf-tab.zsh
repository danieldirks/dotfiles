zstyle ':fzf-tab:*' prefix ''  # hide colorized prefix
zstyle ':fzf-tab:*' fzf-min-height 24
zstyle ':fzf-tab:*' default-color $'\033[34m'  # default color blue

# groups
zstyle ':fzf-tab:*' show-group none  # hide groups
#zstyle ':fzf-tab:*' switch-group ',' '.'  # switch types with . & ,
zstyle ':completion:*:descriptions' format '[%d]'  # style of group names
FZF_TAB_GROUP_COLORS=(
    $'\033[34m' $'\033[33m' $'\033[32m' $'\033[31m' $'\033[35m' \
    $'\033[34m' $'\033[33m' $'\033[32m' $'\033[31m' $'\033[35m' \
    $'\033[34m' $'\033[33m' $'\033[32m' $'\033[31m' $'\033[35m' \
    $'\033[34m' $'\033[33m' $'\033[32m' $'\033[31m' $'\033[35m'
)
zstyle ':fzf-tab:*' group-colors $FZF_TAB_GROUP_COLORS  # colors for groups

# controls
zstyle ':fzf-tab:*' fzf-bindings 'space:accept'  # accept on space
zstyle ':fzf-tab:*' accept-line enter  # directly run on enter


###################
### integration ###
###################

# system
zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'  # (Q) is to unquote i.e. remove \
zstyle ':fzf-tab:complete:(-command-):*' fzf-preview 'which $word 2> /dev/null'
zstyle ':fzf-tab:complete:(-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo "$word"'

# git
zstyle ':completion:*:git-checkout:*' sort false  # ignore order on git checkout
zstyle ':fzf-tab:complete:git-diff:*' fzf-preview 'git diff $word | delta'
zstyle ':fzf-tab:complete:git-(add|restore):*' fzf-preview 'git diff $realpath | delta'
zstyle ':fzf-tab:complete:git-(checkout|branch):*' fzf-preview 'git log --graph --oneline --color=always $word'

# systemd
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

# tmux
#zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup  # activate tmux popup
