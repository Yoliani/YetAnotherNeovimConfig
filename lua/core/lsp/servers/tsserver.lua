local M = {}
local lspconfig = require("lspconfig")

local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = YantNeovim.ui.float.border }),
	["textDocument/signatureHelp"] = vim.lsp.with(
		vim.lsp.handlers.signature_help,
		{ border = YantNeovim.ui.float.border }
	),
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
	capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
end
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
	},
}
local ts_utils_settings = {
	debug = false,
	disable_commands = false,
	enable_import_on_completion = true,
	import_all_timeout = 5000, -- ms
	-- eslint
	eslint_enable_code_actions = true,
	eslint_enable_disable_comments = true,
	eslint_bin = "eslint_d",
	eslint_config_fallback = nil,
	eslint_enable_diagnostics = true,
	eslint_opts = {
		-- diagnostics_format = "#{m} [#{c}]",
		condition = function(utils)
			return utils.root_has_file(".eslintrc.js")
		end,
	},
	-- formatting
	enable_formatting = false,
	formatter = "prettier",
	formatter_config_fallback = nil,
	-- parentheses completion
	complete_parens = false,
	signature_help_in_parens = false,
	-- update imports on file move
	update_imports_on_move = true,
	require_confirmation_on_move = true,
	watch_dir = nil,
	-- filter diagnostics
	filter_out_diagnostics_by_severity = { "hint" },
	filter_out_diagnostics_by_code = {},
}
local attachments = require("core.lsp.attachments")
M.setup = function(opts)
	local ts_utils = require("nvim-lsp-ts-utils")
	opts.handlers = handlers
	opts.capabilities = capabilities
	opts.init_options = ts_utils.init_options
	--root_dir = lspconfig.util.root_pattern(".yarn", "package.json", ".git"),
	opts.on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false

		attachments.on_attach(client, bufnr)

		ts_utils.setup(ts_utils_settings)
		ts_utils.setup_client(client)

		vim.api.nvim_buf_set_keymap(bufnr, "n", "tgs", ":TSLspOrganize<CR>", { silent = true })
		vim.api.nvim_buf_set_keymap(bufnr, "n", "tgI", ":TSLspRenameFile<CR>", { silent = true })
		vim.api.nvim_buf_set_keymap(bufnr, "n", "tgo", ":TSLspImportAll<CR>", { silent = true })
	end
	opts.filetypes = {
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"typescript.jsx",
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"javascript.tsx",
	}
	opts.root_dir = function()
		return vim.loop.cwd()
	end

	return opts
end

return M
