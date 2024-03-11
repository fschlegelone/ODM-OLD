dir_repo_root=$(git rev-parse --show-toplevel)
dir_dotfiles=$dir_repo_root/dotfiles
json_exclude_dotfiles=$(cat "$dir_repo_root/src/exclude_dotfiles.json")

# User Selection: Store Dotfiles from Home
store_dotfiles_from_home() {
    dotfiles=()
    for file in "$HOME"/.*; do
        if [ -f "$file" ]; then # Ensure it's a file, not a directory
            filename=$(basename "$file")
            if ! grep -q "\"$filename\"" <<<"$json_exclude_dotfiles"; then
                dotfiles+=("$filename")
            fi
        fi
    done

    selected_dotfiles=$(gum choose --cursor " " --cursor-prefix " " --unselected-prefix " " --selected-prefix "󰱒 " --no-limit "${dotfiles[@]}")
    echo $selected_dotfiles
}

# User Selection: Store Dotfiles manually
store_dotfiles_manually() {
    echo "Manually store dotfiles"
}

check_dotfile_storage() {
    # Dotfile Storage exists and is empty
    if [ -d "$dir_dotfiles" ] && [ -z "$(ls -A "$dir_dotfiles")" ]; then
        echo "Great! Your Dotfile Storage is located under $dir_dotfiles and is completely empty."
    # Dotfile Storage exists and is not empty
    elif [ -d "$dir_dotfiles" ] && [ -n "$(ls -A "$dir_dotfiles")" ]; then
        echo "Great! Your Dotfile Storage is located under $dir_dotfiles and already has some dotfiles."
    # Dotfile Storage does not exist
    else
        echo "Damn! Your Dotfile Storage does not exist yet."
        gum spin --title "I'll create it for you... $(gum style --foreground "$PINK" "$GUM")" -- sleep 1
        mkdir -p "$dir_dotfiles"
    fi
    OPTION1="Manually fill up Dotfile Storage"
    OPTION2="Use dotfiles from ~ to fill up Dotfile Storage"
    STORE_OPTION=$(gum choose --cursor " " --item.foreground 250 "$OPTION1" "$OPTION2")

    if [ "$STORE_OPTION" == "$OPTION1" ]; then
        store_dotfiles_manually
    else
        store_dotfiles_from_home
        echo "."
    fi
}
check_dotfile_storage
