#!/bin/bash

BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
DIM='\033[2m'
BOLD='\033[1m'
NC='\033[0m'

# Format: "pkg|description|default(true/false)" or "HEADER|Section title"
ITEMS=(
    "HEADER|Essential Programs — required for the config to work"
    "hyprland|Wayland compositor|true"
    "stow|Symlink manager — used by install.sh|true"
    "hyprpolkitagent|Polkit agent for GUI sudo prompts|true"
    "xdg-desktop-portal-hyprland|Screen sharing and file dialogs on Wayland|true"
    "waybar|Status bar|true"
    "anyrun-git|App launcher|true"
    "foot|Terminal emulator|true"
    "python-pywal|Wallpaper-driven color scheme generator|true"
    "swaync|Notification center|true"
    "waypaper-git|Wallpaper GUI manager|true"
    "awww|Wallpaper daemon|true"
    "hyprlock|Lock screen|true"
    "wlogout|Logout menu|true"
    "otf-geist-mono-nerd|Primary Nerd Font for terminal and bar icons|true"
    "ttf-geist|Secondary font for UI elements|true"
    "qt6-wayland|Qt6 Wayland support|true"
    "pavucontrol|Audio control panel|true"
    "HEADER|Recommended Utilities — strongly suggested"
    "hyprpicker|Color picker — Super+H|true"
    "grim|Screenshot tool — Super+Shift+P|true"
    "slurp|Area selection for screenshots|true"
    "wl-clipboard|Clipboard manager for Wayland|true"
    "brightnessctl|Keyboard brightness control|true"
    "wireplumber|PipeWire session manager (audio/video)|true"
    "playerctl|Media key control (Play/Pause/Next)|true"
    "network-manager-applet|Network Manager tray icon|true"
    "blueman|Bluetooth manager applet|true"
    "rose-pine-hyprcursor|Cursor theme|true"
    "nwg-look|GTK theme manager|true"
    "thunar|File manager — Super+E|true"
    "gvfs|Trash and drive mounting for Thunar|true"
    "tumbler|Thumbnail service for Thunar|true"
    "ffmpegthumbnailer|Video thumbnails for Thunar|true"
    "fastfetch|System info display in terminal|true"
    "btop|Resource monitor|true"
    "starship|Shell prompt|true"
    "zsh|Z shell|true"
    "HEADER|Optional / Nice-to-have — not selected by default"
    "kdeconnect|Phone and PC sync|false"
    "zen-browser|Minimalist browser (opacity rules in hyprland.conf)|false"
    "code-oss|VS Code open source|false"
    "discord|Discord|false"
    "caprine|Facebook Messenger client|false"
    "colloid-gtk-theme|GTK theme used in this config|false"
    "tela-circle-icon-theme|Icon theme used in this config|false"
)

# --- Parse ITEMS into working arrays ---
NAMES=()
DESCS=()
SELECTED=()
ITEM_IS_HEADER=()
ITEM_PKG_IDX=()
pkg_i=0

for item in "${ITEMS[@]}"; do
    IFS='|' read -r f1 f2 f3 <<< "$item"
    if [[ "$f1" == "HEADER" ]]; then
        ITEM_IS_HEADER+=(true)
        ITEM_PKG_IDX+=(-1)
    else
        ITEM_IS_HEADER+=(false)
        ITEM_PKG_IDX+=($pkg_i)
        NAMES+=("$f1")
        DESCS+=("$f2")
        [[ "$f3" == "true" ]] && SELECTED+=(true) || SELECTED+=(false)
        ((pkg_i++))
    fi
done

# Start cursor on first selectable item
CURSOR=0
while [[ "${ITEM_IS_HEADER[$CURSOR]}" == "true" ]]; do ((CURSOR++)); done

move_cursor() {
    local dir=$1
    local next=$CURSOR
    local total=${#ITEMS[@]}
    while true; do
        next=$((next + dir))
        [[ $next -lt 0 ]] && next=$((total - 1))
        [[ $next -ge $total ]] && next=0
        [[ "${ITEM_IS_HEADER[$next]}" != "true" ]] && break
    done
    CURSOR=$next
}

draw_menu() {
    clear
    echo -e "${BLUE}${BOLD}=== Package Installer ===${NC}"
    echo -e "  ${YELLOW}↑↓${NC} navigate   ${YELLOW}Space${NC} toggle   ${YELLOW}Enter${NC} install\n"

    for i in "${!ITEMS[@]}"; do
        IFS='|' read -r f1 f2 _ <<< "${ITEMS[$i]}"
        if [[ "${ITEM_IS_HEADER[$i]}" == "true" ]]; then
            echo -e "\n  ${CYAN}${BOLD}${f2}${NC}"
        else
            pidx="${ITEM_PKG_IDX[$i]}"
            [[ $i -eq $CURSOR ]] && prefix="  ${YELLOW}>${NC}" || prefix="   "
            [[ "${SELECTED[$pidx]}" == "true" ]] && mark="${GREEN}●${NC}" || mark="${DIM}○${NC}"
            [[ $i -eq $CURSOR ]] && name_color="$YELLOW" || name_color="$NC"
            echo -e "${prefix} [${mark}] ${name_color}${NAMES[$pidx]}${NC}  ${DIM}${DESCS[$pidx]}${NC}"
        fi
    done

    local count=0
    for s in "${SELECTED[@]}"; do [[ "$s" == "true" ]] && ((count++)); done
    echo -e "\n${BLUE}──────────────────────────────────────────${NC}"
    echo -e "  ${count} package(s) selected"
}

# --- Input loop ---
tput civis
trap "tput cnorm; echo; exit" INT TERM

while true; do
    draw_menu
    IFS= read -rsn1 key
    case "$key" in
        $'\x1b')
            read -rsn2 -t 0.1 seq
            case "$seq" in
                '[A') move_cursor -1 ;;
                '[B') move_cursor 1 ;;
            esac
            ;;
        " ")
            pidx="${ITEM_PKG_IDX[$CURSOR]}"
            [[ "${SELECTED[$pidx]}" == "true" ]] && SELECTED[$pidx]=false || SELECTED[$pidx]=true
            ;;
        "") break ;;
    esac
done

tput cnorm
clear

# --- Collect and install ---
TO_INSTALL=()
for i in "${!NAMES[@]}"; do
    [[ "${SELECTED[$i]}" == "true" ]] && TO_INSTALL+=("${NAMES[$i]}")
done

if [[ ${#TO_INSTALL[@]} -eq 0 ]]; then
    echo -e "${RED}No packages selected. Exiting.${NC}"
    exit 0
fi

if ! command -v yay &>/dev/null; then
    echo -e "${RED}Error: yay not found. Install yay first: https://github.com/Jguer/yay${NC}"
    exit 1
fi

echo -e "${BLUE}${BOLD}Installing ${#TO_INSTALL[@]} packages:${NC}"
printf '  · %s\n' "${TO_INSTALL[@]}"
echo
yay -S --needed "${TO_INSTALL[@]}"
echo -e "\n${GREEN}Done! You can now run ./install.sh to link your dotfiles.${NC}"
