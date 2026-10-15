#!/usr/bin/env bash
# Thunar-like "Open with": pick any installed app, launch it, remember the choice
set -euo pipefail

file="$1"
mime=$(xdg-mime query filetype "$file")

# Map "Name (id)" -> path for every visible .desktop entry
declare -A apps
for d in "${XDG_DATA_HOME:-$HOME/.local/share}/applications" /usr/share/applications; do
  [ -d "$d" ] || continue
  for f in "$d"/*.desktop; do
    grep -q '^NoDisplay=true' "$f" && continue
    name=$(grep -m1 '^Name=' "$f" | cut -d= -f2-)
    key="$name ($(basename "$f" .desktop))"
    # User entries take precedence over system ones
    [ -z "${apps[$key]+x}" ] && apps[$key]="$f"
  done
done

# Show picker (swap fuzzel for: rofi -dmenu -i -p "Open with")
choice=$(printf '%s\n' "${!apps[@]}" | sort -f | noctalia dmenu -p "Open with") || exit 0
[ -z "$choice" ] && exit 0
desktop="${apps[$choice]}"

# Remember the choice for this MIME type (writes ~/.config/mimeapps.list)
xdg-mime default "$(basename "$desktop")" "$mime"

gio launch "$desktop" "$file"
