local tab_modules = {
  "plugins.configs.impatient",
  "plugins.configs.alpha",
  "plugins.configs.vsnip",
  "plugins.configs.icons",
  "plugins.configs.luasnip",
  "plugins.configs.signature-lsp",
  "plugins.configs.lsp-status",
  "lsp.lsp",
  "plugins.configs.cmp-nvim",
  -- "plugins.startup",
  "plugins.configs.treesitter-nvim",
  -- "plugins.nvimtree",
  "plugins.configs.chadtree",
  "plugins.configs.lspsaga",
  "plugins.configs.formatter",
  "plugins.configs.gitsigns",
  "plugins.configs.colorizer",
  --"plugins.evilline",
  --"plugins.bubbles",

  "plugins.configs.statusline",
  "plugins.configs.bufferline",
  --"plugins.mystatusline",
  "plugins.configs.telescope",
  "plugins.configs.whichkey",
  "plugins.configs.autopairs",
  "plugins.configs.go-preview",
  "plugins.configs.todo-comments",
  "plugins.configs.dap",
  --ftplugin
  --"ftplugin.java",
  "plugins.configs.notify",
  "plugins.configs.comments",
  "plugins.configs.themes"
}

for i = 1, #tab_modules, 1 do
  pcall(require, tab_modules[i])
end
