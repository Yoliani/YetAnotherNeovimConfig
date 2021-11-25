local tab_modules = {
  "plugins.signature-lsp",
  "plugins.lsp-status",
  "plugins.luasnip",
  "plugins.cmp-nvim",
  "plugins.lsp",
  -- "plugins.startup",
  "plugins.treesitter-nvim",
  "plugins.nvimtree",
  "plugins.lspsaga",
  "plugins.formatter",
  "plugins.gitsigns",
  "plugins.colorizer",
  -- "plugins.evilline",
  --"plugins.bubbles",
  "plugins.statusline",
  "plugins.bufferline",
  "plugins.telescope",
  "plugins.whichkey",
  "plugins.autopairs",
  "plugins.go-preview",
  "plugins.todo-comments",
  "plugins.dap",
  "plugins.dashboard",
  --ftplugin
  "ftplugin.java",
  "plugins.notify"
}

for i = 1, #tab_modules, 1 do
  pcall(require, tab_modules[i])
end
