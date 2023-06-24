zstyle ':fzf-tab:*' prefix ''  # hide colorized prefix
zstyle ':fzf-tab:*' fzf-min-height 24
zstyle ':fzf-tab:*' default-color $'\033[37m'  # default color white

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

# disable previews for commands and arguments
zstyle ':fzf-tab:complete:*:options' fzf-preview
zstyle ':fzf-tab:complete:*:argument-1' fzf-preview

# file preview
zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'  # (Q) is to unquote i.e. remove \

# variables
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ${(P)word}'

# git
zstyle ':completion:*:git-checkout:*' sort false  # ignore order on git checkout
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview 'git diff $word | delta'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview 'git log --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview 'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview 'case "$group" in	"commit tag") git show --color=always $word ;; *) git show --color=always $word | delta ;; esac'
zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview 'case "$group" in "modified file") git diff $word | delta ;; "recent commit object name") git show --color=always $word | delta ;; *) git log --color=always $word ;; esac'

# systemd
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

# tmux
#zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup  # activate tmux popup
