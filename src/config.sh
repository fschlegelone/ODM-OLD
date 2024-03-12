#!/bin/bash

#|--| COLORS |--|#
readonly C_HL1="212"    # Color Highlight 1
readonly C_HL2="111"    # Color Highlight 3
readonly C_ERROR="204"  # Color Error
readonly C_SUCCESS="40" # Color Success
readonly C_FG1="189"    # Text Color
readonly C_FG2="18"     # Text Color Secondary

#|--| PATHS |--|#
dir_repo_root=$(git rev-parse --show-toplevel)
dir_dotfile_storage=$dir_repo_root/dotfiles
json_exclude_dotfiles=$(cat "$dir_repo_root/src/exclude_dotfiles.json")
