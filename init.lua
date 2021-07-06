
-- load all plugins
require "pluginList"
require "misc-utils"

require "top-bufferline"
require "statusline"

require("colorizer").setup()
require("neoscroll").setup() -- smooth scroll

-- lsp stuff
require "nvim-lspconfig"
require "compe-completion"

require "highlights"
require "treesitter-nvim"
require "mappings"
require "telescope-nvim"
require "nvimTree" -- file tree stuff
require "file-icons"

-- git signs , lsp symbols etc
require "gitsigns-nvim"
require("nvim-autopairs").setup()
require("lspkind").init()

--Settings--
require('settings')

-- hide line numbers , statusline in specific buffers!
vim.api.nvim_exec(
    [[
   au BufEnter term://* setlocal nonumber
   au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif
   au BufEnter term://* set laststatus=0 
]],
    false
)

require "zenmode"
require "whichkey"
require "dashboard"
require("nvim_comment").setup()

-- Para ejecutar python con la tecla F5
require "pythonterminal"

-- Instalador de plugins similar a vim-plug
-- require "paq-nvim"

require'lspconfig'.pyright.setup{}
--Configuracion para todos los lenguajes usados
require('languages-config')

-- Configuracion de multiples cursores como vscode
require('multiple-cursors')

-- terminal flotante
require('float-term')

--Navigator config
require 'navigator-config'
--Discord
require 'discord'

--require'lspconfig'.pyls.setup{on_attach=require'completion'.on_attach}
require("neoformat-config")

--Todo comments
require 'todo-list'

--TODO: Mejorar neovim
--
-- 
