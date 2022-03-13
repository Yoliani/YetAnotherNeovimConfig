--------------------------LUA ----------------------------
local lua_settings = {
	Lua = {
		runtime = {
			-- LuaJIT in the case of Neovim
			version = "LuaJIT",
			--path = vim.split(package.path, ";")
		},
		diagnostics = {
			-- Get the language server to recognize the `vim` global
			globals = { "vim", "bit" },
		},
		workspace = {
			library = {
				[vim.fn.expand("$VIMRUNTIME/lua")] = true,
				[vim.fn.stdpath("config") .. "/lua"] = true,
			},
		},
		telemetry = { enable = true },
	},
}

return lua_settings
