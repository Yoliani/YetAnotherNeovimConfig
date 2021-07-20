local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opts(scope, key, value)
    scopes[scope][key] = value
    if scope ~= "o" then
        scopes["o"][key] = value
    end
  end
opts("o", "termguicolors", true)
local function isempty(s)
    return s == nil or s == ''
end

require('utils')
local g = vim.g
local cmd = vim.cmd
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
--[[
require("github-theme").setup({
  themeStyle = "dark",
  commentStyle = "italic",
  keywordStyle = "italic",
  functionStyle = "italic",
  variableStyle = "italic"
  -- ... your github-theme config
})
--]]--

--- Settings ----
Option.g{
  fileencoding = "utf-8",  -- the encoding written to a file
  updatetime   = 100,   -- faster completion
  title        = true,   -- set the title of window to the value of the titlestring
  titlestring  = "%<%F%=%l/%L - nvim",    -- what the title of the window will be set to
  backup          = false,                     -- creates a backup file
  swapfile        = false,                     -- creates a swapfile
  smartindent     = true,                      -- make indenting smarter again
  
  mouse = "a",
  clipboard = "unnamedplus",
  timeoutlen = 500,
  ruler = true,
  showmode = false,
  hidden = true,
  ignorecase = true,
  splitbelow = true,
  splitright = true,
  termguicolors =  true,
  cmdheight = 1,
  numberwidth = 2,
}


Variable.g {
  indentLine_enabled = 1,
  indent_blankline_char = "▏",

  indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"},
  indent_blankline_buftype_exclude = {"terminal"},

  indent_blankline_show_trailing_blankline_indent = false,
  indent_blankline_show_first_indent_level = false,
  vsnip_snippet_dir = "~/.config/nvim/snippets",

}


--Windows options
Option.w {
  cul = true,
  signcolumn =  "yes",
  number = true,

}

--Buffer options
Option.b {
  expandtab = true,
  shiftwidth = 2,
  smartindent = true,
}


cmd([[
    if has('nv  im-0.5')
        augroup lsp
        au!
        au FileType java lua require('jdtls').start_or_attach({cmd = {'java-lsp.sh'}})
        augroup end
    endif
    ]])

  cmd([[autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4]])




