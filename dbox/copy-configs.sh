#!/bin/sh

SRC="$1"
DEST="$2"

! [ -d "$SRC" ] && echo "input source directory as first argument" && exit
! [ -d "$DEST" ] && echo "input destination directory as second argument" && exit


#mkdir -p "$DEST"/.config/nvim/

mkdir -p "$DEST"/.config/zsh/

#Neovim
#git clone https://github.com/NvChad/NvChad "$DEST"/.config/nvim --depth 1
#cp -r "$SRC"/.config/nvchad/custom "$DEST"/.config/nvim/lua/
cp -r "$SRC"/.config/nvim/ "$DEST"/.config/

#ZSH
cp "$SRC"/.config/zsh/.zshrc "$DEST"/.config/zsh/
cp "$SRC"/.config/zsh/.zprofile "$DEST"/.config/zsh/
cp "$SRC"/.config/zsh/.p10k.zsh "$DEST"/.config/zsh/
cp "$SRC"/.zshenv "$DEST"/.zshenv

mkdir -p "$DEST"/.local/share/
mkdir -p "$DEST"/.config/
#Fonts
#cp -r "$SRC"/.local/share/fonts/ "$DEST"/.local/share/
#cp -r "$SRC"/.config/fontconfig/ "$DEST"/.config/
