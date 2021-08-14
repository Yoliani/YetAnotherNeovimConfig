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
vcmd "colorscheme onedark"

require('utils')

-- colorscheme related stuff
--Themes
--local base16 = require "base16"
--base16(base16.themes["onedark"], true)
--require('moonlight').set()


--- Settings ----
Option.g{
  fileencoding = "utf-8",  -- the encoding written to a file
  updatetime   = 100,   -- faster completion
  title        = true,   -- set the title of window to the value of the titlestring
  titlestring  = "%<%F%=%l/%L - nvim",    -- what the title of the window will be set to
  backup          = false,                     -- creates a backup file
  swapfile        = false,                     -- creates a swapfile
  smartindent     = false,                      -- make indenting smarter again
  
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
  numberwidth = 1,
  cursorline = true,
  
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
  vsnip_snippet_dir = "~/.config/nvim/snippets",
  mapleader = " ",
  auto_save = 0,
}


--Windows options
Option.w {
  cul = true,
  signcolumn =  "yes",
  number = true,
  
  
}

--Buffer options
Option.b {
  expandtab = false,
  shiftwidth = 2,
  smartindent = true,
}

vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost pluginsList.lua PackerCompile'

vcmd([[
    if has('nv  im-0.5')
        augroup lsp
        au!
        au FileType java lua require('jdtls').start_or_attach({cmd = {'java-lsp.sh'}})
        augroup end
    endif
    ]])

vcmd([[autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4]])

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


vim.cmd("source $HOME/.config/nvim/plugins/kite.vim")

--[[
vim.cmd("source $HOME/.config/nvim/plugins/jdtls.vim")

vim.cmd([[if has('nvim-0.6')
 			 augroup lsp
   			 au!
		    	  au FileType java lua require('jdtls').start_or_attach({cmd = {'java-lsp.sh'}})
  			 augroup end
		      endif]]--)

vim.cmd("set guicursor=v-c-sm:block,n-i-ci-ve:ver25,r-cr-o:hor20")
