local colors = require("modules.colors")

hl.config({
	general = {
		layout = "dwindle",
		allow_tearing = false,

		gaps_in = 10,
		gaps_out = 20,

		border_size = 1,
		col = {
			active_border = colors.surface,
			inactive_border = colors.surface,
		},
	},
	dwindle = {
		preserve_split = true,
	},
	decoration = {
		rounding = 10,
		rounding_power = 2,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		blur = {
			enabled = true,
			size = 5,
			passes = 2,
			vibrancy = 0.1696,
		},
		shadow = {
			enabled = true,
			range = 2,
			render_power = 0,
			color = colors.bg,
		},
	},
	misc = {
		vrr = 1,
	},
})

hl.env("XCURSOR_THEME", "macOS")
hl.env("XCURSOR_SIZE", "33")
