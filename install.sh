#!/usr/bin/env bash
#
# Install script from:
# https://github.com/dave-tucker/dotfiles

DOTFILES_ROOT="`pwd`"
POWERLINE_ROOT="$DOTFILES_ROOT/lib/powerline-shell"

set -e

echo ''

info () {
  printf "  [ \033[00;34m..\033[0m ] $1"
}

user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

link_files () {
  ln -s $1 $2
  success "linked $1 to $2"
}

setup_powerline() {
  # setup powerline-shell
  CONFIG="
  SEGMENTS = [
    'set_term_title',
    'virtual_env',
    'username',
    #'hostname',
    #'datetime',
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
  THEME='../../powerline/theme-dark.py'"
  cd $POWERLINE_ROOT
  echo "$CONFIG" > config.py
  python install.py > /dev/null
  cd -
}

install_dotfiles () {
  info 'installing dotfiles'

  overwrite_all=false
  backup_all=false
  skip_all=false

  for source in `find $DOTFILES_ROOT -maxdepth 2 -name \*.symlink`
  do
    dest="$HOME/.`basename \"${source%.*}\"`"

    if [ -f $dest ] || [ -d $dest ]
    then

      overwrite=false
      backup=false
      skip=false

      if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
      then
        user "File already exists: `basename $source`, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac
      fi

      if [ "$overwrite" == "true" ] || [ "$overwrite_all" == "true" ]
      then
        rm -rf $dest
        success "removed $dest"
      fi

      if [ "$backup" == "true" ] || [ "$backup_all" == "true" ]
      then
        mv $dest $dest\.backup
        success "moved $dest to $dest.backup"
      fi

      if [ "$skip" == "false" ] && [ "$skip_all" == "false" ]
      then
        link_files $source $dest
      else
        success "skipped $source"
      fi

    else
      link_files $source $dest
    fi

  done
}

setup_powerline
install_dotfiles

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

