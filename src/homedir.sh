#!/bin/bash
#|--| MODIFIES THE ACTUAL DOTFILES (inside of user's $HOME directory) |--|#

# Load Config
source ./config.sh

create_symlinks() {

    gum style --foreground "$HEX_SUCCESS" "Great! Symlinking all contents of $dir_dotfile_storage to your Home Directory:"
    for file in "$dir_dotfile_storage"/.*; do
        dotfile="$(basename "$file")"
        ln -sf "$dir_dotfile_storage/$dotfile" "$HOME/$dotfile" # create symlink
        gum style --foreground "$HEX_HL2" "$HOME/$dotfile"
    done
}

create_symlinks
