# This is my personal .zshrc. I have taken most of the prompt setup
# from the http://peepcode.com page on zsh prompt and just tweaked
# it all a bit to use the colors I want and to make it work relative
# to my .zsh directory setup.

# Prompt
local smiley="%(?,%{$fg[green]%}☺%{$reset_color%},%{$fg[red]%}☹%{$reset_color%})"

PROMPT='
%~
${smiley}  %{$reset_color%}'

if [ -e ~/.rvm/bin/rvm-prompt ]; then
  RPROMPT='%{$fg[white]%} $(~/.rvm/bin/rvm-prompt)$(~/.zsh/bin/git-cwd-info.rb)%{$reset_color%}'
else
  RPROMPT='%{$fg[white]%} $(~/.zsh/bin/git-cwd-info.rb)%{$reset_color%}'
fi

# Enable vi's normal mode for editing the command line after you hit escape.
set -o vi
set -o emacs

# This is necessary for the Ctrl-s keyboard shortcut to make it through to Vim
stty -ixon

