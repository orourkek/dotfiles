#!/usr/bin/env bash
#
# Install script from:
# https://github.com/dave-tucker/dotfiles

DOTFILES_ROOT="`pwd`"
POWERLINE_ROOT="$DOTFILES_ROOT/lib/powerline-shell"
DOTFILES_THEME="dark"

if [ $1 = "light" ]; then
  DOTFILES_THEME="light"
fi

set -e

echo ''

info () {
  printf "\r  [\033[00;34m ➔ \033[0m] $1\n"
}

user () {
  printf "\r  [\033[0;33m ❖ \033[0m] $1 \n"
}

success () {
  printf "\r\033[2K  [\033[00;32m ✔ \033[0m] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31m ✖ \033[0m] $1\n"
  echo ''
  exit
}

overwrite_all=false
backup_all=false
skip_all=false

symlink_confirm () {
  source=$1
  dest=$2

  if [ -f $dest ] || [ -d $dest ] || [ -h $dest ]
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
      mv $dest $dest\.BAK
      success "moved $dest to $dest.BAK"
    fi

    if [ "$skip" == "false" ] && [ "$skip_all" == "false" ]
    then
      symlink $source $dest
    else
      success "skipped $source"
    fi

  else
    symlink $source $dest
  fi
}

symlink () {
  ln -s $1 $2
  success "symlinked $1 to $2"
}

symlink_force () {
  ln -sf $1 $2
  success "symlinked (-f) $1 to $2"
}

setup_powerline() {
  info 'Setting up powerline...'
  symlink_force "$DOTFILES_ROOT/powerline/config.py" "$POWERLINE_ROOT/config.py"
  cd $POWERLINE_ROOT
  python "install.py" > /dev/null
  cd -
  symlink_force  "$POWERLINE_ROOT/powerline-shell.py" "$HOME/powerline-shell.py"
}

install_dotfiles () {
  info 'installing dotfiles'

  for source in `find $DOTFILES_ROOT -maxdepth 2 -name \*.symlink`
  do
    dest="$HOME/.`basename \"${source%.*}\"`"
    symlink_confirm $source $dest
  done
}

install_binaries () {
  info 'installing binaries'

  for source in `find $DOTFILES_ROOT/bin -type f -executable`
  do
    dest="$HOME/bin/`basename \"${source%}\"`"
    symlink_force $source $dest
  done
}

setup_powerline
install_dotfiles
install_binaries

#symlink  "$DOTFILES_ROOT/terminator/config"               "$HOME/.config/terminator/config"
# dircolors "$SCRIPT_DIR"/lib/dircolors-solarized/dircolors.ansi-dark

source "$HOME/.bash_profile"

unset DOTFILES_ROOT
unset POWERLINE_ROOT

success "All done!"

