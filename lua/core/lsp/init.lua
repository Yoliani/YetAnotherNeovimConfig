local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("core.lsp.lsp-installer")
require("core.lsp.diagnostics")
require("core.lsp.protocol")
require("core.lsp.null-ls")
require("core.lsp.servers.tsserver")
require("core.lsp.lsp-status")
require("core.lsp.lspsaga")
require("core.lsp.signature-lsp")
-- require("core.lsp.servers.solargraph")
