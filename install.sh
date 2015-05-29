#!/usr/bin/env bash

# get into the right directory
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
POWERLINE_DIR="$SCRIPT_DIR/lib/powerline-shell"
CONFIG_DIR="$SCRIPT_DIR/config"

printf "\nkorourke's dotfiles"
printf "\n⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁⌁\n"

if [ "$#" -eq 0 ]; then
  printf "Which theme would you like?\n"
  printf "  1. Solarized (dark)\n"
  printf "  2. Solarized (light)\n"
  printf "  3. Base16: Ocean (dark)\n"
  printf "  4. Base16: Ocean (light)\n"
  printf "  5. Base16: Flat (light)\n"
  read -p "> " -n 1;

  if [[ $REPLY == 1 ]]; then
    THEME="solarized-dark"
  elif [[ $REPLY == 2 ]]; then
    THEME="solarized-light"
  elif [[ $REPLY == 3 ]]; then
    THEME="base16-ocean-dark"
  elif [[ $REPLY == 4 ]]; then
    THEME="base16-ocean-light"
  elif [[ $REPLY == 5 ]]; then
    THEME="base16-flat-light"
  fi
else
  THEME=$1
fi
printf "\nUsing theme '$THEME'\n"

# setup powerline-shell
CONFIG="
SEGMENTS = [
  'set_term_title',
  'virtual_env',
  #'username',
  #'hostname',
  'datetime',
  'ssh',
  #'cwd',
  'cwd-mine',
  'read_only',
  'git-mine',
  #'hg',
  #'svn',
  #'fossil',
  'jobs',
  'root',
]
THEME='../../../themes/$THEME/powerline'"
cd $POWERLINE_DIR
echo "$CONFIG" > config.py
python install.py > /dev/null
cd -

declare -a files=(
  "aliases"
  "bash_logout"
  "bash_profile"
  "bash_prompt"
  "bashrc"
  "exports"
  "functions"
  "gitconfig"
  "gitignore"
  "gitmodules"
  "git-completion"
  "inputrc"
  "path"
  "profile"
  "wgetrc"
)

for file in "${files[@]}"; do
  ln -sf "$CONFIG_DIR/$file" "$HOME/.$file"
done

rm -rf  "$HOME/.vim"
ln -s   "$CONFIG_DIR/vim"                             "$HOME/.vim"
ln -sf  "$CONFIG_DIR/vimrc"                           "$HOME/.vimrc-main"
ln -sf  "$SCRIPT_DIR/themes/$THEME/vimrc"             "$HOME/.vimrc"
ln -sf  "$POWERLINE_DIR/powerline-shell.py"           "$HOME/powerline-shell.py"
ln -sf  "$CONFIG_DIR/terminator/config"               "$HOME/.config/terminator/config"
ln -sf  "$CONFIG_DIR/powerline/segments/git.py"       "$POWERLINE_DIR/segments/git-mine.py"
ln -sf  "$CONFIG_DIR/powerline/segments/cwd.py"       "$POWERLINE_DIR/segments/cwd-mine.py"
ln -sf  "$CONFIG_DIR/powerline/segments/datetime.py"  "$POWERLINE_DIR/segments/datetime.py"

unset files
unset file

# dircolors "$SCRIPT_DIR"/lib/dircolors-solarized/dircolors.ansi-dark

source "$HOME/.bash_profile"

unset SCRIPT_DIR
unset POWERLINE_DIR
unset THEME

printf "\n... done.\n"

