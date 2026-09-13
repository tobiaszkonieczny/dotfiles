-- Window and layer rules

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
