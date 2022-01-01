--------------------------LUA ----------------------------
local lua_settings = {
  Lua = {
    runtime = {
      -- LuaJIT in the case of Neovim
      version = "LuaJIT"
      --path = vim.split(package.path, ";")
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = {"vim"}
    },
    workspace = {},
    telemetry = {enable = false}
  }
}

return lua_settings

-- Make the server aware of Neovim runtime files
-- library = {
--   [vim.fn.expand("$VIMRUNTIME/lua")] = true,
--   [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
-- }
