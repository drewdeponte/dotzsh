# Environment
export PATH="$HOME/bin:$HOME/dev/tools/adt-bundle-mac-x86_64/sdk/tools:$HOME/dev/tools/adt-bundle-mac-x86_64/sdk/platform-tools:/usr/local/bin:/opt/local/dse-2.2.2/bin:/opt/local/opscenter-2.1.3/bin:/usr/local/share/npm/bin:$PATH"
export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home/"

# export RACK_ENV="development"
export PORT=8000

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
alias beg='be guard'
alias gsb='for k in `git branch|perl -pe "s/^..//"`;do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k|head -n 1`\\t$k;done|sort -r'

# Tmux session aliases.
alias rpp_web_app='~/code/reachlocal/rpp_web_app/stmux'
alias cyph='~/.tmux/cyph.sh'
alias octopusci='~/.tmux/octopusci.sh'
alias octopusci-head='~/.tmux/octopusci-head.sh'
alias ustackit='~/.tmux/ustackit.sh'
alias thrift_jms_map_json='~/.tmux/thrift_jms_map_json.sh'
alias rlapi_ruby='~/.tmux/rlapi_ruby.sh'
alias replywise_reachlocal_event_consumer='~/.tmux/replywise_reachlocal_event_consumer.sh'
alias todo='~/.tmux/todos.sh'
alias codebreakdown='~/code/bbsoft/codebreakdown/stmux'
alias capture_api='~/code/reachlocal/capture_api/stmux'
alias capture_js_config_api='~/code/reachlocal/capture_js_config_api/stmux'
alias edge-mobile-gateway='~/code/reachlocal/edge-mobile-gateway/stmux'
alias orangecal_mobile='~/code/oldtown/orangecal_mobile/stmux'
alias orangecal='~/code/oldtown/orangecal/stmux'

# My default editor settings
export EDITOR="vim"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# RVM
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi
# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
