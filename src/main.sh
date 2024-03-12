#!/bin/bash

# Load Config
source ./config.sh

# Home Section
gum style --border normal --margin "1" --padding "1 2" --align "center" --border-foreground "$C_HL2" "Welcome to $(gum style --foreground "$C_HL1" 'ODM')!" "The first Dotfile Manager, that doesn't suck."
# Select Action
STORAGE="Dotfile Storage"
HOMEDIR="Home Directory"
STATUS="Status"
ACTION=$(gum choose --item.foreground "$C_FG1" --cursor.foreground "$C_HL1" --cursor " " "$STORAGE" "$HOMEDIR" "$STATUS")

# Action: Dotfile Storage
if [ "$ACTION" == "$STORAGE" ]; then
    bash ./storage.sh
# Action: Home Directory
elif [ "$ACTION" == "$HOMEDIR" ]; then
    bash ./homedir.sh
# Action: Status
elif [ "$ACTION" == "$STATUS" ]; then
    bash ./status.sh
fi

# Loading Animation
# gum spin --title "Loading.. $(gum style --foreground "$C_HL1" "$GUM")" -- sleep 1
# clear
