# This is my personal .zshrc. I have taken most of the prompt setup
# from the http://peepcode.com page on zsh prompt and just tweaked
# it all a bit to use the colors I want and to make it work relative
# to my .zsh directory setup.

#########################
# Prompt
#########################

PROMPT='
%~
%(?,%{$fg[green]%}✔%{$reset_color%},%{$fg[red]%}✘%{$reset_color%}) %{$reset_color%}'

# visual separater in the prompt
setopt promptsubst
PS1=$'%U${(r:$COLUMNS:: :)}%u'$PS1

# if [ -e ~/.rvm/bin/rvm-prompt ]; then
#   RPROMPT='%{$fg[white]%} $(~/.rvm/bin/rvm-prompt)$(~/.zsh/bin/git-cwd-info.rb)%{$reset_color%}'
# el
# if [ -e ~/.zsh/bin/rbenv-prompt ]; then
#   RPROMPT='%{$fg[white]%} $(~/.zsh/bin/rbenv-prompt)$(~/.zsh/bin/git-cwd-info.rb)%{$reset_color%}'
# else
  RPROMPT='%{$fg[white]%} $(~/.zsh/bin/git-cwd-info.rb)%{$reset_color%}'
# fi

# eval "$(starship init zsh)"

#########################
# Set Vi mode
#########################

# Enable vi's normal mode for editing the command line after you hit escape.
set -o vi
# set -o emacs

#########################
# Vim key pass through 
#########################

# This is necessary for the Ctrl-s keyboard shortcut to make it through to Vim
stty -ixon

#########################
# GPG Agent
#########################
# if [ -z "$(pgrep gpg-agent)" ]; then # not running
#   gpgconf --launch gpg-agent 
# fi

# if [ -f ~/.gnupg/.gpg-agent-info ]; then
#   echo "DREW: found ~/.gnupg/.gpg-agent-info"
#   if [ -n "$(pgrep gpg-agent)" ]; then
#     echo "DREW: found gpg-agent running"
#     source ~/.gnupg/.gpg-agent-info
#     export GPG_AGENT_INFO
#   else
#     echo "DREW: didn't find gpg-apgent running"
#     echo "DREW: shit"
#   fi
# else
#   echo "DREW: could NOT find ~/.gnupg/.gpg-agent-info"
#   echo "DREW: starting gpg-apgent"
#   eval $(gpg-agent --daemon)
# fi

#########################
# Environment Variables
#########################

export PATH="$HOME/bin:$HOME/.tmux/bin:$HOME/fvm/default/bin:$HOME/.cargo/bin:$HOME/.jenv/shims:/usr/local/sbin:/usr/local/bin:/usr/local/heroku/bin:/usr/local/share/npm/bin:/usr/local/texlive/2013basic/bin/x86_64-darwin:/usr/sbin:/sbin:$HOME/.datomic/cli-0.10.89:$PATH"
# export PATH="$HOME/code/oss/flutter/bin:/usr/local/opt/curl/bin:$HOME/bin:$HOME/.cargo/bin:/usr/local/heroku/bin:/usr/local/share/npm/bin:$PATH"
# export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"
# source ~/.zsh/homebrew.sh
# source ~/.zsh/andrewdeponte_dot_com_middleman_s3_sync_creds

#########################
# Cassandra Helpers
#########################

# Helper functions for cassandra
# function start_cassandra() {
#   jenv shell 1.7
#   cassandra -f
# }

# function start_dse() {
#   jenv shell 1.6
#   /opt/local/dse-2.2.1/bin/dse cassandra -f
# }

#########################
# History Settings
#########################

export HISTFILE=~/.history
export HISTSIZE=1000
export SAVEHIST=1000

setopt inc_append_history # append history item at execution
setopt hist_ignore_dups # ignore dups that immediately follow eachother
bindkey "^R" history-incremental-search-backward

#########################
# File Settings
#########################

# set the number of open files to be 1024
ulimit -S -n 1024

#########################
# Display Settings
#########################

# Colors
autoload -U colors
colors
setopt prompt_subst
# Show completion on first TAB
setopt menucomplete

#########################
# Completion Settings
#########################

# Load completions for Ruby, Git, etc.
if [ -f "/opt/homebrew/bin/brew" ]; then
	fpath=(/opt/homebrew/share/zsh/site-functions/ $fpath)
