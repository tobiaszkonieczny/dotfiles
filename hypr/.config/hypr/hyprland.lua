------------------
---- MONITORS ----
------------------

hl.monitor({ output = "eDP-1", mode = "1920x1080@60",  position = "0x288",      scale = 1 })
hl.monitor({ output = "DP-1",  mode = "2560x1440@144", position = "1920x0",     scale = 1 })


---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "foot"
local fileManager = "thunar"



-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function()
    hl.exec_cmd("noctalia")
    hl.exec_cmd("kdeconnect-indicator")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")


-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out =  {top = 10, right = 20, bottom = 20, left = 20 },

        border_size = 2,

        resize_on_border = false,
        allow_tearing    = false,
        layout           = "dwindle",
    },

    decoration = {
    rounding       = 20,
    rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

       shadow = {
        enabled      = true,
        range        = 10,
        render_power = 4,
        offset       = { 2, 3 },
        color        = "rgba(00000055)",
    },

        blur = {
            enabled  = true,
            size     = 4,
            passes   = 3,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

hl.curve("fluent_decel", { type = "bezier", points = { { 0.1,  1.0  }, { 0.0,  1.0   } } })
hl.curve("easeOutExpo",  { type = "bezier", points = { { 0.16, 1.0  }, { 0.3,  1.0   } } })
hl.curve("soft_bounce",  { type = "bezier", points = { { 0.1,  1.1  }, { 0.1,  1.05  } } })
hl.curve("linear",       { type = "bezier", points = { { 0.0,  0.0  }, { 1.0,  1.0   } } })

hl.animation({ leaf = "global",           enabled = true, speed = 4.0, bezier = "fluent_decel" })
hl.animation({ leaf = "windows",          enabled = true, speed = 4.0, bezier = "fluent_decel", style = "popin 75%" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 4.0, bezier = "fluent_decel", style = "popin 75%" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 3.5, bezier = "fluent_decel", style = "popin 75%" })
hl.animation({ leaf = "fadeIn",           enabled = true, speed = 3.0, bezier = "easeOutExpo" })
hl.animation({ leaf = "fadeOut",          enabled = true, speed = 3.0, bezier = "easeOutExpo" })
hl.animation({ leaf = "fade",             enabled = true, speed = 4.0, bezier = "easeOutExpo" })
hl.animation({ leaf = "border",           enabled = true, speed = 5.0, bezier = "default" })
hl.animation({ leaf = "borderangle",      enabled = true, speed = 30,  bezier = "linear",       style = "loop" })
hl.animation({ leaf = "layers",           enabled = true, speed = 4.0, bezier = "fluent_decel", style = "fade" })
hl.animation({ leaf = "layersIn",         enabled = true, speed = 4.0, bezier = "fluent_decel", style = "fade" })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 2.0, bezier = "fluent_decel", style = "fade" })
hl.animation({ leaf = "workspaces",       enabled = true, speed = 4.5, bezier = "fluent_decel", style = "slidefade 20%" })
hl.animation({ leaf = "workspacesIn",     enabled = true, speed = 4.5, bezier = "fluent_decel", style = "slidefade 20%" })
hl.animation({ leaf = "workspacesOut",    enabled = true, speed = 4.5, bezier = "fluent_decel", style = "slidefade 20%" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 4.0, bezier = "fluent_decel", style = "slidevert 5%" })

hl.config({
    dwindle = {
        preserve_split = true,
    },
})


hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
        animate_manual_resizes  = true,
        animate_mouse_windowdragging = true,
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "pl",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,
        sensitivity  = -0.6,

        touchpad = {
            natural_scroll = true,
            tap_to_click   = true,
        },
    },
})

hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
})

hl.device({
    name        = "pnp0c50:00-06cb:cdaa-touchpad",
    sensitivity = 0.3,
})


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"
local ipc = "noctalia msg "

hl.bind(mainMod .. " + Q",         hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd('foot zsh -c "fastfetch; exec zsh"'))
hl.bind(mainMod .. " + C",         hl.dsp.window.close())
hl.bind(mainMod .. " + E",         hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + V", function()
  local w = hl.get_active_window()
  if w == nil then return end

  if w.floating then
    hl.dispatch(hl.dsp.window.float({ action = "set", value = false }))
  else
    hl.dispatch(hl.dsp.window.float({ action = "set", value = true }))
    hl.dispatch(hl.dsp.window.resize({ x = 1280, y = 720 }))
  end
end)
-- hl.dsp.window.resize({ x = 800, y = 600 })
hl.bind(mainMod .. " + W",         hl.dsp.exec_cmd(ipc .. "panel-toggle wallpaper"))
hl.bind(mainMod .. "+A", hl.dsp.exec_cmd(ipc .. "panel-toggle control-center"))
hl.bind(mainMod .. "+Space", hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"))
hl.bind(mainMod .. "+comma", hl.dsp.exec_cmd(ipc .. "settings-toggle"))
hl.bind(mainMod .. " + P",         hl.dsp.window.pseudo())
hl.bind(mainMod .. " + H",         hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(mainMod .. " + J",         hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(ipc .. "panel-toggle control-center notifications"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd(ipc .. "panel-toggle session"))
hl.bind(mainMod .. " + SHIFT + X", hl.dsp.exec_cmd(ipc .. "session lock"))

hl.bind("SUPER + M", function()
  hl.dispatch(hl.dsp.exec_cmd("spotify", { float = true, move = {50, 70}, size ={1200,700} }))
  hl.dispatch(hl.dsp.exec_cmd('foot zsh -c "cava; exec zsh"', { float = true, move = {1300, 700}, size ={570,320} }))
end)
-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left"  }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up"    }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down"  }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Resize windows with mainMod + SHIFT + arrow keys
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x =  100, y =    0, relative = true }))
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.resize({ x = -100, y =    0, relative = true }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.resize({ x =    0, y = -100, relative = true }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.resize({ x =    0, y =  100, relative = true }))

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Screenshot with slurp and grim, copied to clipboard
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd('grim -g "$(slurp)" -t png - | wl-copy -t image/png'))

-- Requires playerctl
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- Window rules
hl.window_rule({
    name    = "opacity-general",
    match   = { class = ".*" },
    opacity = "0.9 0.9",
})

hl.window_rule({
    name    = "no-opacity",
    match   = { class = "^(zen|foot)$" },
    opacity = 1.0,
})

hl.window_rule({
    name              = "focus_on_activate",
    match             = { class = "^(code-oss|zen|discord)$" },
    focus_on_activate = true,
})

hl.window_rule({
    name    = "opacity-strong",
    match   = { class = "^(Caprine|Spotify)$" },
    opacity = "0.75",
})

hl.window_rule({
    name  = "float-apps",
    match = { class = "^(blueman-manager|nm-connection-editor|org.pulseaudio.pavucontrol)$" },
    float = true,
    size  = "1200 800",
})

hl.window_rule({
    match = { class = "dev.noctalia.Noctalia" },
    float = true,
    size = { 1080, 920 },
})

hl.layer_rule({
  name = "noctalia",
  match = {
    namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
  },
  no_anim = true,
  ignore_alpha = 0.5,
  blur = true,
  blur_popups = true,
})
-- For Noctalia Color templates
require("noctalia").apply_theme()
