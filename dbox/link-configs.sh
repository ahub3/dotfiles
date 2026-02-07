#!/bin/sh

SRC="$1"
DST="$2"

! [ -d "$SRC" ] && echo "input source directory as first argument" && exit
! [ -d "$DST" ] && echo "input destination directory as second argument" && exit

echo "SRC=$SRC"
echo "DST=$DST"

echo "delete cache + config files in $DST? (y/N)"
read input
if [ "$input" = "y" ]; then
    echo "deleting cache files for nvim, and zsh"
    rm -rf "$DST"/.local/share/nvim
    rm -rf "$DST"/.local/state/nvim
    rm -rf "$DST"/.cache/nvim
    rm -rf "$DST"/.local/share/oh-my-zsh

    rm -rf "$DST"/.config/nvim
    rm -rf "$DST"/.config/zsh
    rm "$DST"/.zshrc
    rm "$DST"/.zprofile
    rm "$DST"/.zshenv

else
    echo "skipping cache + config file delete"
fi

echo "setting up symlinks"
ln -s "$SRC"/.config/nvim "$DST"/.config/
ln -s "$SRC"/.config/zsh  "$DST"/.config/
ln -s "$SRC"/.zshenv      "$DST"/.zshenv
