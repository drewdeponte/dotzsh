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

# Set the term to xterm at 16 colors rather than the xterm-256color mode
# which tells it to use 256 colors. It is important that terminal themes
# intended for 16 colors are used in 16 color mode and themes intended
# for 256 colors are used in 256 color mode. Otherwise, the colors won't
# look correct. This also goes for Vim color schemes.
#
# Currently I have this set to xterm in 16 color mode as I have chosen
# to use the ir_black terminal theme and ir_black vim theme which are
# both intended for 16 color mode.
export TERM=xterm-256color

# Enable vi's normal mode for editing the command line after you hit escape.
set -o vi

# This is necessary for the Ctrl-s keyboard shortcut to make it through to Vim
stty -ixon

