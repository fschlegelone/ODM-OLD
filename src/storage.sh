#!/bin/bash

# Load Config
source ./config.sh

# User Selection: Add or Remove Dotfiles
ADD="Add Items to Dotfile Storage"
REMOVE="Remove Items from Dotfile Storage"
STORAGE_ACTION=$(gum choose --item.foreground "$C_FG1" --cursor.foreground "$C_HL1" --cursor " " "$ADD" "$REMOVE")

# Add to Dotfile Storage
dotfile_storage_add() {
    dotfiles=()
    for file in "$HOME"/.*; do

        if [ -f "$file" ]; then # Ensure it's a file, not a directory
            filename=$(basename "$file")
            if ! grep -q "\"$filename\"" <<<"$json_exclude_dotfiles"; then
                dotfiles+=("$filename")
            fi
        fi
    done

    # Select Dotfiles to store
    add_to_storage=$(gum choose --cursor " " --cursor-prefix " " --unselected-prefix " " --selected-prefix "󰱒 " --no-limit "${dotfiles[@]}")
    echo $add_to_storage

    # Copy selected Dotfiles to Dotfile Storage
    gum style --foreground "$C_HL1" "Storing Dotfiles..."
    for file in $add_to_storage; do
        cp "$HOME/$file" "$dir_dotfile_storage"
    done
}

# Remove from Dotfile Storage
dotfile_storage_remove() {
    gum style --foreground "$C_HL1" "Removing Dotfiles..."
    # list items in storage
    dotfile_list=()
    for item in "$dir_dotfile_storage"/.*; do
        dotfile="$(basename "$item")"
        dotfile_list+=("$dotfile")
    done
    # select items to remove from storage
    remove_from_storage=$(gum choose --cursor " " --cursor-prefix " " --unselected-prefix " " --selected-prefix "󰱒 " --no-limit "${dotfile_list[@]}")
    gum style --foreground "$C_HL2" $remove_from_storage

    # remove selected items from storage
    for file in $remove_from_storage; do
        confirm_remove=$(gum confirm --affirmative "Remove" --negative "Cancel" "Removing "$file" from storage. This cannot be revoked. Are you sure?")
        if [ "$confirm_remove" == "Remove" ]; then
            echo "Oki Doki! Removing "$file" from storage. Dont cry!"
            rm -r "$dir_dotfile_storage/$file"
        fi
    done
}

# Action: Add or Remove Dotfiles
if [ "$STORAGE_ACTION" == "$ADD" ]; then
    dotfile_storage_add
elif [ "$STORAGE_ACTION" == "$REMOVE" ]; then
    dotfile_storage_remove
fi
