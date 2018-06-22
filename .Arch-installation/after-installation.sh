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
    yes | sudo pacman -S xorg-server xorg-xinit 
    sudo pacman -S  xorg-drivers
    yes | sudo pacman -S  git bash-completion
    yes | pacman -S awesome lxdm alsa-utils xf86-video-ati xdg-user-dirs
}

if install ; then # TRY
    echo "instllation pachages Done!!! :)"
else # CATCH
    echo "check the your PackageManager  :("
fi
###################################

###################################
#run some commands
###################################
echo "run some commands ......."
function running(){
    xdg-user-dirs-update
    sed -i 's/#\[multilib\]/\[multilib\]/' /etc/pacman.conf 
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



