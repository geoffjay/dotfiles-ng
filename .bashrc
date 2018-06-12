# Test for an interactive shell.
if [[ $- != *i* ]] ; then
  return
fi

if [[ -f /etc/bash_completion ]]; then
  . /etc/bash_completion
fi

#xhost +local:root > /dev/null 2>&1
#if [[ -z "$DISPLAY" -a $XDG_VTNR -eq 1 ]]; then
#  ssh-agent startx
#fi

complete -cf sudo

shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete

export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth
export JAVA_FONTS=/usr/share/fonts/TTF
export EDITOR=/usr/bin/vim

#export BROWSER=/usr/bin/xdg-open
export BROWSER=

ESC=$'['
END_ESC=m

NOPRINT='\['
END_NOPRINT='\]'

WRAP="$NOPRINT$ESC"
END_WRAP="$END_ESC$END_NOPRINT"

RESET="${WRAP}0${END_WRAP}"
RESET_BG="${WRAP}49${END_WRAP}"

NORMAL="${WRAP}21${END_WRAP}"
BOLD="${WRAP}1${END_WRAP}"

if [[ -d ~/.bash.d ]]; then
  for i in ~/.bash.d/*; do
    [[ -f "${i}" ]] && source "${i}"
  done
fi
