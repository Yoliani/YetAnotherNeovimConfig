require("utils")

Option.g({
	fileencoding = "utf-8",
	updatetime = 100,
	title = true,
	titlestring = "%<%F%=%l/%L - nvim",
	backup = false,
	swapfile = false,
	smartindent = true,
	mouse = "a",
	timeoutlen = 100,
	ruler = true,
	showmode = false,
	hidden = true,
	ignorecase = true,
	splitbelow = true,
	splitright = true,
	termguicolors = true,
	cmdheight = 1,
	numberwidth = 1,
	cursorline = true,
	softtabstop = 2,
	shiftwidth = 2,
	tabstop = 2,
	wildignore = "*node_modules/**",
	pastetoggle = "<F1>",
})

Option.w({
	cul = true,
	signcolumn = "yes",
	number = true,
	wrap = true,
})

Option.b({
	expandtab = true,
	shiftwidth = 2,
	smartindent = true,
})

Variable.g({
	rainbow_active = 1,
	lf_replace_netrw = 1,
	vsnip_snippet_dir = "~/.config/nvim/snippets/",
	mapleader = " ",
	auto_save = 0,
})
