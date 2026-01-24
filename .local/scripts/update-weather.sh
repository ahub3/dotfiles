#!/usr/bin/env sh

[ "$1" = "-i" ] && sleep 10

UPDATE="$(curl --connect-timeout 30 "wttr.in/"$(cat ~/.cache/gs_geoclue.txt | sed 's/ /,/g')"?format=1")" # > ~/.cache/wttr

notify-send "update-weather.sh called."

if [ $(echo "$UPDATE" | wc -m) -le 30 ]; then
  echo "$UPDATE|$(date)" >> ~/.cache/wttr_update

else
	echo "❗" > ~/.cache/wttr 

fi
