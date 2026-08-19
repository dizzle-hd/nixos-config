#!/bin/sh
# ~/.config/hypr/scripts/dpms-off.sh
$HOME/.config/hypr/scripts/can-dpms-off.sh && hyprctl dispatch 'hl.dsp.dpms({ action = "off" })'
