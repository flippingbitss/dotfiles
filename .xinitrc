#feh --bg-scale ~/Downloads/wallpaper.jpg &
xrdb .Xresources &
#exec firefox-developer-edition

setxkbmap -option caps:swapcaps & 
xcape -e 'Control_L=Escape' &

exec xmonad
