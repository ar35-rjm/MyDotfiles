--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name = "blueman-float",
    match = { class = "blueman-manager" },
    
    float = true,
    size = {700, 500},
    move = {"(monitor_w - window_x) / 2","(monitor_h - window_y) / 2"}
})

hl.window_rule({
    name = "waybar-btop-float",
    match = {class = "floating_btop"},
    
    float = true,
    size = {1000, 600},
    move = {"(monitor_w - window_x) / 2","(monitor_h - window_y) / 2"}
})

hl.window_rule({
    name = "pavucontrol-float",
    match = {class = "org.pulseaudio.pavucontrol"},

    float = true,
    size = {800, 500},
    move = {"(monitor_w - window_x) / 2","(monitor_h - window_y) / 2"}
})

hl.window_rule({
    name = "nwg-look-float",
    match = {class = "nwg-look"},

    float = true,
    size = {1000, 600},
    move = {"(monitor_w - window_x) / 2","(monitor_h - window_y) / 2"}
})

hl.window_rule({
    name = "wlogout-float",
    match = {class = "wlogout"},

    float = true,
    fullscreen = true,
    pin = true
})

hl.window_rule({
    name = "clock-float",
    match = {class = "org.gnome.clocks"},

    float = true,
    size = {600, 480},
    move = {"(monitor_w - window_x) / 2","(monitor_h - window_y) / 2"}
})

hl.window_rule({
    name = "thunar-rename-float",
    match = {class = "Rename &quot;(.*)&quot;"},

    float = true,
    size = {700, 500},
    move = {"(monitor_w - window_x) / 2","(monitor_h - window_y) / 2"}

})

hl.window_rule({
    name = "nm-float",
    match = {class = "nm-connection-editor"},

    float = true,
    size = {800, 500},
    move = {"(monitor_w - window_x) / 2","(monitor_h - window_y) / 2"}
})
