# This is my personal .zshrc. I have taken most of the prompt setup
# from the http://peepcode.com page on zsh prompt and just tweaked
# it all a bit to use the colors I want and to make it work relative
# to my .zsh directory setup.
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"

# RVM
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi

# Colors
autoload -U colors
colors
setopt prompt_subst

# Prompt
local smiley="%(?,%{$fg[green]%}☺%{$reset_color%},%{$fg[red]%}☹%{$reset_color%})"

PROMPT='
%~
${smiley}  %{$reset_color%}'

RPROMPT='%{$fg[white]%} $(~/.rvm/bin/rvm-prompt)$(~/.zsh/bin/git-cwd-info.rb)%{$reset_color%}'

# Show completion on first TAB
setopt menucomplete

# Load completions for Ruby, Git, etc.
autoload compinit
compinit

# Alias clear
alias c="clear"
alias ls="ls -G"

# Git aliases
alias g="git"

# Bundle aliases
alias be='bundle exec'
alias bec='be cucumber'
alias ber='be rspec --color --drb'
alias beg='be guard'

# My default editor settings
export EDITOR="vim"
