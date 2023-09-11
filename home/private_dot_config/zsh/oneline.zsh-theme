# https://github.com/zsh-git-prompt/zsh-git-prompt
ZSH_THEME_GIT_PROMPT_PREFIX=' '
ZSH_THEME_GIT_PROMPT_SUFFIX=''
ZSH_THEME_GIT_PROMPT_HASH_PREFIX='%F{yellow}:'
ZSH_THEME_GIT_PROMPT_SEPARATOR=''
ZSH_THEME_GIT_PROMPT_BRANCH='%F{yellow}'
ZSH_THEME_GIT_PROMPT_STAGED=' %F{yellow}+'
ZSH_THEME_GIT_PROMPT_CONFLICTS=' %F{yellow}!'
ZSH_THEME_GIT_PROMPT_CHANGED=' %F{yellow}*'
ZSH_THEME_GIT_PROMPT_BEHIND='%F{yellow}↓'
ZSH_THEME_GIT_PROMPT_AHEAD='%F{yellow}↑'
ZSH_THEME_GIT_PROMPT_STASHED=' %F{yellow}#'
ZSH_THEME_GIT_PROMPT_UNTRACKED=' %F{yellow}.'
#ZSH_THEME_GIT_PROMPT_CLEAN=' %F{yellow}~'
ZSH_THEME_GIT_PROMPT_CLEAN=''
ZSH_THEME_GIT_PROMPT_LOCAL=' %F{yellow}L'

ZSH_THEME_GIT_PROMPT_UPSTREAM_FRONT=' %F{yellow}'
ZSH_THEME_GIT_PROMPT_UPSTREAM_END=''
ZSH_THEME_GIT_PROMPT_MERGING='%F{yellow}|MERGING'
ZSH_THEME_GIT_PROMPT_REBASE='%F{yellow}|REBASE'
ZSH_THEME_GIT_PROMPT_BISECT='%F{yellow}|BISECT'


PS1='%F{blue}%1~%f:%F{cyan}$(env LANG=C ls -l|grep -v "total"|wc -l|xargs)%f'
PS1+='$(git_super_status)'
PS1+=' %(?.%F{green}.%F{red})%(!.#.»)%f '
PS2='› '

RPS1=''
# hide hostname in tmux
if [[ ! -v TMUX ]]; then
    RPS1+='💻 %m'
fi
