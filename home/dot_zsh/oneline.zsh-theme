function get_cluster_short() {
  echo "$1" | cut -d . -f1 | sed 's|N/A||g'
}


# git-prompt
#ZSH_GIT_PROMPT_FORCE_BLANK=true
#ZSH_GIT_PROMPT_SHOW_STASH=true
ZSH_THEME_GIT_PROMPT_PREFIX=' '
ZSH_THEME_GIT_PROMPT_SUFFIX='%f'
ZSH_THEME_GIT_PROMPT_SEPARATOR=''
ZSH_THEME_GIT_PROMPT_DETACHED="%F{yellow}:"
ZSH_THEME_GIT_PROMPT_BRANCH='%F{yellow}'
ZSH_THEME_GIT_PROMPT_BEHIND='%F{yellow}↓'
ZSH_THEME_GIT_PROMPT_AHEAD='%F{yellow}↑'
ZSH_THEME_GIT_PROMPT_UNMERGED='%F{yellow}✖'
ZSH_THEME_GIT_PROMPT_STAGED='%F{yellow}+'
ZSH_THEME_GIT_PROMPT_UNSTAGED='%F{yellow}*'
ZSH_THEME_GIT_PROMPT_UNTRACKED='%F{yellow}.'
ZSH_THEME_GIT_PROMPT_STASHED='%F{yellow}⚑'
ZSH_THEME_GIT_PROMPT_CLEAN=''

# virtualenv
ZSH_THEME_VIRTUALENV_PREFIX='🐍 %F{magenta}'
ZSH_THEME_VIRTUALENV_SUFFIX='%f'

# kube-ps1
KUBE_PS1_PREFIX=''
KUBE_PS1_PREFIX_COLOR='blue'
KUBE_PS1_SYMBOL_ENABLE=false
KUBE_PS1_SYMBOL_COLOR='blue'
KUBE_PS1_CLUSTER_FUNCTION=get_cluster_short
KUBE_PS1_CTX_COLOR='blue'
KUBE_PS1_NS_ENABLE=false
KUBE_PS1_NS_COLOR='blue'
KUBE_PS1_SUFFIX='  '


PS1='%F{blue}%1~%f:%F{cyan}$(env LANG=C ls -l|grep -v "total"|wc -l|xargs)%f'
PS1+='$(gitprompt)'
PS1+=' %(?.%F{green}.%F{red})%(!.#.»)%f '
PS2="› "

RPS1=''
RPS1+='$(if command -v kubectl &> /dev/null; then kube_ps1; fi)'
if [[ ! -v TMUX ]] && [[ -z ${$(virtualenv_prompt_info):-} ]]; then
    RPS1+='💻 %m'
fi
RPS1+='$(virtualenv_prompt_info)'
