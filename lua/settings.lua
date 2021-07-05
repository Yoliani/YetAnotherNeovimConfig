
local cmd = vim.cmd
local g = vim.g
local opt = vim.opt
g.mapleader = " "
g.auto_save = 0

--Requeimientos
--


-- colorscheme related stuff
cmd "syntax on"

--Themes
--local base16 = require "base16"
--base16(base16.themes["onedark"], true)
--base16(base16.themes["gruvbox"], true)

cmd('colorscheme gruvbox')
--require('moonlight').set()

--- Settings ----
opt.fileencoding = "utf-8"  -- the encoding written to a file
opt.updatetime   = 200   -- faster completion
opt.title        = true   -- set the title of window to the value of the titlestring
opt.titlestring  = "%<%F%=%l/%L - nvim"    -- what the title of the window will be set to
opt.backup          = false                     -- creates a backup file
opt.swapfile        = false                     -- creates a swapfile
opt.smartindent     = true                      -- make indenting smarter again


-- blankline

g.indentLine_enabled = 1
g.indent_blankline_char = "▏"

g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
g.indent_blankline_buftype_exclude = {"terminal"}

g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level = false
