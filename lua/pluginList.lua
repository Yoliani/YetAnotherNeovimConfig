local packer = require("packer")
local use = packer.use
vim.cmd("packadd packer.nvim")
-- using { } for using different branch , loading plugin with certain commands etc
return packer.startup(
  function()
    use "wbthomason/packer.nvim"
    use {"lewis6991/impatient.nvim", rocks = "mpack"}
    --Highlight
    use "nvim-treesitter/nvim-treesitter"
    use "sheerun/vim-polyglot"
    --Langs, testing  and autocompletion

    --LSP
    use "neovim/nvim-lspconfig"
    use "nvim-lua/lsp_extensions.nvim"
    --use "glepnir/lspsaga.nvim"
    use {"tami5/lspsaga.nvim"}
    use "onsails/lspkind-nvim"
    use {
      "ray-x/lsp_signature.nvim"
    }
    use "kabouzeid/nvim-lspinstall"
    --CMP
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/nvim-cmp"
    use {"tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp"}
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-vsnip"
    --Github Copílot
    use "github/copilot.vim"
    --Langs
    use {"akinsho/flutter-tools.nvim", requires = "nvim-lua/plenary.nvim"}
    --Flutter Language
    use "simrat39/rust-tools.nvim" -- Rust Language
    --For tests
    use {"mfussenegger/nvim-dap"}
    use {"nvim-telescope/telescope-dap.nvim"}
    use {"mfussenegger/nvim-dap-python"}

    --File managing and picker
    use "kyazdani42/nvim-tree.lua"
    use "kyazdani42/nvim-web-devicons"
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-media-files.nvim"
    use "nvim-lua/popup.nvim"

    --SNIPPETS
    use "hrsh7th/vim-vsnip"
    use "hrsh7th/vim-vsnip-integ"
    use "SirVer/ultisnips"
    use "rafamadriz/friendly-snippets"
    use "L3MON4D3/LuaSnip"
    --MISC
    use "folke/which-key.nvim"
    use {"lukas-reineke/indent-blankline.nvim"}
    use "vhyrro/neorg" --TAke Notes
    use "andweeb/presence.nvim" --Discord presence
    use {"ellisonleao/glow.nvim"} --For markdown
    use {"iamcco/markdown-preview.nvim", run = [[sh -c 'cd app && yarn install']]}
    use "windwp/nvim-autopairs"
    use "norcalli/nvim-colorizer.lua" --For RGB Colors etc
    use "mhinz/vim-startify"
    use "nvim-lua/plenary.nvim"
    use "tweekmonster/startuptime.vim"
    use "alvan/vim-closetag"
    use {
      "rmagatti/goto-preview",
      config = function()
        require("goto-preview").setup {}
      end
    }
    --UI
    use "MunifTanjim/nui.nvim"
    use {
      "phaazon/hop.nvim",
      as = "hop",
      config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require "hop".setup {keys = "etovxqpdygfblzhckisuran"}
      end
    }
    --Like EasyMontion
    use {
      "luukvbaal/stabilize.nvim",
      config = function()
        require("stabilize").setup()
      end
    }
    --Comments
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim"
    }
    --use "karb94/neoscroll.nvim"
    --tmux
    use "christoomey/vim-tmux-navigator"
    use "preservim/vimux"
    --GIT
    use "sindrets/diffview.nvim"
    use "lewis6991/gitsigns.nvim"

    --THEMEs
    use "marko-cerovac/material.nvim"

    use "shaunsingh/nord.nvim"
    use "Pocco81/Catppuccino.nvim"
    --Statusline and bufferline
    use {
      "hoob3rt/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }
    use "akinsho/nvim-bufferline.lua"

    --Formatters
    use "mhartington/formatter.nvim"
    use "sbdchd/neoformat"
    --Fennel
    use "Olical/aniseed"
    use {
      "rktjmp/hotpot.nvim",
      -- packer says this is "code to run after this plugin is loaded."
      -- but it seems to run before plugin/hotpot.vim (perhaps just barely)
      config = function()
        require("hotpot")
      end
    }
  end,
  {
    display = {
      border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"}
    }
  }
)
