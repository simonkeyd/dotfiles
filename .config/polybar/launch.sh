#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# source pywal colors
source "${HOME}/.cache/wal/colors.sh"

# Launch bar1 and bar2
#for m in $(polybar --list-monitors | cut -d":" -f1); do
#    MONITOR=$m polybar --reload example &
#done
polybar top &

echo "Bars launched..."
#fab
#np
#music
#stats
