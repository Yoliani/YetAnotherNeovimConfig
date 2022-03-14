local o = vim.o
local cmd = vim.cmd
local opt = vim.opt
local wo = vim.wo
local bo = vim.bo
-- vim.cmd([[ set termguicolors
--             let &t_8f = "\e[38;2;%lu;%lu;%lum"
--             let &t_8b = "\e[48;2;%lu;%lu;%lum"
-- ]])

cmd("syntax on")
-- opt.list = true
--
-- opt.listchars = {
--   nbsp = "⦸",
--   extends = "»",
--   precedes = "«",
--   tab = "─",
--   --  trail = "•",
--   space = " "
-- }
-- opt.fillchars = {
--   diff = "∙",
--   -- eob = " ",
--   fold = "·",
--   vert = " "
-- }

-- opt.list = true
-- opt.listchars = {
--   nbsp = '⦸', -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
--   tab = '  ',
--   extends = '»', -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
--   precedes = '«', -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
--   trail = '·', -- Dot Operator (U+22C5)
-- }
-- -- Show cool character on line wrap
-- opt.showbreak = '↳ ' -- DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3, UTF-8: E2 86 B3)
-- opt.fillchars = {
--   eob = ' ', -- Suppress ~ at EndOfBuffer
--   fold = ' ', -- Hide trailing folding characters
-- }

opt.listchars:append("eol:↴")
--opt.listchars:append("space:⋅")
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

g.vsnip_snippet_dir = vim.fn.expand('~/.config/nvim/extra/snippets')

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

--set clipboard+=unnamedplus

--vim.cmd "autocmd BufWritePost pluginsList.lua PackerCompile"

cmd([[autocmd Filetype python setlocal expandtab tabstop=2 shiftwidth=2]])

-- hide line numbers , statusline in specific buffers!
--vim.api.nvim_exec(
--  [[
--au BufEnter term://* setlocal nonumber
--   au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif
--   au BufEnter term://* set laststatus=0
--]],
--  false
--)

--plugins included with neovim
local disabled_built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

--mouse
cmd([[
 let g:is_mouse_enabled = 1 
  noremap <silent> <Leader>mo :call ToggleMouse()<CR> 
  function ToggleMouse() 
      if g:is_mouse_enabled == 1 
          echo "Mouse OFF" 
          set mouse= 
          let g:is_mouse_enabled = 0 
      else 
          echo "Mouse ON" 
          set mouse=a 
          let g:is_mouse_enabled = 1 
      endif 
  endfunction
]])

-- 2 spaces for selected filetypes
-- vim.cmd([[ autocmd FileType xml,html,xhtml,css,scssjavascript,lua,dart setlocal shiftwidth=2 tabstop=2 ]])
-- -- json
-- vim.cmd([[ au BufEnter *.json set ai expandtab shiftwidth=2 tabstop=2 sta fo=croql ]])
-- cmd(
--   [[
-- if has("autocmd")
--   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
-- endif
-- ]]
-- )

--cmd("autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=grey") --to Show whitespace, MUST be inserted BEFORE the colorscheme command
--
vim.g.rainbow_active = 1

-- Lf.vim
vim.g.lf_replace_netrw = 1
--[[ vim.gNERDTreeHijackNetrw = 0 ]]
