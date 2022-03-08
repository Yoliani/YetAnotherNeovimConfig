local present, packer = pcall(require, "plugins.packerInit")

if not present then
	print("packerInit plugin not found, disabling packer")
	return
end

return packer.startup(function(use, use_rocks)
	use_rocks("penlight")

	use("wbthomason/packer.nvim")
	use({ "lewis6991/impatient.nvim", rocks = "mpack" })
	--Highlight
	use("sheerun/vim-polyglot")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use({
		"JoosepAlviste/nvim-ts-context-commentstring", -- Smart commenting in multi language files - Enabled in Treesitter file
		after = "nvim-treesitter",
	})
	use({
		"David-Kunz/treesitter-unit", -- Select a Treesitter unit
		after = "nvim-treesitter",
	})
	use({
		"nvim-treesitter/playground", -- View Treesitter definitions
		cmd = "TSPlaygroundToggle",
	})

	use({
		"kristijanhusak/orgmode.nvim",
		config = function()
			require("orgmode").setup({})
		end,
	})

	--Langs, testing  and autocompletion

	--LSP
	use("williamboman/nvim-lsp-installer")
	use("neovim/nvim-lspconfig")
	use("jose-elias-alvarez/null-ls.nvim")
	use("jose-elias-alvarez/nvim-lsp-ts-utils")
	use("nvim-lua/lsp_extensions.nvim")
	use("nvim-lua/lsp-status.nvim")
	use({ "tami5/lspsaga.nvim" })
	use("onsails/lspkind-nvim")
	use({
		"ray-x/lsp_signature.nvim",
	})
	use("kosayoda/nvim-lightbulb")

	--Java
	use("mfussenegger/nvim-jdtls")
	--Flutter
	use({ "akinsho/flutter-tools.nvim", requires = "nvim-lua/plenary.nvim" })
	-- Rust Language
	use("simrat39/rust-tools.nvim")
	---------------------------CMP--------------------------
	use(
		"hrsh7th/nvim-cmp" -- Code completion menu
	)
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
	use({ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" })
	use({ "quangnguyen30192/cmp-nvim-ultisnips", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" })
	use({ "ray-x/cmp-treesitter", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-vsnip", after = "nvim-cmp" })
	use({ "tzachar/cmp-tabnine", run = "./install.sh", after = "nvim-cmp" })
	use({
		"Yoliani/cmp-npm",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		after = "nvim-cmp",
	})
	-----------------------------------------------
	--Github Copílot
	use("github/copilot.vim")

	use("kyazdani42/nvim-tree.lua")
	--For tests
	use({ "mfussenegger/nvim-dap" })
	use({ "nvim-telescope/telescope-dap.nvim" })
	use({ "mfussenegger/nvim-dap-python" })
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use("theHamsta/nvim-dap-virtual-text")
	--File managing and picker
	--use "kyazdani42/nvim-tree.lua"

	--use("yamatsum/nvim-nonicons")

	use("kyazdani42/nvim-web-devicons")
	use({
		"nvim-telescope/telescope.nvim",
	})
	use("nvim-telescope/telescope-media-files.nvim")
	use("nvim-lua/popup.nvim")

	---------------------SNIPPETS----------------------
	use("hrsh7th/vim-vsnip")
	use("hrsh7th/vim-vsnip-integ")
	use("SirVer/ultisnips")
	use("mlaursen/vim-react-snippets")
	use("rafamadriz/friendly-snippets")
	use("L3MON4D3/LuaSnip")
	---------------------MISC---------------------
	use("folke/which-key.nvim")
	use({ "lukas-reineke/indent-blankline.nvim" })
	use("karb94/neoscroll.nvim")

	use("nvim-neorg/neorg")

	--Discord presence
	use("andweeb/presence.nvim")

	--Replace nvim tree
	-- use({ "ms-jpq/chadtree", run = "python3 -m chadtree deps" })
	use({ "ptzz/lf.vim", requires = { "voldikss/vim-floaterm" } })
	--For markdown
	use({ "iamcco/markdown-preview.nvim", run = [[sh -c 'cd app && yarn install']] })
	use("windwp/nvim-autopairs")
	use("norcalli/nvim-colorizer.lua")

	-- rauinbow brackets
	use("luochen1990/rainbow")
	-- Autoclose tags
	use("windwp/nvim-ts-autotag")
	--Reload --Reload and Restart
	use("famiu/nvim-reload")
	use("SmiteshP/nvim-gps")

	-- Usefull comments
	use({
		"numToStr/Comment.nvim",
	})

	use("rcarriga/nvim-notify")
	use("nvim-lua/plenary.nvim")

	-- Close tags
	use("alvan/vim-closetag")
	-- Multicursor
	use("mg979/vim-visual-multi")
	--Dashboard
	use({
		"goolord/alpha-nvim",
		config = function()
			require("plugins.configs.alpha")
		end,
	})

	use({
		"luukvbaal/stabilize.nvim",
		config = function()
			require("stabilize").setup()
		end,
	})
	-- Workspace and sessions
	use("natecraddock/workspaces.nvim")
	use("natecraddock/sessions.nvim")
	use({
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({})
		end,
	})
	--UI
	use("MunifTanjim/nui.nvim")
	use("ggandor/lightspeed.nvim")
	--Comments
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	--tmux
	use("christoomey/vim-tmux-navigator")
	use("preservim/vimux")
	--GIT
	use("sindrets/diffview.nvim")
	use("lewis6991/gitsigns.nvim")
	use({
		"tanvirtin/vgit.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use({
		"pwntester/octo.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("octo").setup()
		end,
	})

	--THEMEs
	use("folke/tokyonight.nvim")
	use("navarasu/onedark.nvim")

	use("eddyekofo94/gruvbox-flat.nvim")
	use("shaunsingh/nord.nvim")
	use("Mofiqul/vscode.nvim")
	use("LunarVim/onedarker.nvim")
	use("luisiacc/gruvbox-baby")
	use("olimorris/onedarkpro.nvim")
	use("catppuccin/nvim")
	--Theme creation
	use("tjdevries/colorbuddy.nvim")

	--use("rktjmp/lush.nvim")
	--Statusline and bufferline
	--use "nvim-lualine/lualine.nvim"
	--use "glepnir/galaxyline.nvim"
	--[[ use "akinsho/nvim-bufferline.lua" ]]
	use("feline-nvim/feline.nvim")
	use({
		"noib3/nvim-cokeline",
		config = function()
			require("cokeline").setup()
		end,
	})

	--Formatters
	use("mhartington/formatter.nvim")
	use("sbdchd/neoformat")

	--Local plugins
	use("~/.dotfile/nvim/lua/core/themes/mytheme")
	use("~/plugins/stackmap.nvim")
end, {
	display = {
		border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
	},
})
