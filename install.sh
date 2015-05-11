#!/usr/bin/env bash

# get into the right directory
#SCRIPT_DIR=$( cd "$(dirname "$0")" ; pwd -P )
STARTING_DIR=$(pwd)
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
POWERLINE_DIR="$SCRIPT_DIR/lib/powerline-shell"

printf "\n    dotfiles    "
printf "\n⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁\n"

if [ "$1" == "light" ]; then
  printf "\nLIGHT THEME SELECTED\n\n"
else
  printf "\nDARK THEME SELECTED\n\n"
fi

function symlinkEVERYTHING() {
  declare -a files=(
    ".aliases"
    ".bash_logout"
    ".bash_profile"
    ".bash_prompt"
    ".bashrc"
    ".exports"
    ".functions"
    ".gitconfig"
    ".gitignore"
    ".gitmodules"
    ".git-completion"
    ".inputrc"
    ".path"
    ".profile"
    ".vim"
    ".vimrc"
    ".wgetrc"
  )

  if [ "$1" == "light" ]; then
    files+=(".vimrc-light")
  else
    files+=(".vimrc-dark")
  fi

  printf "\nSymlinking dotfiles:\n"
  for file in "${files[@]}"; do
    printf "↝ $file\n"
    ln -sf "$SCRIPT_DIR/$file" "$HOME/$file\n"
  done
  printf "↝ powerline-shell.py\n"
  ln -sf "$POWERLINE_DIR/powerline-shell.py" "$HOME/powerline-shell.py"
  unset files
  unset file
}

function initPowerline() {
  # setup powerline-shell
  printf "\nChanging directory to $POWERLINE_DIR\n"
  cd $POWERLINE_DIR

  CONFIG="
SEGMENTS = [
  #'set_term_title',
  'virtual_env',
  'username',
  #'hostname',
  'ssh',
  'cwd',
  'read_only',
  'git',
  #'hg',
  #'svn',
  #'fossil',
  'jobs',
  'root',
]
"
  if [ "$1" == "light" ]; then
    CONFIG+="THEME='../../../themes/solarized-light'"
    printf "Writing powerline config.py:\n"
    printf "$CONFIG\n"
  else
    CONFIG+="THEME='../../../themes/solarized-dark'"
    printf "Writing powerline config.py:"
    printf "$CONFIG\n"
  fi


  echo "$CONFIG" > config.py

  printf "Running powerline setup...\n"
  echo "$(python install.py)" | sed ':a;N;$!ba;s/\n/\n  /g'
}

#symlink dotfiles
if [ "$1" == "--force" -o "$1" == "-f" ]; then
  symlinkEVERYTHING
else
  printf "\n⌁ WARNING: This script will overwrite files in your home directory!\n"
  read -p "Are you sure you want to continue? (y/n) " -n 1;
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    #printf "\nChanging directory to $SCRIPT_DIR\n"
    #cd $SCRIPT_DIR
    initPowerline $1
    symlinkEVERYTHING $1
    echo
  fi
fi

printf "\nSetting up dircolors...\n"
eval `dircolors "$SCRIPT_DIR"/lib/dircolors-solarized/dircolors.ansi-dark`
echo

cd "$STARTING_DIR"
printf "\nDone setting up!\n"

unset symlinkEVERYTHING
unset initPowerline
unset SCRIPT_DIR
unset POWERLINE_DIR
unset STARTING_DIR

printf "\nSourcing .bash_profile...\n"
source "$HOME/.bash_profile"

