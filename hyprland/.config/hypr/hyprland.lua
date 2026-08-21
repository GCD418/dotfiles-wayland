-- ~/.config/hypr/hyprland.lua

-- ==========================================
-- 1. VARIABLES
-- ==========================================
local mainMod = "SUPER"
local terminal = "ghostty"
local fileManager = "dolphin"
local menu = "wofi --show drun"

-- ==========================================
-- 2. MONITORS & ENV VARS
-- ==========================================
-- Your specific eDP-1 and Samsung monitors
hl.monitor({ output = "eDP-1", mode = "1920x1080@60", position = "auto", scale = "1.25" })
hl.monitor({ output = "desc:Samsung Electric Company LS24A33x H4TW205184", mode = "preferred", position = "auto-left", scale = "1.0" })
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "1.25", mirror = "eDP-1" })

hl.env("GDK_SCALE", "1.25")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("HYPRCURSOR_SIZE", "24")

-- ==========================================
-- 3. AUTOSTART
-- ==========================================
-- Autostart processes are now wrapped in an event listener
hl.on("hyprland.start", function ()
  hl.exec_cmd("hyprpaper & waybar & swaync & hypridle")
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)

-- ==========================================
-- 4. CONFIGURATION (General, Decoration, Input)
-- ==========================================
-- Grouped into a single hl.config table
hl.config({
  xwayland = { force_zero_scaling = true },
  general = {
    gaps_in = 5,
    gaps_out = 6,
    border_size = 2,
    resize_on_border = true,
    allow_tearing = false
  },
  decoration = {
    rounding = 4,
    active_opacity = 1.0,
    inactive_opacity = 1.0,
    shadow = { enabled = true, range = 4, render_power = 3, color = "rgba(1a1a1aee)" },
    blur = { enabled = true, size = 3, passes = 4, new_optimizations = true, ignore_opacity = true }
  },
  input = {
    kb_layout = "us, latam",
    kb_options = "grp:alt_shift_toggle",
    follow_mouse = 1,
    touchpad = { natural_scroll = true }
  }
})

-- ==========================================
-- 5. KEYBINDS
-- ==========================================
-- WORKSPACES
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("hyprctl dispatch togglefloating"))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("pkill wofi --show drun || wofi --show drun"), { release = true })

for i = 1, 10 do
  local key = i % 10 

  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))

  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mainMod .. " + C",hl.dsp.window.close())

--CHANGE FOCUS --

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left"} ))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down"} ))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up"} ))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right"} ))

--USEFUL --
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot-fixed.sh"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot-fixed-region.sh"))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("systemctl sleep"))

hl.bind(mainMod .. " + SHIFT + P",hl.dsp.dpms({ action = "toggle"}))
--MEDIA
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { repeating = true })

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"),       { locked = true })
