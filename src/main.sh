#!/bin/bash

# Colors
FG="255"     # foreground
SILVER="147" # border
PINK="212"   # highlighted words
BLUE="111"

# Home Section
gum style --border normal --margin "1" --padding "1 2" --align "center" --border-foreground $SILVER "Welcome to $(gum style --foreground $PINK 'ODM')!" "The first Dotfile Manager, that doesn't suck."
# Select Action
STORE="Store"
ROLLOUT="Rollout"
STATUS="Status"
CHOICE=$(gum choose --cursor " " --item.foreground 250 $STORE $ROLLOUT $STATUS)

# Action: Store
if [ $CHOICE == $STORE ]; then
    bash ./store.sh
# Action: Rollout
elif [ $CHOICE == $ROLLOUT ]; then
    bash ./rollout.sh
# Action: Status
elif [ $CHOICE == $STATUS ]; then
    bash ./status.sh
fi

# Loading Animation
# gum spin --title "Loading.. $(gum style --foreground "$PINK" "$GUM")" -- sleep 1
# clear
