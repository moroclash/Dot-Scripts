#!/bin/bash

myname="moroclash"

###################################
#change hostname
###################################
echo "change hostname ........."
hostname="/etc/hostname"
>  $hostname
echo $myname | sudo tee -a $hostname
echo "adding hostname as '"$myname"'"
###################################


###################################
#install display manager
###################################
echo "install display manager and some packages......."
function install(){
    yes | sudo pacman -Syy
    yes | sudo pacman -S xorg-server xorg-xinit 
    sudo pacman -S  xorg-drivers
    yes | sudo pacman -S  git bash-completion wget
    yes | sudo pacman -S awesome lxdm alsa-utils xf86-video-ati xdg-user-dirs
    yes | sudo pacman -S adobe-source-code-pro-fonts gnome-screenshot
    yes | sudo pacman -S exfat-utils gedit emacs nfs-utils cifs-utils vlc xdg-utils perl-file-mimeinfo pamixer nautilus termite genius speedtest-cli create_ap
    yes | sudo pacman -S a52dec faac faad2 flac jasper lame libdca libdv libmad libmpeg2 libtheora libvorbis libxv wavpack x264 xvidcore flashplugin libdvdcss libdvdread libdvdnav  dvd+rw-tools dvdauthor dvgrab
    yes | sudo pacman -S xorg-xkill 
}

if install ; then # TRY
    echo "instllation pachages Done!!! :)"
else # CATCH
    echo "check the your PackageManager  :("
fi
###################################



###################################
#run some commands after-installation
###################################
echo "run some commands ......."
function running(){
    #to change dir's names of home in file manger 
    xdg-user-dirs-update
    #ro remove # from multilib from packman lists
    sudo sed -i 'N;s/#\[multilib\]\n#Include = \/etc\/pacman.d\/mirrorlist/\[multilib\]\nInclude = \/etc\/pacman.d\/mirrorlist/'  /etc/packman.conf

    #adding fr repo as pacman mirrors
    echo "[archlinuxfr]
SigLevel=Never
Server=http://repo.archlinux.fr/$arch" | sudo tee -a  /etc/pacman.conf 

    #to hidden grup menu and appeare when hold on shift key
    echo  "GRUB_FORCE_HIDDEN_MENU=\"true\"" | sudo tee -a /etc/default/grub
    wget https://gist.githubusercontent.com/anonymous/8eb2019db2e278ba99be/raw/257f15100fd46aeeb8e33a7629b209d0a14b9975/gistfile1.sh
    cat gistfile1.sh | sudo tee /etc/grub.d/holdshift
    sudo chmod a+x /etc/grub.d/holdshift
    sudo grub-mkconfig -o /boot/grub/grub.cfg
    rm gistfile1.sh
}

if running ; then # TRY
    echo "running Done!!! :)"
else # CATCH
    echo "problem with running :("
fi
###################################



###################################
#adding new user
###################################
useradd -m -g users -G adm,lp,scanner,audio,video,network,wheel,power,optical,storage,sys -s /bin/bash  $myname
passed omar
echo $myname "ALL=(ALL) ALL" | sudo tee -a /etc/sudors
echo "Adding new user '"${myname}"'"
###################################





###################################
#set Time Zone
###################################
timedatectl set-timezone Africa/Cairo
sudo ln -sf /usr/share/zoneinfo/Africa/Cairo /etc/localtime
echo "set Time zone Cairo"
###################################


