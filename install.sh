#!/usr/bin/env bash

# get into the right directory
#SCRIPT_DIR=$( cd "$(dirname "$0")" ; pwd -P )
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
POWERLINE_DIR="$SCRIPT_DIR/lib/powerline-shell"

printf "\n    dotfiles    "
printf "\n⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁\n"

if [ "$#" -eq 0 ]; then
  read -p "Which theme would you like? (d)ark or (l)ight > " -n 1;
  if [[ $REPLY =~ ^([lL]|[lL]ight)$ ]]; then
    THEME="light"
  elif [[ $REPLY =~ ^([dD]|[dD]ark)$ ]]; then
    THEME="dark"
  fi
else
  THEME=$1
fi
printf "\nUsing theme '$THEME'\n"

printf "\n⌁ WARNING: This script will overwrite files in your home directory!\n"
read -p "Are you sure you want to continue? (y/n) " -n 1;
if [[ $REPLY =~ ^[^Yy]$ ]]; then
  printf "\nAborting!\n"
  exit 1
fi

# setup powerline-shell
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
THEME='../../../themes/solarized-$THEME'"

cd $POWERLINE_DIR
printf "Writing powerline config.py:\n"
printf "$CONFIG\n"
echo "$CONFIG" > config.py
printf "Running powerline setup...\n"
echo "$(python install.py)" | sed ':a;N;$!ba;s/\n/\n  /g'
cd -

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
  ".wgetrc"
)

printf "\nSymlinking dotfiles:\n"
for file in "${files[@]}"; do
  printf "↝ $file\n"
  ln -sf "$SCRIPT_DIR/$file" "$HOME/$file"
done
printf "↝ .vim/\n"
rm -rf "$HOME/.vim"
ln -s "$SCRIPT_DIR/.vim" "$HOME/.vim"
printf "↝ .vimrc ($THEME)\n"
ln -sf "$SCRIPT_DIR/.vimrc" "$HOME/.vimrc-main"
ln -sf "$SCRIPT_DIR/.vimrc-$THEME" "$HOME/.vimrc"
printf "↝ powerline-shell.py\n"
ln -sf "$POWERLINE_DIR/powerline-shell.py" "$HOME/powerline-shell.py"
unset files
unset file

printf "\nSetting up dircolors...\n"
eval `dircolors "$SCRIPT_DIR"/lib/dircolors-solarized/dircolors.ansi-dark`

printf "\nSourcing .bash_profile...\n"
source "$HOME/.bash_profile"

unset SCRIPT_DIR
unset POWERLINE_DIR
unset THEME

printf "\n\n... done.\nBye!\n"

