vim.opt.termguicolors = true
local vcmd = vim.cmd
vcmd "syntax on"
--vcmd "set t_Co=256"

--vcmd ":hi NonText guifg=bg"

vim.opt.list = true
vim.opt.listchars:append("eol:↴")
vim.opt.listchars:append("space:⋅")

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

local catppuccino = require("catppuccino")

-- configure it
catppuccino.setup(
  {
    colorscheme = "neon_latte",
    transparency = false,
    term_colors = true,
    styles = {
      comments = "italic",
      functions = "italic",
      keywords = "italic",
      strings = "bold",
      variables = "NONE"
    },
    integrations = {
      treesitter = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = "italic",
          hints = "italic",
          warnings = "italic",
          information = "italic"
        },
        underlines = {
          errors = "underline",
          hints = "underline",
          warnings = "underline",
          information = "underline"
        }
      },
      lsp_trouble = true,
      lsp_saga = true,
      gitgutter = true,
      gitsigns = true,
      telescope = true,
      nvimtree = {
        enabled = true,
        show_root = true
      },
      which_key = true,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = true
      },
      dashboard = true,
      neogit = false,
      vim_sneak = false,
      fern = false,
      barbar = false,
      bufferline = true,
      markdown = true,
      lightspeed = false,
      ts_rainbow = true,
      hop = false
    }
  }
)
vim.cmd [[colorscheme catppuccino ]]

--- Settingtrue-
vim.o.fileencoding = "utf-8" -- the encoding written to a file
vim.o.updatetime = 500 -- faster completion
vim.o.title = true -- set the title of window to the value of the titlestring
vim.o.titlestring = "%<%F%=%l/%L - nvim"
-- what the title of the window will be set to
vim.o.backup = false -- creates a backup file
vim.o.swapfile = false
-- creates a swapfile
vim.o.smartindent = false -- make indenting smarter again
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
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

local g = vim.g
g.indentLine_enabled = 1
g.indent_blankline_char = "│"
g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
g.indent_blankline_buftype_exclude = {"terminal"}
g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level = false
g.vsnip_snippet_dir = "~/.config/nvim/snippets/"
g.mapleader = " "
g.auto_save = 0

--Windows options

vim.wo.cul = true
vim.wo.signcolumn = "yes"
vim.wo.number = true

--Buffer options

vim.bo.expandtab = false
vim.bo.shiftwidth = 1
vim.bo.smartindent = true

vim.cmd [[packadd packer.nvim]]
vim.o.pastetoggle = "<F14>"
vim.cmd [[
set clipboard+=unnamedplus
filetype on
filetype plugin on
filetype plugin indent on
set completeopt=menu,menuone,noselect
set modifiable
]]
vim.cmd "autocmd BufWritePost pluginsList.lua PackerCompile"

vcmd([[autocmd Filetype python setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2]])

-- hide line numbers , statusline in specific buffers!
vim.api.nvim_exec(
  [[
   au BufEnter term://* setlocal nonumber
   au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif
   au BufEnter term://* set laststatus=0 
]],
  false
)

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
