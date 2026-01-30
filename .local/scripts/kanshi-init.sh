#!/bin/sh

if [ "$(pgrep kanshi)" ]; then
    pkill kanshi
fi

kanshi &
