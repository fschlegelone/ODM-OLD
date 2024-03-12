#!/bin/bash
#|--| MODIFIES THE DOTFILE STORAGE (inside of the repository) |--|#

# Load Config
source ./config.sh

# User Selection: Add or Remove Dotfiles
ADD="Add Items to Dotfile Storage"
REMOVE="Remove Items from Dotfile Storage"
BACKUP="Backup Dotfile Storage"
STORAGE_ACTION=$(gum choose --item.foreground "$HEX_FG1" --cursor.foreground "$HEX_HL1" --cursor " " "$ADD" "$REMOVE" "$BACKUP")

# Add to Dotfile Storage
dotfile_storage_add() {
    dotfiles_userhome=()
    for file in "$HOME"/.*; do
        filename=$(basename "$file")
        if ! grep -q "\"$filename\"" <<<"$json_exclude_dotfiles"; then
            dotfiles_userhome+=("$filename")
        fi
    done

    # Select Dotfiles to store
    gum style --foreground "$HEX_HL1" "Select Dotfiles to store."
    add_to_storage=$(gum choose --height "15" --cursor " " --cursor-prefix " " --unselected-prefix " " --selected-prefix "󰱒 " --no-limit "${dotfiles_userhome[@]}")

    # Copy selected Dotfiles to Dotfile Storage
    gum style --foreground "$HEX_HL1" "Copying files to Dotfile Storage..."
    for file in $add_to_storage; do
        if [ -f "$HOME/$file" ]; then
            echo "file"
            cp "$HOME/$file" "$dir_dotfile_storage" # files
        elif [ -d "$HOME/$file" ]; then
            echo "directory"
            cp -RL "$HOME/$file" "$dir_dotfile_storage" # directories
        fi
    done
}

# Remove from Dotfile Storage
dotfile_storage_remove() {
    gum style --foreground "$HEX_HL1" "Select Dotfiles to remove from storage."
    # list items in storage
    dotfile_list=()
    for item in "$dir_dotfile_storage"/.*; do
        dotfile="$(basename "$item")"
        dotfile_list+=("$dotfile")
    done
    # select items to remove from storage
    remove_from_storage=$(gum choose --cursor " " --cursor-prefix " " --unselected-prefix " " --selected-prefix "󰱒 " --no-limit "${dotfile_list[@]}")
    gum style --foreground "$HEX_HL2" $remove_from_storage

    # remove selected items from storage
    for file in $remove_from_storage; do
        confirm_remove=$(gum confirm --affirmative "Remove" --negative "Cancel" "Removing "$file" from storage. This cannot be revoked. Are you sure?")
        if [ "$?" -eq 0 ]; then
            # confirmed
            echo "Oki Doki! Removing "$file" from storage. Dont cry!"
            rm -r "$dir_dotfile_storage/$file"
        else
            # cancelled
            echo "Phew! That was close. No changes made."
        fi
    done
}

# Backup Dotfile Storage
dotfile_storage_backup() {
    # Create ODM Directory
    if [ ! -d "$dir_odm" ]; then
        mkdir "$dir_odm"
    fi
    # Create Backup Directory
    if [ ! -d "$dir_dotfile_storage_backup" ]; then
        mkdir "$dir_dotfile_storage_backup"
    fi

    # Copy files from Dotfile Storage to Backup Directory
    (
        cp -R "$dir_dotfile_storage" "$dir_dotfile_storage_backup"
    ) &
    pid=$!
    while kill -0 $pid 2>/dev/null; do
        # Display Spinner while copying
        gum spin -s line --title "y" --title "Backing Up.." -- sleep 2
    done

}

# Action: Add or Remove Dotfiles
if [ "$STORAGE_ACTION" == "$ADD" ]; then
    dotfile_storage_add
elif [ "$STORAGE_ACTION" == "$REMOVE" ]; then
    dotfile_storage_remove
elif [ "$STORAGE_ACTION" == "$BACKUP" ]; then
    dotfile_storage_backup
fi
