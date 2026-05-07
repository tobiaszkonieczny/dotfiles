#!/bin/bash

# --- Colors and Symbols ---
BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'
CHECKED="●"
UNCHECKED=" "

# --- Variables ---
DOTFILES_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
CONFIG_DIR="$HOME/.config"
MODULES=($(ls -d */ | sed 's/\///' | grep -vE '^\.'))
SELECTED=()
for _ in "${MODULES[@]}"; do SELECTED+=(false); done
CURSOR=0

# --- Functions ---

# Draw the interactive menu
draw_menu() {
    clear
    echo -e "${BLUE}--- Dotfiles Installer ---${NC}"
    echo -e "Use ${YELLOW}arrow keys${NC} to move, ${YELLOW}space${NC} to select, ${YELLOW}enter${NC} to confirm.\n"
    
    for i in "${!MODULES[@]}"; do
        if [ $i -eq $CURSOR ]; then
            prefix="  > "
            color=$YELLOW
        else
            prefix="    "
            color=$NC
        fi

        if [ "${SELECTED[$i]}" = true ]; then
            echo -e "${prefix}[${GREEN}${CHECKED}${NC}] ${color}${MODULES[$i]}${NC}"
        else
            echo -e "${prefix}[${UNCHECKED}] ${color}${MODULES[$i]}${NC}"
        fi
    done
    echo -e "\n${BLUE}--------------------------------------${NC}"
}

# --- Input Loop ---
# Hide cursor
tput civis
trap "tput cnorm; exit" INT TERM

while true; do
    draw_menu
    # Read single keypress
    IFS= read -rsn1 key
    case "$key" in
        $'\x1b') # Handle escape sequences (Arrow keys)
            read -rsn2 -t 0.1 key
            case "$key" in
                '[A') ((CURSOR--)); [ $CURSOR -lt 0 ] && CURSOR=$((${#MODULES[@]} - 1)) ;; # Up
                '[B') ((CURSOR++)); [ $CURSOR -ge ${#MODULES[@]} ] && CURSOR=0 ;;        # Down
            esac
            ;;
        " ") # Toggle selection
            if [ "${SELECTED[$CURSOR]}" = true ]; then
                SELECTED[$CURSOR]=false
            else
                SELECTED[$CURSOR]=true
            fi
            ;;
        
        "") # Enter key
            break
            ;;
    esac
done

# Show cursor again
tput cnorm

# --- Execution ---
clear
FINAL_SELECTION=()
for i in "${!MODULES[@]}"; do
    if [ "${SELECTED[$i]}" = true ]; then
        FINAL_SELECTION+=("${MODULES[$i]}")
    fi
done

if [ ${#FINAL_SELECTION[@]} -eq 0 ]; then
    echo -e "${RED}No modules selected. Exiting.${NC}"
    exit 0
fi

echo -e "${BLUE}Installing selected modules: ${FINAL_SELECTION[*]}${NC}\n"

for module in "${FINAL_SELECTION[@]}"; do
    echo -e "${BLUE}[INFO]${NC} Processing: $module"
    
    # Remove existing physical dir to avoid Stow conflicts
    if [ -d "$CONFIG_DIR/$module" ] && [ ! -L "$CONFIG_DIR/$module" ]; then
        mv "$CONFIG_DIR/$module" "$CONFIG_DIR/${module}.bak"
        echo -e "       Created backup: ${module}.bak"
    fi

    # Run Stow
    stow -R "$module"

    # Post-install hook for Anyrun (username patch)
    if [[ "$module" == "anyrun" ]]; then
        [ -f "$CONFIG_DIR/anyrun/style.css.template" ] && \
        sed "s/{{USER}}/$(whoami)/g" "$CONFIG_DIR/anyrun/style.css.template" > "$CONFIG_DIR/anyrun/style.css"
    fi
done

echo -e "\n${GREEN}Done! All selected dots are linked.${NC}"