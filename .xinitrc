#feh --bg-scale ~/Downloads/wallpaper.jpg &
xrdb .Xresources &
dbus-update-activation-environment --systemd DISPLAY XAUTHORITY &
#exec firefox-developer-edition
#xinput --set-prop "pointer:Logitech PRO X" "Coordinate Transformation Matrix" 0.5 0 0 0 0.5 0 0 0 1
#setxkbmap -option caps:swapcaps & 
#xcape -e 'Control_L=Escape' &

# For Gpro superlight, enable both of these
# xinput --set-prop "pointer:Logitech USB Receiver" "Coordinate Transformation Matrix" 0.4 0 0 0 0.4 0 0 0 1 &
# xinput --set-prop "pointer:Logitech PRO X Wireless" "Coordinate Transformation Matrix" 0.4 0 0 0 0.4 0 0 0 1 &

# For MX master mouse
xinput --set-prop "pointer:Logitech USB Receiver Mouse" "Coordinate Transformation Matrix" 0.8 0 0 0 0.8 0 0 0 1 &

xrandr --output HDMI-1 --left-of DP-2
xset r rate 350 40

iw dev wlp4s0 connect 94
wpa_supplicant -B -i wlp4s0 -c /etc/wpa_supplicant/wpa_supplicant.conf
dhcpcd wlp4s0

exec xmonad
