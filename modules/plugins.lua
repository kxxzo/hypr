-- hyprglass

if hl.plugin.hyprglass then
	local hg = hl.plugin.hyprglass

	hg.config({
		--default_theme = "dark",
		default_preset = "liquid",

		brightness = 0.9,
		dark = { brightness = 0.82 },
		light = { adaptive_boost = 0.5 },

		layers = { enabled = 1 },
	})

	-- Presets
	hg.preset("clear", {
		glass_opacity = 0.8,
		blur_strength = 1.5,
		dark = { brightness = 0.7 },
		light = { brightness = 1.2 },
	})

	hg.preset("liquid", {
		glass_opacity = 1,
		blur_strength = 5,
		blur_iterations = 2,

		edge_thickness = 0.01,
		refraction_strength = 3.0,
		lens_distortion = 0.0,

		chromatic_aberration = 0.7,
		specular_strength = 1,
		vibrancy = 0.1696,

		dark = { brightness = 0.7 },
		light = { brightness = 1.2 },
	})
end

-- Dynamic cursors

if hl.plugin.dynamic_cursors then
	hl.config({
		plugin = {
			dynamic_cursors = {
				enabled = true,
				mode = "stretch",

				threshold = 2,

				stretch = {
					-- controls how much the cursor is stretched
					-- this value controls at which speed (px/s) the full stretch is reached
					-- the full stretch being twice the original length
					limit = 3000,

					-- relationship between speed and stretch amount, supports these values:
					-- linear             - a linear function is used
					-- quadratic          - a quadratic function is used
					-- negative_quadratic - negative version of the quadratic one, feels more aggressive
					-- see `activation` in `src/mode/utils.cpp` for how exactly the calculation is done
					activation = "negative_quadratic",

					-- time window (ms) over which the speed is calculated
					-- higher values will make slow motions smoother but more delayed
					window = 100,
				},
			},
		},
	})
end
