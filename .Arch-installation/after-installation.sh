#!/bin/bash

myname="moroclash"

###################################
#change hostname
###################################
echo "change hostname ........."
hostname="/etc/hostname"
>  $hostname
echo $myname >> $hostname
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
    yes | sudo pacman -S  git bash-completion
    yes | pacman -S awesome lxdm alsa-utils xf86-video-ati xdg-user-dirs
    yes | pacman -S adobe-source-code-pro-fonts
    yes |  pacman -S exfat-utils gedit emacs nfs-utils cifs-utils
    yes | sudo pacman -S a52dec faac faad2 flac jasper lame libdca libdv libmad libmpeg2 libtheora libvorbis libxv wavpack x264 xvidcore flashplugin libdvdcss libdvdread libdvdnav  dvd+rw-tools dvdauthor dvgrab
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
    sed -i 'N;s/#\[multilib\]\n#Include = \/etc\/pacman.d\/mirrorlist/\[multilib\]\nInclude = \/etc\/pacman.d\/mirrorlist/'  /etc/packman.conf

    #adding fr repo as pacman mirrors
    echo "[archlinuxfr]
SigLevel=Never
Server=http://repo.archlinux.fr/$arch" >>  $Testfile
    
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
echo $myname "ALL=(ALL) ALL" >> /etc/sudors
echo "Adding new user '"${myname}"'"
###################################



