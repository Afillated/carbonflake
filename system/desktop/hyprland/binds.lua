---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal = "kitty"
local menu     = "rofi -show drun"
local mainMod  = "SUPER"

---------------------
---- KEYBINDINGS ----
---------------------

-- See https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprctl kill"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("qs ipc call sessionPanel open"))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("qs ipc call lockscreen lock"))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("kitty -e btop --force-utf"))
hl.bind(mainMod .. " + F11", hl.dsp.window.fullscreen({ "maximised", "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("kitty -e yazi"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("hyprpicker -a -f hex"))
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("qs ipc call mainBar toggle"))
hl.bind(mainMod .. " + G", hl.dsp.window.fullscreen_state({ internal = 1, client = 1, "toggle", "activewindow" }))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Moving windows with mainMod + Shift + Arrow keys
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.swap({ direction = "left" }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.swap({ direction = "right" }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.swap({ direction = "up" }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.swap({ direction = "down" }), { repeating = true })

-- Resizing windows with mainMod + CTRL + Shift
hl.bind(mainMod .. " + CTRL + left", hl.dsp.window.resize({ x = -50, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.resize({ x = 50, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + up", hl.dsp.window.resize({ x = 0, y = -50, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + down", hl.dsp.window.resize({ x = 0, y = 50, relative = true }), { repeating = true })

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Switching workspaces with Z and X
hl.bind(mainMod .. " + Z", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + X", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + X", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.focus({ workspace = "-1" }))

-- Moving windows to a previous/next workspace with Z and X
hl.bind(mainMod .. " + CTRL + X", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(mainMod .. " + CTRL + Z", hl.dsp.window.move({ workspace = "e-1" }))

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Screenshot shortcuts
hl.bind("Print", hl.dsp.exec_cmd("grimblast copy area"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("grimblast copy screen"), { locked = true })
