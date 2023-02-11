function git_current_branch {
  hash git || return
  branch=$(env LANG=C git symbolic-ref --short HEAD 2>/dev/null)
  [[ -n "$branch" ]] && echo -n " ⑂$branch" || return

  [[ -n "$(git status --porcelain 2>/dev/null)" ]] && echo -n "*"
  info=$(env LANG=C git status --porcelain --branch 2>/dev/null | head -n1)
  [[ $info =~ ahead\ ([0-9]+) ]] && echo -n "↑$match[1]"
  [[ $info =~ behind\ ([0-9]+) ]] && echo -n "↓$match[1]"
}

autoload -U colors && colors

function set_prompt {
  EXIT=$?
  PS1=$'\n'" %F{blue}%~%f:%F{green}$(env LANG=C ls -l|grep -v "total"|wc -l)%F{yellow}$(git_current_branch)%f %(!.#.$) "
  PS2=' > '
  VENV=''
  if [[ -n $VIRTUAL_ENV ]]; then
      VENV="%F{244}($(basename "$VIRTUAL_ENV"))%f "
  fi
  RPS1="$VENV$(if [[ $EXIT != "0" ]]; then echo "%F{red}"; fi)%m"
  print -Pn '\e]2;%n@%m %1~\a' # window title
  echo -ne '\e[5 q' # cursor shape
}

function set_title {
  print -n "\e]2;${(q)1}\a"
}

[ ${ZSH_VERSION} ] && add-zsh-hook -Uz precmd set_prompt
if [[ "$TERM" == (screen*|xterm*|rxvt*) ]]; then
  add-zsh-hook -Uz preexec set_title
fi

# cursor shape (https://unix.stackexchange.com/questions/547/make-my-zsh-prompt-show-mode-in-vi-mode/327572#327572)
KEYTIMEOUT=5
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
    [[ $1 = 'block' ]]; then
      echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
    [[ ${KEYMAP} == viins ]] ||
    [[ ${KEYMAP} = '' ]] ||
    [[ $1 = 'beam' ]]; then
      echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# default cursor
echo -ne '\e[5 q'
