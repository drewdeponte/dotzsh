# I added this in the ~/.zshenv file so that in non-interactive
# non-login shells they would still be able to find applications in
# /usr/local/bin. This is important for tmux.me for example, being able
# to find the tmux command.
# export PATH="/usr/local/bin:$PATH"

[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"
[ -f /usr/local/bin/brew ] && eval "$(/usr/local/bin/brew shellenv)"

#########################
# Rbenv
#########################

# if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi

#########################
# Jenv
#########################

# if which jenv > /dev/null; then eval "$(jenv init - --no-rehash)"; fi

#########################
## pyenv
#########################

# if which pyenv > /dev/null; then eval "$(pyenv init - --no-rehash)"; fi
source "$HOME/.cargo/env"
