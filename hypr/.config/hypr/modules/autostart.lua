-- Programs launched once Hyprland has started
hl.on("hyprland.start", function()
    hl.exec_cmd("noctalia")
    hl.exec_cmd("kdeconnect-indicator")
    hl.exec_cmd("kitty -1 --start-as=hidden")
    -- LEOBOG Hi75C: restore the last wallpaper color (keyboard forgets it on power off)
    hl.exec_cmd("~/.local/bin/leobog-rgb save")
end)
