---------------------
---- KEYBINDINGS ----
---------------------

---- MY PROGRAMS ----
-- Set programs that you use
local terminal            = " kitty "
local fileManager         = " nautilus -w "
local menu                = " ~/.config/rofi/launchers/type-1/launcher.sh"
local bar                 = " ~/.config/waybar/launch.sh "
local themeset            = " ~/.config/themes/waybar/themeSelector.sh "
local layoutset           = " ~/.config/themes/waybar/waybarLayoutSelector.sh "
local walset              = " ~/.config/themes/awww/wallpaperSelector.sh "
local colorset            = " ~/.config/themes/colorSchemes/.colorSelector.sh "
local mainBrowser         = " firefox "
local secondaryBrowser    = " flatpak run app.zen_browser.zen "
local fullscreenPrint     = " ~/.config/hypr/fullscreenPrint.sh "
local shapedPrint         = " ~/.config/hypr/shapedPrint.sh "


---- MY MOD KEYS ----
local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local secondaryMod = "CTRL"


-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + T",                          hl.dsp.exec_cmd(terminal))
local closeWindowBind =                             hl.bind(mainMod .. " + Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + ESCAPE",                     hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E",                          hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V",                          hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R",                          hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P",                          hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J",                          hl.dsp.layout("togglesplit"))    -- dwindle only
hl.bind(mainMod .. " + SHIFT + W",                  hl.dsp.exec_cmd(bar))
hl.bind(mainMod .. " + N",               hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(mainMod .. " + " .. secondaryMod .. " + O", hl.dsp.exec_cmd("pkill wvkbd-mobintl || wvkbd-mobintl"))

-- Rice binds :-)
hl.bind(mainMod .. " + W",          hl.dsp.exec_cmd(walset))
hl.bind(mainMod .. " + ALT + S",    hl.dsp.exec_cmd(layoutset))
hl.bind(mainMod .. " + SHIFT + C",  hl.dsp.exec_cmd(colorset))


-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Move to adjacent workspace
hl.bind(mainMod .. " + ALT + left", hl.dsp.focus({workspace = "e-1" }))
hl.bind(mainMod .. " + ALT + right", hl.dsp.focus({workspace = "e+1" }))

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Apps
hl.bind(mainMod .. " + CTRL + C",            hl.dsp.exec_cmd("code"))
hl.bind(mainMod .. " + C",            hl.dsp.exec_cmd("code ~/.config"))

hl.bind(secondaryMod .. " + SHIFT + ESCAPE", hl.dsp.exec_cmd("kitty --class floating_btop -e btop"))

hl.bind(mainMod ..      " + B",             hl.dsp.exec_cmd(mainBrowser))
hl.bind(mainMod ..      " + ALT + B",       hl.dsp.exec_cmd(secondaryBrowser))
hl.bind(secondaryMod .. " + Print",         hl.dsp.exec_cmd(fullscreenPrint))
hl.bind("SHIFT + Print",                    hl.dsp.exec_cmd(shapedPrint))
