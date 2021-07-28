local Menu = require("nui.menu")
local event = require("nui.utils.autocmd").event
local base16 = require "base16"
local settings_manager = require '../utils/functions'
settings_manager.load_settings()

local function nui_base16_change_theme()
    	local menu = Menu( { relative = "cursor",
	  border = {
	    style = "rounded",
	    highlight = "Normal",
	    text = {
	      top = "[Themes]",
	      top_align = "left",
	    },
	  },
	  position = {
	    row = 1,
	    col = 0,
	  },
	  highlight = "Normal:Normal",
	 }, 
	 {
	  lines = {
	    Menu.item("material"),
	    Menu.item("onedark"),
	    Menu.item("nord"),
	    Menu.item("monokai"),
	    Menu.item("gruvbox-light-hard"),
	    Menu.item("twilight"),
	    Menu.item("google-light"),
	    Menu.item("google-dark"),
	    Menu.item("brewer"),
	    Menu.item("gruvbox-light-soft"),
	    Menu.item("solarized-light"),
	    Menu.item("solarized-dark"),
	    Menu.item("space"),
	    Menu.item("default"),
	    Menu.item("zenburn"),
	    Menu.item("gruvbox-light-medium"),
	    Menu.item("3024"),
	    Menu.item("github"),
	    Menu.item("tomorrow"),
	    Menu.item("gruvbox-dark-pale"),
	    Menu.item("brogrammer"),
            Menu.item("atelier-heath-light")
    	  },
	  max_width = 10,
	  separator = {
	    char = "-",
	    text_align = "right",
	  },
	  keymap = {
	    focus_next = { "j", "<Down>", "<Tab>" },
	    focus_prev = { "k", "<Up>", "<S-Tab>" },
	    close = { "<Esc>", "<C-c>" },
	    submit = { "<CR>", "<Space>" },
	  },
	  on_close = function()
	    print("CLOSED")
	  end,
	   on_submit = function(item)
	    --print("SUBMITTED", vim.inspect(item))
	    base16(base16.themes[item.text], true)
			settings_manager.set_value("current_theme", item.text)
	  end
	})

	menu:mount()
	

	menu:map("n", "l", menu.menu_props.on_submit, { noremap = true, nowait = true })

	menu:on(event.BufLeave, menu.menu_props.on_close, { once = true })

end

return {
	b16themes = nui_base16_change_theme,
}
