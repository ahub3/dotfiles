#!/bin/sh 
gamescope --force-windows-fullscreen -f --expose-wayland --backend sdl -F fsr --fsr-sharpness 20 -S auto -- "$@" 
