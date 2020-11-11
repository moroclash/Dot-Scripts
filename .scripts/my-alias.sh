alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias netbeans='/home/moroclash/config-programs/netbeans-8.2/bin/./netbeans &'
alias eclipse='/home/moroclash/eclipse/java-oxygen/eclipse/./eclipse &'
alias hotspot1='sudo create_ap wlp2s0 enp1s0 moro 12345678'
alias hotspot2='sudo create_ap wlp2s0 wlp2s0 moro 12345678'
alias octave-ter='octave --no-gui'


alias zoom='~/program/zoom_x86_64.pkg/opt/zoom/ZoomLauncher'

#wired network
alias wired-nw='sudo systemctl restart dhcpcd@enp1s0.service'


##my conf to open folders
alias mme='sudo mount -t ntfs-3g -o uid=$(id -u) /dev/sdb1 /home/moroclash/Desktop/mydata/; sudo mount -t ntfs-3g -o uid=$(id -u) /dev/sdb2  /home/moroclash/Desktop/cs/'
alias ume='sudo umount /home/moroclash/Desktop/mydata/; sudo umount /home/moroclash/Desktop/cs'
alias me='cd /home/moroclash/Desktop/cs/cs/'
alias meo='nautilus /home/moroclash/Desktop/cs/cs/'
alias me1='cd /home/moroclash/Desktop/cs/cs/1/'
alias me1o='nautilus /home/moroclash/Desktop/cs/cs/1/'
alias me2='cd /home/moroclash/Desktop/cs/cs/2/'
alias me2o='nautilus /home/moroclash/Desktop/cs/cs/2/'
alias me3='cd /home/moroclash/Desktop/cs/cs/3/'
alias me3o='nautilus /home/moroclash/Desktop/cs/cs/3/'
alias me4='cd /home/moroclash/Desktop/cs/cs/4/'
alias me4o='nautilus /home/moroclash/Desktop/cs/cs/4/'


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

#resize tmp folder
alias rstmp='sudo mount -o remount,size=8G,noatime /tmp'

#refresh arch keys
alias rfkeys='sudo pacman-key --refresh-keys'

#git shourt cuts
alias gitl='git log --graph --abbrev-commit --decorate --date=format:"%Y-%m-%d %H:%M:%S" --format=format:"%C(bold blue)%h%C(reset) - %C(bold cyan)%ad%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n""          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)"'

#to open vi IMproved when use command "vi/vim"
alias vi='vim'
alias l='ls'
alias lspro='pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -hr | head -25'


#android paths
export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:~/program/flutter/bin
export JAVA_HOME=~/program/android-studio/jre
export PATH=$HOME/.dotnet/tools:$PATH
alias android-linux='mkdir android/app/src/main/assets& react-native bundle --platform android --dev false --entry-file index.js --bundle-output android/app/src/main/assets/index.android.bundle --assets-dest android/app/src/main/res&'
