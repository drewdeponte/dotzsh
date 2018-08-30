# I added this in the ~/.zshenv file so that in non-interactive
# non-login shells they would still be able to find applications in
# /usr/local/bin. This is important for tmux.me for example, being able
# to find the tmux command.
# export PATH="/usr/local/bin:$PATH"

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
