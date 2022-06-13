local status, telescope = pcall(require, "telescope")
if not status then
	return
end
telescope.load_extension("media_files")
telescope.load_extension("workspaces")
telescope.setup({
	defaults = {
		color_devicons = true,
		prompt_prefix = "🔍",
		selection_caret = "➤ ",
		entry_prefix = "  ",
		file_ignore_patterns = {
			".git/",
			"%.csv",
			-- "%.jpg",
			-- "%.jpeg",
			-- "%.png",
			-- "%.svg",
			"%.otf",
			"%.ttf",
			"%.lock",
			"__pycache__/*",
			"%.sqlite3",
			"%.ipynb",
			"vendor/*",
			"node_modules/*",
			"node_modules",
		},
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "flex",
		layout_config = {
			horizontal = {
				mirror = false,
			},
			vertical = {
				mirror = false,
			},
		},
		winblend = 9,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		use_less = true,
		path_display = { "smart" },
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		generic_sorter = require("telescope.sorters").get_fzy_sorter,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			'--ignore-file',
      '.gitignore'
		},
	},
	extensions = {
		media_files = {
			filetypes = { "png", "webp", "jpg", "jpeg" },
			find_cmd = "rg", -- find command (defaults to `fd`)
		},
		dash = {
			file_type_keywords = {
				dashboard = false,
				NvimTree = false,
				TelescopePrompt = false,
				terminal = false,
				packer = false,
				-- a table of strings will search on multiple keywords
				javascript = { "javascript", "nodejs" },
				typescript = { "typescript", "javascript", "nodejs" },
				ruby = { "ruby", "eruby", "rails", "rspec", "rspec-rails" },
			},
		},
		frecency = {
			show_scores = false,
			show_unindexed = true,
			ignore_patterns = {
				"*.git/*",
				"*/tmp/*",
				"*/node_modules/*",
				"*/vendor/*",
			},
		},
		workspaces = {
			-- keep insert mode after selection in the picker, default is false
			keep_insert = true,
		},
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = false, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
})
