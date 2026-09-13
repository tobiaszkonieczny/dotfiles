-- Keyboard, mouse, touchpad and gesture configuration

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

-- Lower sensitivity for the internal touchpad specifically
hl.device({
    name        = "pnp0c50:00-06cb:cdaa-touchpad",
    sensitivity = 0.3,
})
