#!/bin/sh

tmux new-session -d -P -t boot

tmux new-window -d -t boot:0 -n slock 'while true; do sinac -w 60; slock; done'
tmux new-window -d -t boot:1 -n dwmstatus 'while true; do dwmstatus; done'
tmux new-window -d -t boot:2 -n redshift 'while true; do redshift; done'
tmux new-window -d -t boot:3 -n sshagent 'while true; do rm "$SSH_AUTH_SOCK"; ssh-agent -D -a "$SSH_AUTH_SOCK"; done'
tmux new-window -d -t boot:4 -n compton 'while true; do compton --backend glx; done'

setxkbmap -option compose:lwin
xrandr --output DP-1 --above eDP-1

exec dwm 2> >(ts >> $HOME/logs/dwm.err) | ts >> $HOME/logs/dwm.log

tmux kill-session -t boot
