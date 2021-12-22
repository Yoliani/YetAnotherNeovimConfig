local tab_modules = {
  "plugins.impatient",
  "plugins.alpha",
  "plugins.vsnip",
  "plugins.icons",
  "plugins.luasnip",
  "plugins.signature-lsp",
  "plugins.lsp-status",
  "lsp.lsp",
  "plugins.cmp-nvim",
  -- "plugins.startup",
  "plugins.treesitter-nvim",
  "plugins.nvimtree",
  "plugins.lspsaga",
  "plugins.formatter",
  "plugins.gitsigns",
  "plugins.colorizer",
  --"plugins.evilline",
  --"plugins.bubbles",

  "plugins.statusline",
  "plugins.bufferline",
  --"plugins.mystatusline",
  "plugins.telescope",
  "plugins.whichkey",
  "plugins.autopairs",
  "plugins.go-preview",
  "plugins.todo-comments",
  "plugins.dap",
  --ftplugin
  --"ftplugin.java",
  "plugins.notify",
  "plugins.comments",
  "plugins.themes"
}

for i = 1, #tab_modules, 1 do
  pcall(require, tab_modules[i])
end
