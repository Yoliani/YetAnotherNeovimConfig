------------------------------------------------------------------------------------------
------------------------------- null ls --------------------------------------------------

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end
local fmt = null_ls.builtins.formatting
local dg = null_ls.builtins.diagnostics
local ca = null_ls.builtins.code_actions
null_ls.setup({
	debug = false,
	autostart = false,
	sources = {
		fmt.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		fmt.black.with({ extra_args = { "--fast" } }),
		fmt.trim_whitespace.with({
			filetypes = { "text", "sh", "zsh", "yaml", "toml", "make", "conf", "tmux" },
		}),
		fmt.stylua,
	},
})
