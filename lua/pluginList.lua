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
        use 'nvim-lua/completion-nvim'
        use "hrsh7th/nvim-compe"
        use 'L3MON4D3/LuaSnip'
        use {
            "hrsh7th/nvim-compe",
            event = "InsertEnter",
            config = function()
            require("compe-completion").config()
            end,
            wants = {"LuaSnip"},
            requires = {
                {
                    "L3MON4D3/LuaSnip",
                    wants = "friendly-snippets",
                    event = "InsertCharPre",
                    config = function()
                        require("compe-completion").snippets()
                    end
                },
                "rafamadriz/friendly-snippets"
            }
        }
        use "onsails/lspkind-nvim"
        use "sbdchd/neoformat"
        use "nvim-lua/plenary.nvim"
        use "kabouzeid/nvim-lspinstall"
        use "sheerun/vim-polyglot"
        use "lewis6991/gitsigns.nvim"
        use "akinsho/nvim-bufferline.lua"
        use "glepnir/galaxyline.nvim"
        use "windwp/nvim-autopairs"
        use "alvan/vim-closetag"
        use 'lukas-reineke/format.nvim'-- format on save
        -- use 'windwp/nvim-ts-autotag'
        --Tabnine
        use {'tzachar/compe-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-compe'}






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
        --use 
        ----use "rafamadriz/friendly-snippets"






        -- file managing , picker etc
        use "kyazdani42/nvim-tree.lua"
        use "kyazdani42/nvim-web-devicons"
        use "nvim-telescope/telescope.nvim"
        use "nvim-telescope/telescope-media-files.nvim"
        use "nvim-lua/popup.nvim"




        -- misc
        use "glepnir/dashboard-nvim"
        use "tweekmonster/startuptime.vim"
        use "907th/vim-auto-save"
        use "karb94/neoscroll.nvim"
        use "kdav5758/TrueZen.nvim"
        use "folke/which-key.nvim"
        use {"lukas-reineke/indent-blankline.nvim", branch = "lua"}






        --use 'vim-python/python-syntax'
        
        -- Java 
        use 'uiiaoo/java-syntax.vim'
        use 'mfussenegger/nvim-jdtls'

        --Coc neovim
        --use 'neoclide/coc.nvim' --Problems with compe-completion
        
        







        --Orgmode
        use {'kristijanhusak/orgmode.nvim', config = function()
                require('orgmode').setup{}
        end
        }
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

         use "sainnhe/gruvbox-material"
         use "gruvbox-community/gruvbox"
         use "Iron-E/nvim-highlite"
         use "mhartington/oceanic-next"
         use "heraldofsolace/nisha-vim"
         use "bluz71/vim-moonfly-colors"
         use "bluz71/vim-nightfly-guicolors"
         use "chuling/vim-equinusocio-material"
         use "ChristianChiarulli/nvcode-color-schemes.vim"
         use {
             "glepnir/zephyr-nvim",
             branch = "main"
          }
         use "sainnhe/sonokai"
         use "rockerBOO/boo-colorscheme-nvim"
         use "jim-at-jibba/ariake-vim-colors"
         use "Th3Whit3Wolf/onebuddy"
         use "Th3Whit3Wolf/spacebuddy"
         use {
             "ishan9299/modus-theme-vim",
             branch = "stable"
          }
         use "RishabhRD/nvim-rdark"
         use "sainnhe/edge"
         use "theniceboy/nvim-deus"
         use "bkegley/gloombuddy"
         use "monaqa/dial.nvim"







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
