local M = {}
local lspconfig = require("lspconfig")
M.setup = function(opts)
	opts.settings = {
		["rust-analyzer"] = {
			assist = {
				importMergeBehavior = "last",
				importPrefix = "by_self",
			},
			diagnostics = {
				disabled = { "unresolved-import" },
			},
			cargo = {
				loadOutDirsFromCheck = true,
			},
			procMacro = {
				enable = true,
			},
			checkOnSave = {
				command = "clippy",
			},
			root_dir = lspconfig.util.root_pattern("Cargo.toml", "rust-project.json") or lspconfig.util.find_git_root,
		},
	}
	return opts
end

return M
