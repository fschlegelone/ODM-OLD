#!/bin/bash

# Load Config
source ./config.sh

create_symlinks() {

    gum style --foreground "$C_SUCCESS" "Great! Symlinking all contents of $dir_dotfile_storage to your Home Directory:"
    for file in "$dir_dotfile_storage"/.*; do
        dotfile="$(basename "$file")"
        ln -sf "$dir_dotfile_storage/$dotfile" "$HOME/$dotfile" # create symlink
        gum style --foreground "$C_HL2" "$HOME/$dotfile"
    done
}

remove_from_homedir() {
    echo "Removing from Home Directory"
}

create_symlinks
remove_from_homedir
