#!/usr/bin/env bash

#set -x

# get into the right directory
#SCRIPT_DIR=$( cd "$(dirname "$0")" ; pwd -P )
STARTING_DIR=$(pwd);
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
POWERLINE_DIR="$SCRIPT_DIR/lib/powerline-shell";

echo "";
echo "     dotfiles    ";
echo " ⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁";
echo "";

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
  );
  echo " ⌁ Symlinking dotfiles...";
  for file in "${files[@]}"; do
    echo "   ⌁ ln -sf $SCRIPT_DIR/$file $HOME/$file";
    ln -sf "$SCRIPT_DIR/$file" "$HOME/$file";
  done;
  unset files;
  unset file;
  echo "" && echo " ⌁ Symlinking powerline...";
  ln -sf "$POWERLINE_DIR/powerline-shell.py" "$HOME/powerline-shell.py";
}

function initPowerline() {
  # setup powerline-shell
  echo " ⌁ Running powerline setup..."
  echo "   ⌁ Changing directory to $POWERLINE_DIR";
  cd $POWERLINE_DIR;
  echo "   ⌁ $(python install.py)" && echo "";
}

#symlink dotfiles
if [ "$1" == "--force" -o "$1" == "-f" ]; then
  symlinkEVERYTHING;
else
  echo " ⌁ WARNING: This script will overwrite files in your home directory.";
  read -p "   Are you sure you want to continue? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "" && echo " ⌁ Changing directory to $SCRIPT_DIR" && echo "";
    cd $SCRIPT_DIR;
    initPowerline;
    symlinkEVERYTHING;
    echo;
  fi;
fi;

echo " ⌁ Setting up dircolors..."
eval `dircolors "$SCRIPT_DIR"/lib/dircolors-solarized/dircolors.ansi-dark`
echo

cd "$STARTING_DIR";
echo "";
echo " ⌁ All done setting up!";

unset symlinkEVERYTHING;
unset initPowerline;
unset SCRIPT_DIR;
unset POWERLINE_DIR;
unset STARTING_DIR;

echo " ⌁ Sourcing .bash_profile...";
source "$HOME/.bash_profile";
echo;
