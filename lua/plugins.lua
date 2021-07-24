-- load all plugins
--require"pluginList"
--require "utils"

require "plugins.top-bufferline"
require "plugins.statusline"

require("colorizer").setup()
require("neoscroll").setup() -- smooth scroll

-- lsp stuff
require "plugins.nvim-lspconfig"
require "plugins.compe-completion"
  
require "plugins.highlights"
require "plugins.treesitter-nvim"
--ñrequire "mappings"
require "plugins.telescope-nvim"
require "plugins.nvimTree" -- file tree stuff
require "plugins.file-icons"
   
-- git signs , lsp symbols etc
require "plugins.gitsigns-nvim"
require("nvim-autopairs").setup()
require("lspkind").init()

--Settings--
--require('settings')
require "plugins.zenmode"
require "plugins.whichkey"
require "plugins.dashboard"
require("nvim_comment").setup()
--
--
-- Para ejecutar python con la tecla F5
require "plugins.pythonterminal"

-- Instalador de plugins similar a vim-plug
-- require "paq-nvim"

--require'lspconfig'.pyright.setup{}
--Configuracion para todos los lenguajes usados
--require('languages-config')

--Configuracion de multiples cursores como vscode
--require('multiple-cursors')

-- terminal flotante
require('plugins.float-term')

--Navigator config
require 'plugins.navigator-config'
--Discord
require 'plugins.discord'

--require'lspconfig'.pyls.setup{on_attach=require'completion'.on_attach}
require("plugins.neoformat-config")

--Todo comments
require 'plugins.todo-list'
--Configs-lsp
require 'plugins.flutter-config-tools'

require 'plugins.rust-config-tools'
-- Reload config
require 'nv-reload.init'

--Tests
--require("tests.nui_lsp")
