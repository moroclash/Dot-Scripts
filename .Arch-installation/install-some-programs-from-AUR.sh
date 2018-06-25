#!/bin/bash

#to install some important programs for AUR


mkdir ~/program
git clone https://aur.archlinux.org/google-chrome.git ~/program/
~/program/google-chrome/makepkg -Acs
sudo pacman -U ~/program/google-chrome/*.tar.xz
