# Environment
export PATH="$HOME/bin:$HOME/.jenv/shims:/usr/local/sbin:/usr/local/bin:/usr/local/heroku/bin:/usr/local/share/npm/bin:/usr/local/texlive/2013basic/bin/x86_64-darwin:$PATH"
export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home/"

# export RACK_ENV="development"
export PORT=8000

# Helper functions for cassandra
function start_cassandra() {
  jenv shell 1.7
  cassandra -f
}

function start_dse() {
  jenv shell 1.6
  /opt/local/dse-2.2.1/bin/dse cassandra -f
}

# set the number of open files to be 1024
ulimit -S -n 1024

# Colors
autoload -U colors
colors
setopt prompt_subst
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
alias ber='be rspec --color'
alias zr='zeus rspec'
alias zc='zeus cucumber'
alias beg='be guard'
alias gsb='for k in `git branch|perl -pe "s/^..//"`;do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k|head -n 1`\\t$k;done|sort -r'

# Tmux session aliases.

# Personal projects
alias cyph='~/.tmux/cyph.sh'
alias ustackit='~/.tmux/ustackit.sh'
alias codebreakdown='~/code/bbsoft/codebreakdown/stmux'
alias todo='~/.tmux/todos.sh'

# OpenSource Projects
alias octopusci='~/.tmux/octopusci.sh'
alias octopusci-head='~/.tmux/octopusci-head.sh'

# Work Projects
alias rlapi_ruby='~/.tmux/rlapi_ruby.sh'
alias replywise_reachlocal_event_consumer='~/.tmux/replywise_reachlocal_event_consumer.sh'
alias thrift_jms_map_json='~/.tmux/thrift_jms_map_json.sh'
alias rpp_web_app='~/code/reachlocal/rpp_web_app/stmux'
alias capture_api='~/code/reachlocal/capture_api/stmux'
alias capture_js_config_api='~/code/reachlocal/capture_js_config_api/stmux'
alias edge-mobile-gateway='~/code/reachlocal/edge-mobile-gateway/stmux'

# Side Projects
alias orangecal_mobile='~/code/oldtown/orangecal_mobile/stmux'
alias orangecal='~/code/oldtown/orangecal/stmux'

# My default editor settings
export EDITOR="vim"

# RVM
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi
# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# jenv
eval "$(jenv init - --no-rehash)"
