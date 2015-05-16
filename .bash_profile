
# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{aliases,bash_logout,bash_prompt,exports,functions,git-completion,path}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh;

# open up X access control for mezzanine
if which xhost >/dev/null; then
  xhost + > /dev/null
fi

function greeting() {
  declare -a greetings=(
    #"  ──────────██▄▄───────\n  ──────────██▀▀───────\n  ────────▄███▄────────\n  ──────▄█████─────────\n  ─▀▄▄▀▀──█▄─█▄────────"
    "                   ____==========_______ \n        _--____   |    | \"\"  \" \"|       \n       /  )8}  ^^^| 0  |  =     |  o  0  | \n     </_ +-==B vvv|''  |  =     | '  '' '| \n        \_____/   |____|________|________| \n                 (_(  )\________/___(  )__) \n                   |\  \            /  /\ \n                   | \  \          /  /\ \ \n                   | |\  \        /  /  \ \ \n                   (  )(  )       (  \   (  ) \n                    \  / /        \  \   \  \ \n                     \|  |\        \  \  |  | \n                      |  | )____    \  \ \  )___ \n                      (  )  /  /    (  )  (/  / \n                     /___\ /__/     /___\ /__/"
    "               |||      |||\n               | |  __  | |\n|-|_____-----/   |_|  |_|   \-----_____|-|\n|_|_________{   }|  (^) |{  }__________|_|\n ||          |_| |   ^  | |_|          ||\n |              \|  /\  |/              |\n |               \ |--| /               |\n =               \ |__| /               =\n +               \      /               +\n                  \    /\n                  \    /\n                   \  /\n                   \  /\n                   \  /\n                   \  /\n                   \  /\n                   \  /\n                    \/"
    "                c==o\n              _/____\_\n       _.,--'\" ||^ || \"\`z._\n      /_/^ ___\||  || _/o\ \"\`-._\n    _/  ]. L_| || .||  \_/_  . _\`--._\n   /_~7  _ . \" ||. || /] \ ]. (_)  . \"\`--.\n  |__7~.(_)_ []|+--+|/____T_____________L|\n  |__|  _^(_) /^   __\____ _   _|\n  |__| (_){_) J ]K{__ L___ _   _]\n  |__| . _(_) \\\\v     /__________|________\n  l__l_ (_). []|+-+-<\^   L  . _   - ---L|\n   \__\    __. ||^l  \Y] /_]  (_) .  _,--'\n     \~_]  L_| || .\ .\\/~.    _,--'\"\n      \_\ . __/||  |\  \\\`-+-<'\"\n        \"\`---._|J__L|X o~~|[\\\\\\ \n               \____/ \___|[//\n                \`--'   \`--+-'"
  )
  #message="\n${greetings[$RANDOM % ${#greetings[@]} ]}"
  if which fortune >/dev/null; then
    message="$message\n\n$(fortune)"
  fi
  #echo message
  echo -e "  $message\n" | sed ':a;N;$!ba;s/\n/\n  /g'
}

greeting
