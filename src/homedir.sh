#!/bin/bash
#|--| MODIFIES THE ACTUAL DOTFILES (inside of user's $HOME directory) |--|#

# Load Config
source ./config.sh

create_symlinks() {
    gum style --foreground "$HEX_HL1" --bold "Great! Symlinking all Dotfile Storage items to your home directory:"
    for file in "$dir_dotfile_storage"/.*; do
        dotfile="$(basename "$file")"

        # If dotfile is in the exclude list, skip it
        if [[ " ${exclude_dotfiles[@]} " =~ " ${dotfile} " ]]; then
            continue
        fi

        # create symlink
        ln -sf "$dir_dotfile_storage/$dotfile" "$HOME/$dotfile"
        # print created symlink
        echo -n "$(gum style --foreground "$HEX_FG1" "$dir_dotfile_storage/")"
        echo -n "$(gum style --foreground "$HEX_HL2" "$dotfile")"
        echo -n "$(gum style --foreground "$HEX_HL1" " 󰿨󰮺 ")"
        echo -n "$(gum style --foreground "$HEX_FG1" "$HOME/")"
        echo "$(gum style --foreground "$HEX_HL2" "$dotfile")"
    done
}

cleanup_symlinks() {
    echo "Cleaning up symlinks..."
}

create_symlinks