fi
if [ -f "/usr/local/bin/brew" ]; then
	fpath=(/usr/local/share/zsh/site-functions/ $fpath)
fi
autoload -Uz compinit
compinit

#########################
# Aliases
#########################


alias sublm="open -a 'Sublime Merge'"
alias mailmark="open -a 'MailMark'"

# Alias clear
# alias c="clear"
alias ls="ls -G"

# Flutter / FVM
alias f="fvm flutter"
alias d="fvm dart"

#########################
# Fun Aliases
#########################
# alias animals="curl -s http://animals.ivolo.me/"
# alias fact="elinks -dump randomfunfacts.com | sed -n '/^| /p' | tr -d \|"

#########################
# Git Aliases
#########################

# Git aliases
# alias g="git"
# alias fetch="echo 'Good boy! Go get those branches!' && git fetch --all -p && animals"
# alias gco="git co \$(git branch | selecta)"

#########################
# Ruby/Rails Aliases
#########################

# Bundle aliases
alias be='bundle exec'
# alias bec='be cucumber'
# alias ber='be rspec --color'
# alias zr='zeus rspec'
# alias zc='zeus cucumber'
# alias beg='be guard'
# alias gsb='for k in `git branch|perl -pe "s/^..//"`;do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k|head -n 1`\\t$k;done|sort -r'

#########################
# Tmux Session Aliases
#########################

# Personal projects
# alias cyph='~/.tmux/cyph.sh'
# alias ustackit='~/.tmux/ustackit.sh'
# alias codebreakdown='~/code/bbsoft/codebreakdown/stmux'
# alias todo='~/.tmux/todos.sh'

# # OpenSource Projects
# alias octopusci='~/.tmux/octopusci.sh'
# alias octopusci-head='~/.tmux/octopusci-head.sh'

# # Work Projects
# alias rlapi_ruby='~/.tmux/rlapi_ruby.sh'
# alias replywise_reachlocal_event_consumer='~/.tmux/replywise_reachlocal_event_consumer.sh'
# alias thrift_jms_map_json='~/.tmux/thrift_jms_map_json.sh'
# alias rpp_web_app='~/code/reachlocal/rpp_web_app/stmux'
# alias capture_api='~/code/reachlocal/capture_api/stmux'
# alias capture_js_config_api='~/code/reachlocal/capture_js_config_api/stmux'
# alias edge-mobile-gateway='~/code/reachlocal/edge-mobile-gateway/stmux'

# # Side Projects
# alias orangecal_mobile='~/code/oldtown/orangecal_mobile/stmux'
# alias orangecal='~/code/oldtown/orangecal/stmux'

#########################
# Mac OS X Helpers
#########################

# Lock the screen (when going AFK)
# alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# function cdf() {  # short for cdfinder
#   cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
# }

# function o() {
#     if [ $# -eq 0 ]; then
#         open .;
#     else
#         open "$@";
#     fi;
# }

#########################
# Fun Helpers
#########################

function cow_norris() {
  curl -s http://api.icndb.com/jokes/random | ruby -e "require 'json'; require 'cgi'; puts \"http://cowsay.morecode.org/say?format=text&message=#{CGI.escape(JSON.parse(gets)['value']['joke'])}\"" | xargs curl
}

#########################
# Editor Settings
#########################

export VISUAL="nvim"
export EDITOR=$VISUAL

#########################
# Rbenv
#########################

if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi

#########################
# Jenv
#########################

if which jenv > /dev/null; then eval "$(jenv init - --no-rehash)"; fi

#########################
# swiftenv
#########################

# if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi

#########################
## pyenv
#########################

if which pyenv > /dev/null; then eval "$(pyenv init - --no-rehash)"; fi

#########################
# Boot2Docker
#########################

# eval "$(boot2docker shellinit 2>/dev/null)"

# Fun Hack to srew with Chad
# source ~/.env
# export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"


# fnm
autoload -U add-zsh-hook
_fnm_autoload_hook () {
if [[ -f .node-version && -r .node-version ]]; then
    echo "fnm: Found .node-version"
    fnm use
elif [[ -f .nvmrc && -r .nvmrc ]]; then
    echo "fnm: Found .nvmrc"
    fnm use
fi
}
add-zsh-hook chpwd _fnm_autoload_hook

eval "$(fnm env)"
