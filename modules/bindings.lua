local Colors = require("modules.colors")

local mainMod = "SUPER"

local launcher = "rofi -show drun -c ~/.config/rofi/themes/launcher.rasi"
local terminal = "kitty"
local resourceManager = "kitty btop"
local music = "kitty rmpc"
local fileManager = "thunar"
local screenshot_region = [[grim -g "$(slurp -b ]]
	.. Colors.bg_strip
	.. [[80 -c ]]
	.. Colors.surface_strip
	.. [[)" - | tee ~/Pictures/screenshots/$(date +%Y-%m-%d-%H%M%S).png | wl-copy --type image/png]]

local screenshot_window = [[grim -g "$(hyprctl -j clients | jq -r '.[] | select(.workspace.id == '"$(hyprctl -j activeworkspace | jq -r '.id')"') | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' | slurp -r -b ]]
	.. Colors.bg_strip
	.. [[80 -c ]]
	.. Colors.surface_strip
	.. [[)" - | tee ~/Pictures/screenshots/$(date +%Y-%m-%d-%H%M%S).png | wl-copy --type image/png]]

-- System
hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)

-- Apps
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(launcher))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(resourceManager))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(music))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(screenshot_region))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(screenshot_window))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("pkill qs && qs"))

-- Windows
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left", group_aware = true }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right", group_aware = true }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up", group_aware = true }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down", group_aware = true }))

hl.bind(mainMod .. " + Z", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ "fullscreen", "toggle" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Workspaces
for i = 1, 5 do
	local key = i
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
hl.bind(mainMod .. " + D", function()
	hl.plugin.scrolloverview.overview("toggle all")
end)
