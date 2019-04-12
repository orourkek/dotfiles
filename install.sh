#!/usr/bin/env bash

# use colors if connected to a terminal that supports it
if which tput >/dev/null 2>&1; then
    ncolors=$(tput colors)
fi
if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
  RED="$(tput setaf 1)"
  GREEN="$(tput setaf 2)"
  YELLOW="$(tput setaf 3)"
  BLUE="$(tput setaf 4)"
  BOLD="$(tput bold)"
  NORMAL="$(tput sgr0)"
else
  RED=""
  GREEN=""
  YELLOW=""
  BLUE=""
  BOLD=""
  NORMAL=""
fi

log () {
  printf "  [${BLUE} ➔ ${NORMAL}] $1\n"
}

warn () {
  printf "  [${YELLOW} ❖ ${NORMAL}] $1 \n"
}

success () {
  printf "  [${GREEN} ✔ ${NORMAL}] $1\n"
}

fail () {
  printf "  [${RED} ✖ ${NORMAL}] $1\n"
  echo ''
  exit 1
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
      warn "File already exists: `basename $source`, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
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

main() {
  set -e
  DOTFILES_ROOT="`pwd`"

  log 'symlinking dotfiles...'

  for source in `find $DOTFILES_ROOT -maxdepth 2 -name \*.symlink`
  do
    dest="$HOME/.`basename \"${source%.*}\"`"
    symlink_confirm $source $dest
  done

  success "All done!"
}

main
