local o = vim.o
local cmd = vim.cmd
local opt = vim.opt
local wo = vim.wo
local bo = vim.bo
cmd("syntax on")
opt.listchars:append("eol:↴")
local filetypes_to_exclude = {
	"aerial",
	"alpha",
	"help",
	"gitcommit",
	"dashboard",
	"NvimTree",
	"packer",
	"lspinfo",
	"Startify",
	"TelescopePrompt",
	"TelescopeResults",
	"terminal",
	"Trouble",
	"undotree",
	"ChadTree",
}
require("indent_blankline").setup({
	show_end_of_line = true,
	char = "│",
	use_treesitter = true,
	show_first_indent_level = false, -- Hide indentline for the first column
	filetype_exclude = filetypes_to_exclude,
	buftype_exclude = { "terminal", "nofile" },
	space_char_blankline = " ",
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
	},
})

--for tmux
vim.cmd([[let g:tmux_navigator_save_on_switch = 2
]])
vim.cmd([[
set clipboard+=unnamedplus
set clipboard+=unnamed
filetype on
filetype plugin on
filetype plugin indent on
set completeopt=menu,menuone,noselect
set modifiable
]])

--- Settings---
o.fileencoding = "utf-8"
o.updatetime = 100
o.title = true
o.titlestring = "%<%F%=%l/%L - nvim"
o.backup = false
o.swapfile = false
o.smartindent = true
o.mouse = "a"
o.timeoutlen = 100
o.ruler = true
o.showmode = false
o.hidden = true
o.ignorecase = true
o.splitbelow = true
o.splitright = true
o.termguicolors = true
o.cmdheight = 1
o.numberwidth = 1
o.cursorline = true
o.softtabstop = 2
o.shiftwidth = 2
o.tabstop = 2
o.wildignore = "*node_modules/**"
o.pastetoggle = "<F1>"

opt.modifiable = true
opt.linebreak = true -- Break lines by spaces or tabs
opt.showmatch = true -- Highlight matching parenthesis, etc.
opt.clipboard = "unnamedplus"
opt.lazyredraw = true -- Redraw only when need to
opt.spell = false
opt.spelllang = { "en_us" }
opt.formatoptions = opt.formatoptions
	- "a" -- Auto formatting is BAD.
	- "t" -- Don't auto format my code. I got linters for that.
	+ "c" -- In general, I like it when comments respect textwidth
	+ "q" -- Allow formatting comments w/ gq
	- "o" -- O and o, don't continue comments
	+ "r" -- But do continue when pressing enter.
	+ "n" -- Indent past the formatlistpat, not underneath it.
	+ "j" -- Auto-remove comments if possible.
	- "2" -- I'm not in gradeschool anymore
-- Messages
opt.shortmess:append({
	I = true, -- No splash screen
	W = true, -- Don't print "written" when editing
	a = true, -- Use abbreviations in messages ([RO] intead of [readonly])
	c = true, -- Do not show ins-completion-menu messages (match 1 of 2)
})

local g = vim.g

g.vsnip_snippet_dir = "~/.config/nvim/snippets/"
g.mapleader = " "
g.auto_save = 0

--Windows options
wo.cul = true
wo.signcolumn = "yes"
wo.number = true
wo.wrap = true
--Buffer options
bo.expandtab = true
bo.shiftwidth = 2
bo.smartindent = true

cmd([[packadd packer.nvim]])

vim.g.rainbow_active = 1

-- Lf.vim
vim.g.lf_replace_netrw = 1
