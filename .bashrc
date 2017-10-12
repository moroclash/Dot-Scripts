# Enable tab completion
source ~/git-completion.bash

# colors!
green="\[\033[0;32m\]"
blue="\[\033[0;36m\]"
purple="\[\033[0;37m\]"
reset="\[\033[1;33m\]"


# Change command prompt
source ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
PS1="$purple\u$green\$(__git_ps1)$blue \W \$ $reset"


alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias netbeans='/usr/local/netbeans-8.0.2/bin/./netbeans &'
alias eclipse='/home/moroclash/eclipse/java-oxygen/eclipse/./eclipse &'
alias hotspot1='sudo /home/moroclash/Program/create_ap-master/./create_ap wlp2s0 enp1s0 moro 12345678'
alias hotspot2='sudo /home/moroclash/Program/create_ap-master/./create_ap wlp2s0 wlp2s0 moro 12345678'
alias octave-ter='octave --no-gui'


##my conf to open folders
#alias me='cd /run/media/moroclash/computer\ scince/'
#alias meo='xdg-open /run/media/moroclash/computer\ scince/'
#alias me1='cd /run/media/moroclash/computer\ scince/CS/1/'
#alias me1o='xdg-open /run/media/moroclash/computer\ scince/CS/1/'
#alias me2='cd /run/media/moroclash/computer\ scince/CS/2/'
#alias me2o='xdg-open /run/media/moroclash/computer\ scince/CS/2/'
#alias me3='cd /run/media/moroclash/computer\ scince/CS/3/'
#alias me3o='xdg-open /run/media/moroclash/computer\ scince/CS/3/'

##apache conf
#alias apache-start='cd /usr/local/apache/bin/; sudo ./apachectl start'
#alias apache-stop='cd /usr/local/apache/bin/; sudo ./apachectl stop'
#alias apache-restart='cd /usr/local/apache/bin/; sudo ./apachectl restart'


##nginX conf
#alias nginx-start='cd /usr/local/nginx/sbin/; sudo ./nginx'
#alias nginx-stop='cd /usr/local/nginx/sbin/; sudo ./nginx -s stop'
#alias nginx-reload='cd /usr/local/nginx/sbin/; sudo ./nginx -s reload'
#this to reopening the log files
#alias nginx-reopen='cd /usr/local/nginx/sbin/; sudo ./nginx -s reopen'


#git shourt cuts
alias gitl='git log --graph --abbrev-commit --decorate --date=format:"%Y-%m-%d %H:%M:%S" --format=format:"%C(bold blue)%h%C(reset) - %C(bold cyan)%ad%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n""          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)"'

#to open vi IMproved when use command "vi/vim"
#alias vi='vim'

# added by Anaconda3 4.4.0 installer
export PATH="/home/moroclash/anaconda3/bin:$PATH"
