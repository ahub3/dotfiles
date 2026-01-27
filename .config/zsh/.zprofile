#!/bin/sh

export HISTFILE="$HOME"/.cache/zsh_history

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export NOTMUCH_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/notmuch-config"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/inputrc"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export STACK_ROOT="$XDG_DATA_HOME"/stack
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export ANSIBLE_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/ansible/ansible.cfg"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/android"
export MBSYNCRC="${XDG_CONFIG_HOME:-$HOME/.config}/mbsync/config"
export ELECTRUMDIR="${XDG_DATA_HOME:-$HOME/.local/share}/electrum"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc

export GHCUP_USE_XDG_DIRS=true
export STACK_ROOT="$XDG_DATA_HOME"/stack

export RENPY_PATH_TO_SAVES="$XDG_DATA_HOME/renpy"
export RENPY_MULTIPERSISTENT="$XDG_DATA_HOME/renpy_shared"

#create dirs that may not exist
! [ -f "$HISTFILE" ] && mkdir "$HOME"/.cache/ && touch "$HISTFILE"
! [ -d "$GNUPGHOME" ] && mkdir -p $GNUPGHOME


#make firefox/librewolf use wayland
export GDK_BACKEND=wayland 
export MOZ_ENABLE_WAYLAND=1

#fix java windows
export _JAVA_AWT_WM_NONREPARENTING=1

#make SDL applications use wayland
export SDL_VIDEODRIVER=wayland

#theming
export GTK_THEME=Adwaita:dark
export XCURSOR_THEME=Adwaita
export XCURSOR_SIZE=32

#add to path
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/scripts"
export PATH="$PATH:/var/lib/flatpak/exports/bin"

export LESSHISTFILE="-"

#export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
#export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
#export LESS_TERMCAP_me="$(printf '%b' '[0m')"
#export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
#export LESS_TERMCAP_se="$(printf '%b' '[0m')"
#export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
#export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export QT_QPA_PLATFORM=wayland

export EDITOR=nvim


export MANPAGER=less
#export XDG_CURRENT_DESKTOP="sway"

#set programs
export BROWSER="flatpak run com.brave.Browser"


#lf icons
[ -f "$HOME"/.config/lf/lf-icons.sh ] && . "$HOME"/.config/lf/lf-icons.sh

#fixes  
#fix weird terminal issues
#export TERM="xterm-256color"
#fix arduino ide issues
export AWT_TOOLKIT=MToolkit
