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
local protocol = require("vim.lsp.protocol")

local on_attach = function(client, bufnr)
	local function map(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	map("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	map("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	map("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	map("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	map("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	map("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	map("n", "<space>cf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)


end

-- config that activates keymaps and enables snippet support
local function capabilities_conf()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
	capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.completion.completionItem.preselectSupport = true
	capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
	capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
	capabilities.textDocument.completion.completionItem.deprecatedSupport = true
	capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
	capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
			"kind",
		},
	}

	return capabilities
end

vim.diagnostic.config({
	severity_sort = true,
	signs = true,
	underline = false, -- Do not underline code
	update_in_insert = true,
	virtual_text = false,
	-- virtual_text = {
	-- 	prefix = "",
	-- 	spacing = 0,
	-- },
})

local function lspSymbol(name, icon)
	local hl = "DiagnosticSign" .. name
	vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

lspSymbol("Error", "")
lspSymbol("Info", "")
lspSymbol("Hint", "")
lspSymbol("Warn", "")
local max_width = math.max(math.floor(vim.o.columns * 0.7), 100)
local max_height = math.max(math.floor(vim.o.lines * 0.3), 30)
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = {
		prefix = "",
		spacing = 0,
	},
	signs = true,
	underline = false,
	update_in_insert = false, -- update diagnostics insert mode
})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
	max_width = max_width,
	max_height = max_height,
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
	max_width = max_width,
	max_height = max_height,
})

vim.lsp.handlers["textDocument/codeLens"] = vim.lsp.with(vim.lsp.handlers.code_lens, {
	border = "rounded",
	max_width = max_width,
	max_height = max_height,
})

lsp_installer.on_server_ready(function(server)
	local opts = { capabilities = capabilities_conf(), on_attach = on_attach(server.name) }


	if server.name == "sumneko_lua" then
		opts.settings = require("core.lsp.servers.sumeko_lua")
	elseif server.name == "tsserver" then
		opts.settings = require("core.lsp.servers.tsserver").setup(opts, on_attach)
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
	elseif server.name=="inteliphense" then
		opts.settings = require("core.lsp.servers." .. server.name)
	elseif server.name == "zeta_note" then
		opts.cmd = { "zeta-note" }
	end

	server:setup(opts)
end)

-- replace the default lsp diagnostic letters with prettier symbols
-- vim.fn.sign_define("LspDiagnosticsSignError", {text = "💢", numhl = "LspDiagnosticsDefaultError"})
-- vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
-- vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "❕", numhl = "LspDiagnosticsDefaultInformation"})
-- vim.fn.sign_define("LspDiagnosticsSignHint", {text = "💡", numhl = "LspDiagnosticsDefaultHint"})

protocol.CompletionItemKind = {
	"", -- Text
	"", -- Method
	"", -- Function
	"", -- Constructor
	"", -- Field
	"", -- Variable
	"", -- Class
	"ﰮ", -- Interface
	"", -- Module
	"", -- Property
	"", -- Unit
	"", -- Value
	"", -- Enum
	"", -- Keyword
	"﬌", -- Snippet
	"", -- Color
	"", -- File
	"", -- Reference
	"", -- Folder
	"", -- EnumMember
	"", -- Constant
	"", -- Struct
	"", -- Event
	"ﬦ", -- Operator
	"", -- TypeParameter
}

require("core.lsp.servers.null-ls")
require("core.lsp.lsp-status")
require("core.lsp.lspsaga")
require("core.lsp.signature-lsp")
