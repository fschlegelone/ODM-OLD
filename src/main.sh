#!/bin/bash
#|--| ALL SCRIPTS ARE EXECUTED FROM THIS MAIN SCRIPT |--|#

# Load Config
source ./config.sh

# Home Section
main() {
    gum style --border normal --margin "1" --padding "1 2" --align "center" --border-foreground "$HEX_HL2" "Welcome to $(gum style --foreground "$HEX_HL1" 'ODM')!" "The first Dotfile Manager, that doesn't suck."
    # Action Variables
    STORAGE="Dotfile Storage"
    HOMEDIR="Home Directory"
    STATUS="Show Status"
    # Prompt User for Action
    ACTION=$(gum choose --item.foreground "$HEX_FG1" --cursor.foreground "$HEX_HL1" --cursor " " "$STORAGE" "$HOMEDIR" "$STATUS")

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
}
main
