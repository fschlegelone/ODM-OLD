#!/bin/bash
#|--| STATUS SCRIPT FOR DISPLAYING INFORMATIONS ABOUT THE MANAGED DOTFILES |--|#

# Load Config
source ./config.sh

# Home Section
gum style --border normal --margin "1" --padding "1 2" --align "center" --border-foreground "$HEX_HL2" "Here you can display the current $(gum style --foreground "$HEX_HL1" 'Status') of your dotfiles ^_^!"
# Select Action
STATUS_SYMLINKS="STATUS: Symlinks"
STATUS_2="STATUS: 2"
STATUS_3="STATUS: 3"
ACTION_STATUS=$(gum choose --item.foreground "$HEX_FG1" --cursor.foreground "$HEX_HL1" --cursor " " "$STATUS_SYMLINKS" "$STATUS_2" "$STATUS_3")

# Status 1
if [ "$ACTION_STATUS" == "$STATUS_SYMLINKS" ]; then
    gum style --foreground "$HEX_HL1" "Symlinked Dotfiles: "
    find "$HOME" -maxdepth 1 -type f ! -lname '*' -name ".*" # symlinked dotfiles
    gum style --foreground "$HEX_HL1" "Unsymlinked Dotfiles: "
    find "$HOME" -maxdepth 1 -type d ! -lname '*' -name ".*" # unsymlinked dotfiles

    gum style --foreground "$HEX_HL1" $STATUS_SYMLINKS

# Status 2
elif [ "$ACTION_STATUS" == "$STATUS_2" ]; then
    echo "2"
# Status 3
elif [ "$ACTION_STATUS" == "$STATUS_3" ]; then
    echo "3"
fi
