#!/bin/sh

PERC="0.05"

refbar() {
    if [ "$(pgrep swaybar)" ]; then
        pkill sleep -P "$(cat ~/.cache/statusbar_pid )"
    else 
        if [ "(pgrep waybar)" ]; then
            kill -n 37 $(pgrep waybar)
        fi
    fi

    
}

display() {
    VAL="$(get | sed 's/^.*\.//g' )"
    echo "$VAL"

    [ -n "$1" ] && VAL="$1"

    #mywob "$VAL"

    notify-send -a "volsh" " " -i I -h int:value:"$VAL" -h string:synchronous:volume -h string:x-canonical-private-synchronous:anything -t 1000
}

inc() {
    [ "$1" ] && PERC="$1"
    #pulsemixer --change-volume +"$1" && refbar 
    #amixer sset Master 1%+  && refbar 
    #pamixer -i "$PERC" && refbar
    wpctl set-volume @DEFAULT_AUDIO_SINK@ "$(echo "$(get) + $PERC" | bc)" && refbar

    #play sound when volume changed
    pw-play /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga

    display
}

dec() {
    [ "$1" ] && PERC="$1"
    #pulsemixer --change-volume -"$1"  && refbar
    #amixer sset Master 1%-  && refbar 
    #pamixer -d "$PERC" && refbar
    wpctl set-volume @DEFAULT_AUDIO_SINK@ "$(echo "$(get) - $PERC" | bc)" && refbar

    #play sound when volume changed
    pw-play /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga


    display
}

mute() {
    #pulsemixer --toggle-mute && refbar 
    #amixer sset Master toggle && refbar 
    #pamixer -t && refbar
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && refbar 

    display
}

get() {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d' ' -f 2 
}

help() {
    echo "-i N  -> increment volume by N (0.00 - 1.00)"
    echo "-d N  -> decrement volume by N (0.00 - 1.00)"
    echo "-g    -> get current volume"
    echo "--toggle-mute -> toggle mute sound"
}

if [ "$1" = "-i" ]; then
    inc "$2"
elif [ "$1" = "-d" ]; then
    dec "$2"
elif  [ "$1" = "--toggle-mute" ]; then 
    mute
elif [ "$1" = "-g" ]; then
    get
elif [ "$1" = "-display" ]; then
    display
else
    help
fi
