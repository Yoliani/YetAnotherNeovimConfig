--Load plugins config
require("nvim-autopairs").setup()
require("lspkind").init()
require("nvim_comment").setup()
require("colorizer").setup()
require("neoscroll").setup()
--require("plugins.nv-jdtls").setup()

local tab_modules = {
  "plugins.top-bufferline",
  "plugins.galaxyline-config",
  --"plugins.lualine",
  "plugins.nvim-lspconfig",
  "plugins.cmp",
  -- "plugins.compe-completion",
  --"plugins.highlights",
  "plugins.treesitter-nvim",
  "plugins.telescope-nvim",
  "plugins.file-icons",
  "plugins.nvimTree",
  "plugins.gitsigns-nvim",
  "plugins.zenmode",
  "plugins.whichkey",
  "plugins.dashboard",
  "plugins.jdtls",
  -- "plugins.float-term",
  "plugins.navigator-config",
  "plugins.discord",
  "plugins.neoformat-config",
  "plugins.todo-list",
  "plugins.flutter-config-tools",
  "plugins.rust-config-tools",
  "nv-reload.init",
  "plugins.neorg-config",
  "plugins.formatter-config"
  --"plugins.signature"
  --Test
  --re('impatient'):e
  --"tests.nui_lsp"
}

for i = 1, #tab_modules, 1 do
  pcall(require, tab_modules[i])
end
