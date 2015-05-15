# My .zshrc setup

This is my personal **.zsh** directory setup which contains my **.zshrc** and
any dependency scripts that my **.zshrc** uses most likely for its prompts.

## Why use this **.zsh** setup.

This *.zsh* setup provides a number of very useful features which are
outlined below and a number of wich can be seen in the screenshot below.

* Path in upper left prompt out of the way of normal command prompt
* Last command success/failure respective smiley/frown icon
* RVM prompt showing current ruby version and gemset if found
* Time since last git commit (less than 10 min - gray, greater than 10 min but
  less than 30 min yellow, greater than 30 mins - red). This is simply useful
  as reminder to try to keep your git commits small and logically chunked.
* The currently checkout branch when you are in a git repository.
* SHA1 of the HEAD when you are in a Git repository.
* Local git repository dirty bit to tell you what your local un-staged
  changes.
* Git command line tab completion including support for most git command
  arguments and switches as well.
* Zsh is almost 100% compatible with Bash so all your Bash knowledge is still
  valuable.

To see how the various features listed above appear when using this *.zsh*
setup please checkout the screenshot below.

![Screenshot showing most of the features](images/prompt_screenshot.png?raw=true)

## Set shell to /bin/zsh

If you are on a Mac OS X box and want to use this **.zsh** setup you have to
first switch your account to use `/bin/zsh`. This is done by following the
steps presented below.

1. Go to **System Preferences**
2. Select **Users & Groups** under the **System** section
3. Click the Lock icon in the lower left corner to unlock the preferences
4. Enter your password to actually unlock the preferences
5. Right click on your user in the list on the left and select **Advanced
   Options**
6. From the **Login shell:** drop-down select `/bin/zsh`
7. Click the **OK** button
8. Close **System Preferencs**

At this point if you create a new Terminal instance it should open up with
`/bin/zsh` as your shell. You can verify this by running the following command
and verifying that the output is `/bin/zsh`.

    echo $SHELL

Once you have verified you are running `/bin/zsh` as your shell you can
install this **.zsh** setup using the instructions below.

## Installation

To install this **.zsh** setup simply run the following commands.

    cd ~/
    git clone git@github.com:cyphactor/dotzsh.git ~/.zsh
    ln -s ~/.zsh/zshrc .zshrc
    ln -s ~/.zsh/zshenv .zshenv

## Update

To get the latest version of this setup at any time simply run the following
commands.

    cd ~/.zsh
    git pull --ff-only

Thats it! Assuming you didn't have any local commits that prevent it from
being fast-forwarded when pulled in. If you do happen to have local changes
commited to the **master** branch locally, you should really create a new
topic branch pointing to them and reset --hard your local master back to the
official origins remote master.

# Credit

I must give credit where credit is due. I have taken pieces of various peoples
*.zsh* setups over the years to build this one. The primary two that I can
think of are the [PeepCode - My Command Line
Prompt](http://peepcode.com/blog/2012/my-command-line-prompt) blog post, and
stuff I have seen Gary Bernhardt of [Destroy All
Software](http://www.destroyallsoftware.com) do. My prompt looks very similar
to the PeepCode layout though I have reworked the scripts largely and to allow
for other features I provided and to make it generic and easily installed.
