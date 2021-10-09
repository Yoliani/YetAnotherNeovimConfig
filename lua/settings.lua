local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opts(scope, key, value)
  scopes[scope][key] = value
  if scope ~= "o" then
    scopes["o"][key] = value
  end
end
opts("o", "termguicolors", true)
vim.opt.termguicolors = true
local vcmd = vim.cmd
vcmd "syntax on"
--vcmd "set t_Co=256"

--[[
require("circles").setup(
  {
    icons = {
      empty = "",
      filled = "",
      lsp_prefix = ""
    },
    -- override lsp_diagnostic virtual-text icon with `icons.lsp_prefix`
    lsp = true
  }
)
--]]
--vcmd "colorscheme enfocado"
vcmd ":hi NonText guifg=bg"
-- Example in lua
--vim.g.nightfox_style = "palefox"
--vim.g.nightfox_color_delimiter = "red"
--vim.g.nightfox_italic_comments = 1
local catppuccino = require("catppuccino")

-- configure it
catppuccino.setup(
  {
    colorscheme = "dark_catppuccino",
    transparency = false,
    term_colors = true,
    styles = {
      comments = "italic",
      functions = "italic",
      keywords = "italic",
      strings = "NONE",
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
      gitgutter = false,
      gitsigns = true,
      telescope = true,
      nvimtree = {
        enabled = true,
        show_root = true
      },
      which_key = true,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = false
      },
      dashboard = true,
      neogit = false,
      vim_sneak = false,
      fern = false,
      barbar = false,
      bufferline = false,
      markdown = false,
      lightspeed = false,
      ts_rainbow = false,
      hop = false
    }
  }
)
-- Load the colorscheme
--require("nightfox").set()

vim.cmd [[colorscheme catppuccino]]
require("utils")

-- colorscheme related stuff
--Themes
--local base16 = require "base16"
--base16(base16.themes["onedark"], true)
--require('moonlight').set()

--- Settings ----
Option.g {
  fileencoding = "utf-8", -- the encoding written to a file
  updatetime = 200, -- faster completion
  title = true, -- set the title of window to the value of the titlestring
  titlestring = "%<%F%=%l/%L - nvim", -- what the title of the window will be set to
  backup = false, -- creates a backup file
  swapfile = false, -- creates a swapfile
  smartindent = false, -- make indenting smarter again
  mouse = "a",
  clipboard = "unnamedplus",
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
  cursorline = true

  --columns = 100,
  --lines = 50,
}

Variable.g {
  indentLine_enabled = 1,
  indent_blankline_char = "▏",
  indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"},
  indent_blankline_buftype_exclude = {"terminal"},
  indent_blankline_show_trailing_blankline_indent = false,
  indent_blankline_show_first_indent_level = false,
  vsnip_snippet_dir = "~/.config/nvim/snippets/",
  mapleader = " ",
  auto_save = 0
}

--Windows options
Option.w {
  cul = true,
  signcolumn = "yes",
  number = true
}

--Buffer options
Option.b {
  expandtab = false,
  shiftwidth = 2,
  smartindent = true
}

vim.cmd [[packadd packer.nvim]]
vim.cmd "autocmd BufWritePost pluginsList.lua PackerCompile"
--[[
vim.cmd(
  [[
  
    augroup lsp
      au!
      au FileType java lua require('jdtls').start_or_attach({cmd = {'~/.config/nvim/plugins/java-lsp.sh'}})
    augroup end
  
]]
--)]]

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

--vim.cmd("source $HOME/.config/nvim/plugins/kite.vim")
--vim.cmd("source $HOME/.config/nvim/plugins/jdtls.vim")

--)

--[[
vim.cmd("source $HOME/.config/nvim/plugins/jdtls.vim")

vim.cmd([[if has('nvim-0.6')
 			 augroup lsp
   			 au!
		    	  au FileType java lua require('jdtls').start_or_attach({cmd = {'java-lsp.sh'}})
  			 augroup end
		      endif]]
--vim.cmd("set guicursor=v-c-sm:block,n-i-ci-ve:ver25,r-cr-o:hor20")
