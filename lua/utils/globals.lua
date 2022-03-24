local icons = require("yoliani.icons")

YantNeovim = {
	colorscheme = "onedarkpro",
	ui = {
		float = {
			border = "rounded",
			highlight = "NightflyRed", -- check available by :Telescope highlights
		},
	},
	plugins = {

		package_info = {
			enabled = false,
		},
		rooter = {
			-- Removing package.json from list in Monorepo Frontend Project can be helpful
			-- By that your live_grep will work related to whole project, not specific package
			patterns = { ".git", "package.json", "_darcs", ".bzr", ".svn", "Makefile" }, -- Default
		},
	},
	icons = icons,

	-- LSP settings (for overriding per client)
	-- Load servers (They will be automatically installed after next "Sync plugins" launch)
	-- Check installed servers by :LspInstallInfo
	lsp = {
		servers = {
			-- 'bash',
			-- 'css',
			-- 'eslint',
			-- 'graphql',
			-- 'html',
			-- 'json',
			-- 'lua',
			-- 'tailwind',
			-- 'tsserver',
			-- 'vue2'
		},
	},
}


P = function(v)
	print(vim.inspect(v))
	return v
end

RELOAD = function(...)
	return require("plenary.reload").reload_module(...)
end

R = function(name)
	RELOAD(name)
	return require(name)
end
