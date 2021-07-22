local packer = require("packer")
local use = packer.use

-- using { } for using different branch , loading plugin with certain commands etc
return packer.startup(
    function()
        use "wbthomason/packer.nvim"

        -- color related stuff
        use "siduck76/nvim-base16.lua"
        use "norcalli/nvim-colorizer.lua"
  
        -- lang stuff
        use "nvim-treesitter/nvim-treesitter"
        use "neovim/nvim-lspconfig"
        use "nvim-lua/lsp_extensions.nvim"
        use "glepnir/lspsaga.nvim"
        use({'scalameta/nvim-metals'})
        use 'nvim-lua/completion-nvim'
        use "hrsh7th/nvim-compe"
        use {
            "hrsh7th/nvim-compe",
            event = "InsertEnter",
            config = function()
                require "plugins.compe"
            end,
            wants = "LuaSnip",
            requires = {
                {
                    "L3MON4D3/LuaSnip",
                    wants = "friendly-snippets",
                    event = "InsertCharPre",
                    config = function()
                        require "plugins.luasnip"
                    end
                },
                {
                    "rafamadriz/friendly-snippets",
                    event = "InsertCharPre"
                },
                
            }
        }
        use 'L3MON4D3/LuaSnip'
        use 'mfussenegger/nvim-dap' --debugger
        
        use "onsails/lspkind-nvim"
        use "sbdchd/neoformat"
        use "nvim-lua/plenary.nvim"
        use "kabouzeid/nvim-lspinstall"
        --use "sheerun/vim-polyglot"
        use "lewis6991/gitsigns.nvim"
        use "akinsho/nvim-bufferline.lua"
        use "glepnir/galaxyline.nvim"
        use {
            "glepnir/galaxyline.nvim",
            after = "nord.nvim",
            config = function()
                require "plugins.statusline"
            end
        }
        use "windwp/nvim-autopairs"
        use "alvan/vim-closetag"
        use 'lukas-reineke/format.nvim'-- format on save
        
        --Tabnine
        use {'tzachar/compe-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-compe'}
        --use {'aca/completion-tabnine',  run= './install.sh' }

        use 'famiu/nvim-reload' --Reload config
        


        -- Comments
        use "terrortylor/nvim-comment"
        use {
          "folke/todo-comments.nvim",
          requires = "nvim-lua/plenary.nvim",
          config = function()
            require("todo-comments").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            }
         end
        }



        -- snippet support
        use "hrsh7th/vim-vsnip"
        use "hrsh7th/vim-vsnip-integ"
        use 'SirVer/ultisnips'
        use "rafamadriz/friendly-snippets"
        --use 'dsznajder/vscode-es7-javascript-react-snippets'
        --use 'xabikos/vscode-javascript'
        --use 'abusaidm/html-snippets'





        --ile managing , picker etc
        use "kyazdani42/nvim-tree.lua"
        use "kyazdani42/nvim-web-devicons"
        use "nvim-telescope/telescope.nvim"
        use "nvim-telescope/telescope-media-files.nvim"
        use "nvim-lua/popup.nvim"




        -- misc
        use {
            "glepnir/dashboard-nvim",
            cmd = {
                "Dashboard",
                "DashboardNewFile",
                "DashboardJumpMarks",
                "SessionLoad",
                "SessionSave"
            },
            setup = function()
                require "plugins.dashboard"
            end
        }

        use "tweekmonster/startuptime.vim"
        use "907th/vim-auto-save"
        use "karb94/neoscroll.nvim"
        use "kdav5758/TrueZen.nvim"
            
        -- Lua twilight plugin
        use {
            "folke/twilight.nvim",
            config = function()
                require("twilight").setup {
                    -- your configuration comes here
                    -- or leave it empty to use the default settings
                     -- refer to the configuration section below
                }
            end
        }
        use "folke/which-key.nvim"
        use {"lukas-reineke/indent-blankline.nvim"}
        use 'mg979/vim-visual-multi' --multicursors





        --use 'vim-python/python-syntax'
        
        -- Java 
        --use 'uiiaoo/java-syntax.vim'
        use 'mfussenegger/nvim-jdtls'

        --Coc neovim
        --use 'neoclide/coc.nvim' --Problems with compe-completion and disable automatically by Kite
        
        






    
        --Orgmode
        --[[
        use {'kristijanhusak/orgmode.nvim', config = function()
                require('orgmode').setup{}
        end
        }--]]
        --https://github.com/kristijanhusak/orgmode.nvim
        
        --Para Maven Proyects
        --use 'mikelue/vim-maven-plugin'





        --Terminal flotante
        use {
            "numtostr/FTerm.nvim",
            config = function()
              require("FTerm").setup()
            end
        }




        
        --Ver diferencias del repositorio comparado con el ultimo commit
         use 'sindrets/diffview.nvim'






         --Themes
         --use 'morhetz/gruvbox'
         use 'shaunsingh/moonlight.nvim'
         use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
         use 'folke/tokyonight.nvim'
         use 'projekt0n/github-nvim-theme'
         

        --Languages 
        --use "fatih/vim-go" --Golang
        use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}
        use 'simrat39/rust-tools.nvim'

        -- Bracey live server
         use 'turbio/bracey.vim'



         -- Discord presence ---
         use 'andweeb/presence.nvim'
        



         --Navegar
         use { 'numToStr/Navigator.nvim', 
               config = function()
                  require('Navigator').setup()
               end
            }





        --Capturas de codigo
         use 'jmckiern/vim-shoot'





        --HTTP CLIENT
         use {
            'NTBBloodbath/rest.nvim',
            requires = { 'nvim-lua/plenary.nvim' },
            config = function()
                require('rest-nvim').setup()
            end
         }
   end,
        
    {
        display = {
            border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"}
        }
    }
)
