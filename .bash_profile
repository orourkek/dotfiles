
# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{aliases,bash_logout,bash_prompt,exports,functions,path}; do
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

function echoi() {
  echo -e "  $1" | sed ':a;N;$!ba;s/\n/\n  /g'
  echo $2
}

function greeting() {
  declare -a greetings=(
    "──────────██▄▄───────\n──────────██▀▀───────\n────────▄███▄────────\n──────▄█████─────────\n─▀▄▄▀▀──█▄─█▄────────"
  )

  echoi ${greetings[$RANDOM % ${#greetings[@]} ]}
}

echo
echoi "Welcome to the matrix!"
echo
greeting;

if which fortune >/dev/null; then
  echoi "$(fortune)"
fi

