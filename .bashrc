#hadoop command.
#source ~/Program/hadoop2/commands.sh

# Enable tab completion
source ~/.scripts/git-completion.bash

# Enable My alies's
source ~/.scripts/my-alias.sh


# colors!
green="\[\033[0;32m\]"
blue="\[\033[0;36m\]"
purple="\[\033[0;37m\]"
reset="\[\033[1;33m\]"

# Change command prompt
source ~/.scripts/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
PS1="$purple\u$green\$(__git_ps1)$blue \W \$ $reset"

# added by Anaconda3 4.4.0 installer
export PATH="/home/moroclash/anaconda3/bin:$PATH"
export PATH=~/.npm-global/bin:$PATH
