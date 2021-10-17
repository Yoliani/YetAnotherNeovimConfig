local packer = require("packer")
local use = packer.use

-- using { } for using different branch , loading plugin with certain commands etc
return packer.startup(
  function()
    use "wbthomason/packer.nvim"
    use {"lewis6991/impatient.nvim", rocks = "mpack"}
    --Highlight
    use "nvim-treesitter/nvim-treesitter"

    --Langs, testing  and autocompletion
    --LSP
    use "neovim/nvim-lspconfig"
    use "nvim-lua/lsp_extensions.nvim"
    use "glepnir/lspsaga.nvim"
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

    --MISC
    use "folke/which-key.nvim"
    use {"lukas-reineke/indent-blankline.nvim"}
    use "vhyrro/neorg" --TAke Notes
    use "andweeb/presence.nvim" --Discord presence
    use "windwp/nvim-autopairs"
    use "nvim-lua/plenary.nvim"
    use {
      "blackCauldron7/surround.nvim",
      config = function()
        require "surround".setup {mappings_style = "sandwich"}
      end
    }
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
  end,
  {
    display = {
      border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"}
    }
  }
)
