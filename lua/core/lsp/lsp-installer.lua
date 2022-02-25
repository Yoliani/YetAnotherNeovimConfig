local lsp_installer = require("nvim-lsp-installer")

lsp_installer.settings({
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
})

local attachments = require("core.lsp.attachments")
local capabilities = require("core.lsp.capabilities")

lsp_installer.on_server_ready(function(server)
	local opts = { capabilities = capabilities.common(), on_attach = attachments.common() }

	if server.name == "sumneko_lua" then
		opts.settings = require("core.lsp.servers.sumneko_lua")
	elseif server.name == "tsserver" then
		opts.settings = require("core.lsp.servers.tsserver").setup(opts)
	elseif server.name == "gopls" then
		opts = require("core.lsp.servers.gopls").setup(opts)
	elseif server.name == "diagnosticls" then
		opts = require("core.lsp.servers.diagnosticls").setup(opts)
	elseif server.name == "rust_analyzer" then
		opts = require("core.lsp.servers.rust_analyzer").setup(opts)
	elseif server.name == "jsonls" then
		opts = require("core.lsp.servers.jsonls").setup(opts)
	elseif server.name == "efm" then
		opts.root_dir = require("lspconfig").util.root_pattern({ ".git/", "." })
	elseif server.name == "inteliphense" then
		opts.settings = require("core.lsp.servers." .. server.name)
	elseif server.name == "zeta_note" then
		opts.cmd = { "zeta-note" }
	elseif server.name == "bashls" then
		opts.cmd = { "bash-language-server", "start" }
	elseif server.name == "solargraph" then
		opts.cmd = { "solargraph", "stdio" }
		opts.root_dir = require("lspconfig").util.root_pattern("Gemfile", ".git")
		opts.settings = {
			solargraph = {
				diagnostics = true,
			},
		}
		opts.filetypes = { "ruby" }
		opts.init_options = {
			formatting = true,
		}
	end

	server:setup(opts)
end)
