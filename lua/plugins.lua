local tab_modules = {
  "plugins.signature-lsp",
  "plugins.cmp-nvim",
  "plugins.lsp",
  "plugins.treesitter-nvim",
  "plugins.nvimtree",
  "plugins.formatter",
  "plugins.gitsigns",
  "plugins.statusline",
  "plugins.bufferline",
  "plugins.telescope",
  "plugins.whichkey"
}

for i = 1, #tab_modules, 1 do
  pcall(require, tab_modules[i])
end
