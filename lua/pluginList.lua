local packer = require("packer")
local use = packer.use

-- using { } for using different branch , loading plugin with certain commands etc
return packer.startup(
  function()
    use "wbthomason/packer.nvim"
    use {"lewis6991/impatient.nvim", rocks = "mpack"}
    -- color related stuff
    use "norcalli/nvim-base16.lua"
    use "norcalli/nvim-colorizer.lua"

    -- lang stuff
    use "nvim-treesitter/nvim-treesitter"
    use "neovim/nvim-lspconfig"
    use "nvim-lua/lsp_extensions.nvim"
    use "glepnir/lspsaga.nvim"
    --use({'scalameta/nvim-metals'})
    --use "nvim-lua/completion-nvim"
    --[[use "hrsh7th/nvim-compe"
    use {
      "hrsh7th/nvim-compe",
      event = "InsertEnter",
      config = function()
        require "plugins.compe-completion"
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
        }
      }
    }
    --]]
    use "L3MON4D3/LuaSnip"

    use "onsails/lspkind-nvim"
    use {
      "ray-x/lsp_signature.nvim"
    }
    use "sbdchd/neoformat"
    --Formatter
    use "mhartington/formatter.nvim"
    use "nvim-lua/plenary.nvim"
    use "kabouzeid/nvim-lspinstall"
    use "sheerun/vim-polyglot"
    use "lewis6991/gitsigns.nvim"
    use "akinsho/nvim-bufferline.lua"
    --
    use {
      "glepnir/galaxyline.nvim",
      branch = "main"
    }
    --
    use {
      "glepnir/indent-guides.nvim",
      branch = "main",
      config = function()
        require("Dusk-til-Dawn").timeMan(
          function()
            require("indent_guides").setup(
              {
                even_colors = {fg = "#d3d3e7", bg = "#d3d3e7"},
                odd_colors = {fg = "#e7e7fc", bg = "#e7e7fc"},
                indent_guide_size = 4
              }
            )
            require("indent_guides").indent_guides_enable()
          end,
          function()
            require("indent_guides").setup(
              {
                even_colors = {fg = "#444155", bg = "#444155"},
                odd_colors = {fg = "#3b314d", bg = "#3b314d"},
                indent_guide_size = 4
              }
            )
            require("indent_guides").indent_guides_enable()
          end
        )()
      end
    }
    --[[
    use {
      "hoob3rt/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }
--]]
    --[[
    use {
      "projekt0n/circles.nvim",
      requires = {{"kyazdani42/nvim-web-devicons"}, {"kyazdani42/nvim-tree.lua", opt = true}}
    }
    use "kosayoda/nvim-lightbulb"
--]]
    --[[
        use {
            "glepnir/galaxyline.nvim",
            after = "nvim-base16.lua",
            config = function()
                require "plugins.statusline"
            end
        }
	--]]
    use "windwp/nvim-autopairs"
    use "alvan/vim-closetag"
    --use 'lukas-reineke/format.nvim'-- format on save

    --Tabnine
    --use {"tzachar/compe-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-compe"}
    --use {'aca/completion-tabnine',  run= './install.sh' }

    use "famiu/nvim-reload" --Reload config

    -- Comments
    use "terrortylor/nvim-comment"
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup {}
      end
    }

    -- DAP
    use {"mfussenegger/nvim-dap"}
    use {"nvim-telescope/telescope-dap.nvim"}
    use {"mfussenegger/nvim-dap-python"}
    --CMP
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/nvim-cmp"
    use {"tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp"}
    use {"saadparwaiz1/cmp_luasnip"}

    --" For vsnip user.
    use "hrsh7th/cmp-vsnip"

    -- snippet support
    use "hrsh7th/vim-vsnip"
    use "hrsh7th/vim-vsnip-integ"
    use "SirVer/ultisnips"
    use "rafamadriz/friendly-snippets"
    --use 'dsznajder/vscode-es7-javascript-react-snippets'
    --use 'xabikos/vscode-javascript'
    --use 'abusaidm/html-snippets'

    --DB
    --use {'kristijanhusak/vim-dadbod', { branch = 'async-query' }}
    --use {'kristijanhusak/vim-dadbod-completion', { type = 'opt', branch = 'async' }}
    --use {'kristijanhusak/vim-dadbod-ui', { branch = 'async' }}

    --Minimap
    use "wfxr/minimap.vim"

    --File managing , picker etc
    use "kyazdani42/nvim-tree.lua"
    use "kyazdani42/nvim-web-devicons"
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-media-files.nvim"
    use "nvim-lua/popup.nvim"

    --Para Terminal Kitty
    --use "fladson/vim-kitty"
    use "MunifTanjim/nui.nvim"

    -- misc
    use "glepnir/dashboard-nvim"
    use "tweekmonster/startuptime.vim"
    --use "907th/vim-auto-save"
    use "karb94/neoscroll.nvim"
    use "kdav5758/TrueZen.nvim"

    -- Lua twilight plugin
    use {
      "folke/twilight.nvim",
      config = function()
        require("twilight").setup {}
      end
    }
    use "folke/which-key.nvim"
    use {"lukas-reineke/indent-blankline.nvim"}
    use "mg979/vim-visual-multi" --multicursors

    -- Java
    --use 'uiiaoo/java-syntax.vim'
    use "mfussenegger/nvim-jdtls"

    -- Neorg, TAKE NOTES
    use "vhyrro/neorg"
    use {
      "vhyrro/neorg",
      after = "nvim-treesitter",
      requires = "nvim-lua/plenary.nvim"
    }

    --Terminal flotante
    use {
      "numtostr/FTerm.nvim"
    }

    --Ver diferencias del repositorio comparado con el ultimo commit
    use "sindrets/diffview.nvim"

    --Themes
    --use 'morhetz/gruvbox'
    --use "shaunsingh/moonlight.nvim"
    --use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
    --use "folke/tokyonight.nvim"
    --use "navarasu/onedark.nvim"
    use "projekt0n/github-nvim-theme"
    use {
      "projekt0n/github-nvim-theme",
      -- after = "lualine.nvim",
      config = function()
        require("github-theme").setup(
          {
            theme_style = "dark_default"
            -- your github config
          }
        )
      end
    }

    --use "EdenEast/nightfox.nvim"
    --use "bluz71/vim-nightfly-guicolors"
    use "shaunsingh/nord.nvim"
    use "Pocco81/Catppuccino.nvim"
    --Languages
    --use "fatih/vim-go" --Golang
    --use {"akinsho/flutter-tools.nvim", requires = "nvim-lua/plenary.nvim"}
    use "simrat39/rust-tools.nvim"
    --use 'mfussenegger/nvim-jdtls'
    -- Bracey live server
    --use "turbio/bracey.vim"

    -- Discord presence ---
    use "andweeb/presence.nvim"

    --Navegar
    use {
      "numToStr/Navigator.nvim",
      config = function()
        require("Navigator").setup()
      end
    }
    use "wuelnerdotexe/vim-enfocado"
    --Capturas de codigo
    use "jmckiern/vim-shoot"

    --HTTP CLIENT
    use {
      "NTBBloodbath/rest.nvim",
      requires = {"nvim-lua/plenary.nvim"},
      config = function()
        require("rest-nvim").setup()
      end
    }
  end,
  {
    display = {
      border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"}
    }
  }
)
