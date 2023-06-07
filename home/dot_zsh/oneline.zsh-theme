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


PS1='%F{blue}%1~%f:%F{cyan}$(env LANG=C ls -l|grep -v "total"|wc -l|xargs)%f'
PS1+='$(gitprompt)'
PS1+=' %(?.%F{green}.%F{red})%(!.#.»)%f '
PS2="› "

RPS1=''
if [[ ! -v TMUX ]]; then
    RPS1+='💻 %m'
fi
