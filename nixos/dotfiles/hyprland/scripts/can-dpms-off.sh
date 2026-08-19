#!/bin/sh
# ~/.config/hypr/scripts/can-dpms-off.sh

if command -v playerctl >/dev/null 2>&1; then
  statuses="$(playerctl -a status 2>/dev/null)"

  # Wenn irgendein Player "Playing" ist: NICHT dpms off
  printf '%s\n' "$statuses" | grep -qi 'playing' && exit 1
fi

# Kein Playing (oder kein playerctl): dpms off darf
exit 0
