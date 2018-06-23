#!/bin/bash

#to append my Scripts in there place automaticly
cd ~
git clone https://github.com/moroclash/Dot-Scripts.git
cd Dot-Scripts
git checkout  Arch-Linux-Config 
mv .Arch-installation ~
mv .scripts ~
mv .Xresources ~
mv .git ~
mv .bashrc ~
mv .emacs ~
mv .gitconfig ~
mv .gitignore ~
mv .rtorrent.rc ~
mv .xbindkeysrc ~
mv .xinitrc ~
cd .config
rm -rf ~/.config/awesome/
mv awesome ~/.config/
rm -rf ~/.config/termite/
mv termite ~/.config/

echo "script in ther place Done!!! :)"
cd ~
rm -rf Dot-Scripts 

#make default terminal show .bashrc
sudo  echo "source  ~/.bashrc " >> /etc/profile
