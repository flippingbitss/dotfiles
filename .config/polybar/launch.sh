#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
# polybar mybar &

# Launch Polybar on each connected monitor
for monitor in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$monitor polybar --reload mybar &
done

