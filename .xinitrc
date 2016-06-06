#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# Setting the logitech mouse sensitivity

# Find the id number of the logitech mouse
IDLINE=$(xinput --list | grep "Logitech Unifying Device")

# Check if one exists
if [ -n "$IDLINE" ]; then
	# Uses grep to only get the part with id
	IDNUM=$(echo "$IDLINE" | grep -o 'id=.*'$'\t' | cut -d = -f 2)
	xinput --set-ptr-feedback $IDNUM 10 1 1
fi

# Vsync
compton --config ~/.config/compton/compton.conf&

# Volume settings
volti&

# Network settings
wicd-client -t&

# Special font setting
xset fp+ $HOME/Documents/fonts
xset fp rehash

# Set terminal theme
xrdb -merge ~/.Xresources

# Mount NAS
# echo Rockman.exe | sshfs -o password_stdin temeyun@temeyun.tk:/mnt/Storage/myNAS ~/nas/internet
# echo Rockman.exe | sshfs -o password_stdin temeyun@191.168.0.18:/mnt/Storage/myNAS ~/nas/LAN

# invoke global X session script
. /etc/X11/Xsession
