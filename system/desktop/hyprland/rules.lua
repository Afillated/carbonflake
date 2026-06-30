--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
  -- Ignore maximize requests from all apps. You'll probably like this.
  name           = "suppress-maximize-events",
  match          = { class = ".*" },

  suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
  -- Fix some dragging issues with XWayland
  name     = "fix-xwayland-drags",
  match    = {
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

hl.window_rule({
  name       = "float-file-picker",
  match      = { class = "kitty", title = "termfilechooser", },

  float      = true,
  size       = { "(monitor_w*0.5)", "(monitor_h*0.6)" },
  max_size   = { "(monitor_w*0.5)", "(monitor_h*0.6)" },
  min_size   = { "(monitor_w*0.5)", "(monitor_h*0.6)" },
  dim_around = true,
})

hl.window_rule({
  name       = "float-screen-picker",
  match      = { title = "Select what to share", },

  float      = true,
  size       = { "(monitor_w*0.5)", "(monitor_h*0.6)" },
  max_size   = { "(monitor_w*0.5)", "(monitor_h*0.6)" },
  min_size   = { "(monitor_w*0.5)", "(monitor_h*0.6)" },
  dim_around = true,
})

hl.window_rule({
  name       = "float-polkit",
  match      = { class = "org.quickshell", title = "Polkit", },

  float      = true,
  size       = { "(monitor_w*0.4)", "(monitor_h*0.4)" },
  max_size   = { "(monitor_w*0.4)", "(monitor_h*0.4)" },
  min_size   = { "(monitor_w*0.4)", "(monitor_h*0.4)" },
  dim_around = true,
})

hl.window_rule({
  name    = "blur-kitty",
  match   = { class = "kitty" },
  opacity = 0.85,
})

hl.window_rule({
  name = "steam-games",
  match = { initial_class = "steam_app_.*" },
  content = "game",
  render_unfocused = true,
})

hl.workspace_rule({
  workspace = "special:magic",
  layout = "scrolling"
})

hl.workspace_rule({
  workspace = "1",
  persistent = true,
  monitor = "eDP-1"
})

hl.workspace_rule({
  workspace = "2",
  persistent = true,
  monitor = "eDP-1"
})

hl.workspace_rule({
  workspace = "3",
  persistent = true,
  monitor = "eDP-1"
})

hl.layer_rule({
  match = { namespace = "quickshell" },
  blur = true,
  blur_popups = true,
  animation = "popin 87%",
  ignore_alpha = 0.1,
})

hl.layer_rule({
  match        = { namespace = "rofi" },
  blur         = true,
  ignore_alpha = 0.5,
  animation    = "popin 80%"
})
