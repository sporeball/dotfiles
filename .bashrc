alias python='winpty python.exe'
alias rm=trash
alias ccat='pygmentize -O style=monokai'
alias focus='netsh interface set interface "Wi-Fi" disable; echo "internet off. now go!"'
alias losefocus='netsh interface set interface "Wi-Fi" enable; echo "internet on. use wisely!"'

#!/bin/bash
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

export SHELL=/bin/bash

function get_hostname {
  export SHORTNAME=${HOSTNAME%%.*}
}

function settitle() {
  u=${USERNAME}
  h="$u@${HOSTNAME}"
  echo -ne "\e]2;$h\a\e]1;$h\a";
}

# Set directory colors
eval `dircolors ~/.dir_colors`

# Set prompt and window title
c_red='[0;31m'
c_grn='[0;32m'
c_ylw='[0;33m'
c_blu='[0;34m'
c_mgt='[0;35m'
c_cyn='[0;36m'
c_wht='[0;37m'
PROMPT_COMMAND='settitle; get_hostname; history -a;'

export PATH=$PATH:~/AppData/Local/hyper/app-2.1.2/resources/bin
export PATH=$PATH:./node_modules/.bin

cd $HOME
export PS1='\n\[\e${c_mgt}\]sporeball\[\e${c_wht}\]@\[\e${c_grn}\]\H\[\e${c_wht}\]:\[\e${c_blu}\]\w\n\[\e${c_wht}\]$ '
