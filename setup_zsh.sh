main() {
  # Use colors, but only if connected to a terminal, and that terminal
  # supports them.
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

  # Only enable exit-on-error after the non-critical colorization stuff,
  # which may fail on systems lacking tput or terminfo
  set -e

  if ! command -v zsh >/dev/null 2>&1; then
    printf "${YELLOW}Zsh is not installed!${NORMAL} Please install zsh first!\n"
    exit
  fi

  if [ ! -n "$ZSH" ]; then
    ZSH=~/.oh-my-zsh
  fi

  if [ -d "$ZSH" ]; then
    printf "${YELLOW}You already have Oh My Zsh installed.${NORMAL}\n"
    printf "You'll need to remove $ZSH if you want to re-install.\n"
    exit
  fi

  # Prevent the cloned repository from having insecure permissions. Failing to do
  # so causes compinit() calls to fail with "command not found: compdef" errors
  # for users with insecure umasks (e.g., "002", allowing group writability). Note
  # that this will be ignored under Cygwin by default, as Windows ACLs take
  # precedence over umasks except for filesystems mounted with option "noacl".
  umask g-w,o-w

  printf "${BLUE}Cloning Oh My Zsh...${NORMAL}\n"

  env git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git "$ZSH" || {
    printf "Error: git clone of oh-my-zsh repo failed\n"
    exit 1
  }

  if [ ! -f ~/.zshrc ] && [ ! -h ~/.zshrc ]; then
    printf "${YELLOW}WARNING: NO ~/.zshrc FOUND!${NORMAL} Have you run install.sh yet?\n";
  fi

  # If this user's login shell is not already "zsh", attempt to switch.
  TEST_CURRENT_SHELL=$(basename "$SHELL")
  if [ "$TEST_CURRENT_SHELL" != "zsh" ]; then
    # If this platform provides a "chsh" command (not Cygwin), do it, man!
    if hash chsh >/dev/null 2>&1; then
      printf "${BLUE}Time to change your default shell to zsh!${NORMAL}\n"
      chsh -s $(grep /zsh$ /etc/shells | tail -1)
    # Else, suggest the user do so manually.
    else
      printf "I can't change your shell automatically because this system does not have chsh.\n"
      printf "${BLUE}Please manually change your default shell to zsh!${NORMAL}\n"
    fi
  fi

  printf "${GREEN}"
  echo '         __                                     __   '
  echo '  ____  / /_     ____ ___  __  __   ____  _____/ /_  '
  echo ' / __ \/ __ \   / __ `__ \/ / / /  /_  / / ___/ __ \ '
  echo '/ /_/ / / / /  / / / / / / /_/ /    / /_(__  ) / / / '
  echo '\____/_/ /_/  /_/ /_/ /_/\__, /    /___/____/_/ /_/  '
  echo '                        /____/                       ....is now installed!'
  echo ''
  echo ''
  printf "${NORMAL}"
}

install_plugin () {
  SHORTNAME=$(basename "$1")
  printf "Installing plugin '$SHORTNAME' from $1...\n"
  env git clone --depth=1 $1 "$ZSH/plugins/$SHORTNAME" || {
    printf "${RED}Error: installing plugin $SHORTNAME failed!${NORMAL}\n"
    exit 1
  }
}

main

install_plugin "https://github.com/joshskidmore/zsh-fzf-history-search"
install_plugin "https://github.com/zsh-users/zsh-autosuggestions"
install_plugin "https://github.com/zsh-users/zsh-syntax-highlighting"

mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

env zsh -l
