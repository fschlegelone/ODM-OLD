#!/bin/bash

# Set Script Permissions
set_permissions() {
    repo_root=$(git rev-parse --show-toplevel)
    echo "Setting script permissions... Sudo required."
    sudo chmod 744 $repo_root/src/*.sh
}

# Check for operating system & package manager
check_os() {
    os=$(uname -s)
    # Linux ?
    if [[ "$os" == "Linux" ]]; then
        echo "Linux"
        # Check for package manager
        case "$(true)" in
        # APT
        $(command -v apt &>/dev/null))
            sudo mkdir -p /etc/apt/keyrings
            curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
            echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
            sudo apt update && sudo apt install gum
            ;;
        # Pacman
        $(command -v pacman &>/dev/null))
            pacman -S gum
            ;;
        # NIX
        $(command -v nix &>/dev/null))
            nix-env -iA nixpkgs.gum
            ;;
        *)
            # Unsupported package manager
            echo "Damn. Automated setup on Linux is only available for apt, dnf and pacman. You're on your own."
            ;;
        esac
    # MacOS ?
    elif [[ "$os" == "Darwin" ]]; then
        # Brew installed?
        if command -v brew &>/dev/null; then
            echo "Great. Homebrew is installed"
        else
            echo "Damn. Homebrew is not installed. No worries, installing it now..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
        # Gum installed?
        if [ $(brew list | grep "gum") ]; then
            echo "Great. Gum is installed"
        else
            echo "Damn. Gum is not installed. No worries, installing it now..."
            brew install gum
        fi

    else
        echo "Damn. Unknown operating system. Windows is not supported btw."
    fi
}

set_permissions
check_os
