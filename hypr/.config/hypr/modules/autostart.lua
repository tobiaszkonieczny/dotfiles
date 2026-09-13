-- Programs launched once Hyprland has started
hl.on("hyprland.start", function()
    hl.exec_cmd("noctalia")
    hl.exec_cmd("kdeconnect-indicator")
    hl.exec_cmd("foot --server")
end)
