-- Look and feel: gaps, borders, decoration, layout and animations

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = { top = 10, right = 10, bottom = 10, left = 10 },

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
