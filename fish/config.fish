# sporeball's fish config

# Fisher is also used, with the following plugins:
# - danhper/fish-ssh-agent

set -x SHELL /usr/bin/fish

alias cat=bat
alias ls="exa -aL2 --git --no-permissions --no-time --no-user"

# helper functions
function read_confirm
  read -l -P 'sure? y/n ' confirm
  switch $confirm
    case y
      return 0
    case '' n
      return 1
  end
end

# basic shortcuts
function cti -d "move an image from the clipboard to a file"
  xclip -selection clipboard -t image/png -o > $argv
end

function dcd -d "cd to the contents of a removable volume"
  cd /run/media/lux
  cd $argv
end

function mkcd -d "make a new directory, and cd into it"
  mkdir $argv
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
  if test (count $argv) -eq 0
    return 1
  end
  sudo pacman -S $argv
end

function syu -d "update all packages"
  sudo pacman -Syu
end

# git shortcuts
function ga -d "add files to git"
  if test (count $argv) -eq 0
    git add .
  else
    git add $argv
  end
end

function gc -d "commit changes"
  if test (count $argv) -eq 0
    git commit
  else
    git commit -m $argv
  end
end

function gd -d "show changes"
  if test (count $argv) -eq 0
    git diff
  else
    git diff $argv
  end
end

function gl -d "show commit log"
  git log
end

function gp -d "push changes"
  git push
end

function gs -d "show status"
  git status
end
