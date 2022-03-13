local colors = require("mytheme.colors")
local config = require("mytheme.config").options

local mytheme = {}

if config.lualine_style == "mytheme" then
	mytheme.normal = {
		a = { fg = colors.accent, bg = colors.highlight },
		b = { fg = colors.title, bg = colors.bg_alt },
		c = { fg = colors.comments, bg = colors.bg },
	}

	mytheme.insert = {
		a = { fg = colors.green, bg = colors.highlight },
		b = { fg = colors.title, bg = colors.bg_alt },
	}

	mytheme.visual = {
		a = { fg = colors.purple, bg = colors.highlight },
		b = { fg = colors.title, bg = colors.bg_alt },
	}

	mytheme.replace = {
		a = { fg = colors.red, bg = colors.highlight },
		b = { fg = colors.title, bg = colors.bg_alt },
	}

	mytheme.command = {
		a = { fg = colors.yellow, bg = colors.highlight },
		b = { fg = colors.title, bg = colors.bg_alt },
	}

	mytheme.inactive = {
		a = { fg = colors.disabled, bg = colors.bg },
		b = { fg = colors.disabled, bg = colors.bg },
		c = { fg = colors.disabled, bg = colors.bg },
	}
else
	mytheme.normal = {
		a = { fg = colors.bg, bg = colors.accent, gui = "bold" },
		b = { fg = colors.title, bg = colors.bg_alt },
		c = { fg = colors.fg, bg = colors.selection },
	}

	mytheme.insert = {
		a = { fg = colors.bg, bg = colors.green, gui = "bold" },
		b = { fg = colors.title, bg = colors.bg_alt },
	}

	mytheme.visual = {
		a = { fg = colors.bg, bg = colors.purple, gui = "bold" },
		b = { fg = colors.title, bg = colors.bg_alt },
	}

	mytheme.replace = {
		a = { fg = colors.bg, bg = colors.red, gui = "bold" },
		b = { fg = colors.title, bg = colors.bg_alt },
	}

	mytheme.command = {
		a = { fg = colors.bg, bg = colors.yellow, gui = "bold" },
		b = { fg = colors.title, bg = colors.bg_alt },
	}

	mytheme.inactive = {
		a = { fg = colors.disabled, bg = colors.bg },
		b = { fg = colors.disabled, bg = colors.bg },
		c = { fg = colors.disabled, bg = colors.bg },
	}
end

return mytheme
