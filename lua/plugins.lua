local tab_modules = {
  "plugins.signature-lsp",
  "plugins.lsp-status",
  "plugins.luasnip",
  "plugins.cmp-nvim",
  "plugins.lsp",
  "plugins.treesitter-nvim",
  "plugins.nvimtree",
  "plugins.lspsaga",
  "plugins.formatter",
  "plugins.gitsigns",
  "plugins.evilline",
  "plugins.bufferline",
  "plugins.telescope",
  "plugins.whichkey",
  "plugins.autopairs",
  "plugins.go-preview",
  "plugins.todo-comments",
  "plugins.dap"
  -- "plugins.neoscroll"
}

for i = 1, #tab_modules, 1 do
  pcall(require, tab_modules[i])
end
