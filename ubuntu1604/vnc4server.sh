#!/bin/bash

sudo apt udpate
sudo apt install -y vnc4server gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal

if [ ! -f ~/.vnc ];then
  vncserver :1
  vncserver -kill :1
fi

cat << 'EOT' > ~/.vnc/xstartup
#!/bin/sh

export XKL_XMODMAP_DISABLE=1
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS

[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
xsetroot -solid grey
vncconfig -iconic &
gnome-panel &
gnome-settings-daemon &
metacity &
nautilus &
gnome-terminal &
EOT

vncserver :1

