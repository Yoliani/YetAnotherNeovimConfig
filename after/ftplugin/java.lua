local capabilities = vim.lsp.protocol.make_client_capabilities()
local workspace_dir = vim.fn.expand(vim.fn.getcwd(), ":p:h:t")

local config = {
	-- The command that starts the language server
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.level=ALL",
		"-noverify",
		"-Xmx1G",
		"-jar",
		"/home/edgardoyoliani/Descargas/jdt-language-server-1.5.0-202110191539/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
		"-configuration",
		"/home/edgardoyoliani/Descargas/jdt-language-server-1.5.0-202110191539/config_linux/",
		"-data",
		vim.fn.expand("~/.cache/jdtls-workspace") .. workspace_dir,
		--add-modules=ALL-SYSTEM \
		--add-opens java.base/java.util=ALL-UNNAMED \
		--add-opens java.base/java.lang=ALL-UNNAMED
	},
	-- This is the default if not provided, you can remove it. Or adjust as needed.
	-- One dedicated LSP server & client will be started per unique root_dir
	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
	capabilities = capabilities,
}

-- Java specific
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>lA", "<Cmd>lua require'jdtls'.code_action()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>di", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>dt", "<Cmd>lua require'jdtls'.test_class()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", opts)
vim.api.nvim_set_keymap("v", "<leader>de", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>de", "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
vim.api.nvim_set_keymap("v", "<leader>dm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
require("jdtls").start_or_attach(config)
