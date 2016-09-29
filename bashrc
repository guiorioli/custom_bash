is_git_changed(){
    str=` git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ "$str" != "" ]; then
    if [ -n "$(git diff-index --name-only HEAD -- 2>/dev/null)" ]; then
        str=" (!"$str")"
    else
        str=" ("$str")"
    fi
    echo $str
    fi
} 

PS1='${debian_chroot:+($debian_chroot)}\[\033[38;5;11m\]\t\[$(tput sgr0)\] \[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[38;5;196m\] $(is_git_changed)\[\033[00m\]\n\$ '

PROMPT_COMMAND='(( PROMPT_CTR-- < 0 )) && {
  echo
  unset PROMPT_COMMAND PROMPT_CTR
  PROMPT_COMMAND=echo
}'

