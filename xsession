#!/bin/sh

while true; do ssh-agent -D -a "$SSH_AUTH_SOCK"; done&
while true; do gpg-agent --supervised; done&
while true; do dwmstatus; done&
while true; do redshift; done&
while true; do compton --backend glx; done&

setxkbmap -option compose:lwin
xrandr --output DP-1 --above eDP-1

exec dwm 2>> $HOME/logs/dwm.err >> $HOME/logs/dwm.log
