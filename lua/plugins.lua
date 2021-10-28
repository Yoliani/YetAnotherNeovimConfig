local tab_modules = {
  "plugins.signature-lsp",
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
  "plugins.discord",
  "plugins.autopairs",
  "plugins.go-preview",
  "plugins.todo-comments"
  -- "plugins.neoscroll"
}

for i = 1, #tab_modules, 1 do
  pcall(require, tab_modules[i])
end
