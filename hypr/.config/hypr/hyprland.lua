-- Hyprland entry point - loads each config section from modules/

require("modules.monitors")
require("modules.env")
require("modules.autostart")
require("modules.appearance")
require("modules.input")
require("modules.keybindings")
require("modules.windowrules")

-- Apply the Noctalia-generated color theme on top of the base look and feel
require("noctalia").apply_theme()
