# sporeball's fish config

# Fisher is also used, with the following plugins:
# - danhper/fish-ssh-agent

set -x SHELL /usr/bin/fish

alias cat=bat
alias ls="exa -aL2 --git --no-permissions --no-time --no-user"

function cti -d "move an image from the clipboard to a file"
  xclip -selection clipboard -t image/png -o > $argv
end

function dcd -d "cd to the contents of a removable volume"
  cd /run/media/lux
  cd $argv
end

function re -d "cd to a repo"
  cd ~/Documents/gh
  cd $argv
end

function td -d "cd to something in the home directory"
  cd ~
  cd $argv
end

function v -d "start vim"
  if test (count $argv) -eq 0
    vim -p *.js
  else
    vim -p $argv
  end
end

# pacman shortcuts
function rs -d "remove a package"
  sudo pacman -Rs $argv
end

function s -d "install a package"
  sudo pacman -S $argv
end

function syu -d "update all packages"
  sudo pacman -Syu
end
