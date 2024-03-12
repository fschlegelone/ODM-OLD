#!/bin/bash
#|--| CONFIG FILE USED BY ALL ODM SCRIPTS |--|#

#|--| COLORS |--|#
readonly HEX_HL1="#CBA6F7"     # Color Highlight 1
readonly HEX_HL2="#74C7EC"     # Color Highlight 3
readonly HEX_ERROR="#F38BA8"   # Color Error
readonly HEX_SUCCESS="#A6E3A1" # Color Success
readonly HEX_FG1="#CDD6F4"     # Text Color
readonly HEX_FG2="#A6ADC8"     # Text Color Secondary

#|--| PATHS |--|#

# ODM Repository Directory
dir_repo_root=$(git rev-parse --show-toplevel)
# ODM Home Directory
dir_odm="$HOME/ODM"
# Dotfile Storage
dir_dotfile_storage="$dir_repo_root/dotfiles"
# Backup Directory
dir_dotfile_storage_backup="$dir_odm/dotfile_storage_backup"

#|--| EXCLUDED DOTFILES |--|#
exclude_dotfiles=(
    ".terminfo"
    ".DS_Store" # MacOS auto generated cache file
    ".wget-hsts"
    ".Trash"
    ".bash_history"
    ".zsh_history"
    ".node_repl_history"
    ".python_history"
    ".cache"
    ".ssh"
    ".gnupg"
    ".wget-hsts"  # Wget
    ".local"      # User installed programs
    ".pyenv"      # Python
    ".npm"        # Node Package Manager
    ".cargo"      # Rust
    ".gem"        # Ruby
    ".pnpm-state" # PNPM (npm enhancement)
    ".rustup"     # Rust
    ".zcompdump"
)
