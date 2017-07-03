#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#to enable switch  keyboar layout us,ara
setxkbmap -model pc104 -layout us,ara -variant ,qwerty -option grp:alt_space_toggle &
# ot make increase mouse speed
xinput set-prop 11 'Synaptics Move Speed' 2.000000 3.750000 0.097460 0.000000 &
#to make touchbad click work
xinput set-prop 11 'Synaptics Tap Action' 1 1 1 1 1 1 1 &

#to run xbindkeys
xbindkeys &

#to see battery icone state
cbatticon &
exec awesome
#twm &
#xclock -geometry 50x50-1+1 &

#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login
