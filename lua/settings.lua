vim.opt.termguicolors = true
local vcmd = vim.cmd
local opt = vim.opt
vcmd "syntax on"
--vcmd "set t_Co=256"

--vcmd ":hi NonText guifg=bg"

vim.opt.list = true

vim.opt.listchars = {
  nbsp = "⦸", -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
  extends = "»", -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
  precedes = "«", -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
  tab = "▷─", -- WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7) + BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL (U+2505, UTF-8: E2 94 85)
  --  trail = "•", -- BULLET (U+2022, UTF-8: E2 80 A2)
  space = " "
}
vim.opt.fillchars = {
  diff = "∙", -- BULLET OPERATOR (U+2219, UTF-8: E2 88 99)
  -- eob = " ", -- NO-BREAK SPACE (U+00A0, UTF-8: C2 A0) to suppress ~ at EndOfBuffer
  fold = "·", -- MIDDLE DOT (U+00B7, UTF-8: C2 B7)
  vert = " " -- remove ugly vertical lines on window division
}

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

vim.opt.listchars:append("eol:↴")
--vim.opt.listchars:append("space:⋅")

require("indent_blankline").setup {
  show_end_of_line = true,
  char = "│",
  buftype_exclude = {"terminal", "help", "dashboard"},
  space_char_blankline = " ",
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6"
  }
}

--for tmux
vim.cmd [[let g:tmux_navigator_save_on_switch = 2
]]
vim.cmd(
  [[
set clipboard+=unnamedplus
set clipboard+=unnamed
filetype on
filetype plugin on
filetype plugin indent on
set completeopt=menu,menuone,noselect
set modifiable
]]
)
--- Settingtrue-
vim.o.fileencoding = "utf-8" -- the encoding written to a file
vim.o.updatetime = 100 -- faster completion
vim.o.title = true -- set the title of window to the value of the titlestring
vim.o.titlestring = "%<%F%=%l/%L - nvim"
-- what the title of the window will be set to
vim.o.backup = false -- creates a backup file
vim.o.swapfile = false
-- creates a swapfile
vim.o.smartindent = true -- make indenting smarter again
vim.o.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.o.timeoutlen = 100
vim.o.ruler = true
vim.o.showmode = false
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.cmdheight = 1
vim.o.numberwidth = 1
vim.o.cursorline = true
vim.o.softtabstop = 2
vim.o.shiftwidth = 2 -- spaces per tab (when shifting), when using the >> or << commands, shift lines by 4 spaces
vim.o.tabstop = 2
vim.opt.modifiable = true
vim.o.wildignore = "*node_modules/**"
vim.opt.linebreak = true -- Break lines by spaces or tabs
opt.showmatch = true -- Highlight matching parenthesis, etc.

opt.lazyredraw = true -- Redraw only when need to
opt.formatoptions =
  table.concat {
  "c", -- Auto-wrap comments
  "a", -- Auto format paragraph
  "2", -- Use the second line's indent vale when indenting (allows indented first line)
  "q", -- Formatting comments with `gq`
  "w", -- Trailing whitespace indicates a paragraph
  "j", -- Remove comment leader when makes sense (joining lines)
  "r", -- Insert comment leader after hitting Enter
  "o" -- Insert comment leader after hitting `o` or `O`
}

-- Messages
opt.shortmess:append {
  I = true, -- No splash screen
  W = true, -- Don't print "written" when editing
  a = true, -- Use abbreviations in messages ([RO] intead of [readonly])
  c = true -- Do not show ins-completion-menu messages (match 1 of 2)
}

local g = vim.g
g.indentLine_enabled = 1
g.indent_blankline_char = "│"
g.indent_blankline_filetype_exclude = {
  "help",
  "terminal",
  "dashboard",
  "packer",
  "lspinfo",
  "TelescopePrompt",
  "TelescopeResults"
}
g.indent_blankline_buftype_exclude = {"terminal", "dashboard"}
g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level = false
g.vsnip_snippet_dir = "~/.config/nvim/snippets/"
g.mapleader = " "
g.auto_save = 0

--Windows options

vim.wo.cul = true
vim.wo.signcolumn = "yes"
vim.wo.number = true
--vim.wo.wrap = true
--Buffer options

vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.smartindent = true

vim.cmd [[packadd packer.nvim]]
vim.o.pastetoggle = "<F1>"
--set clipboard+=unnamedplus

--vim.cmd "autocmd BufWritePost pluginsList.lua PackerCompile"

--vcmd([[autocmd Filetype python setlocal expandtab tabstop=2 shiftwidth=2
--softtabstop=2]])

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
  "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

--mouse
vim.cmd [[
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
]]

local cmd = vim.cmd
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
