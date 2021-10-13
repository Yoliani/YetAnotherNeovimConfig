require("flutter-tools").setup {
  ui = {
    -- the border type to use for all floating windows, the same options/formats
    -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
    border = "rounded"
  },
  debugger = {
    -- integrate with nvim dap + install dart code debugger
    enabled = false
  },
  widget_guides = {
    enabled = true
  },
  closing_tags = {
    prefix = "//", -- character to use for close tag e.g. > Widget
    enabled = true -- set to false to disable
  },
  dev_log = {
    open_cmd = "tabedit" -- command to use to open the log buffer
  },
  dev_tools = {
    autostart = false, -- autostart devtools server if not detected
    auto_open_browser = false -- Automatically opens devtools in the browser
  },
  outline = {
    open_cmd = "35vnew" -- command to use to open the outline buffer
  }
}

-- Telescope Integration
--      In order to set this up, you can explicitly load the extension.
require("telescope").load_extension("flutter")


vim.cmd([[ autocmd VimEnter *.dart  nnoremap <Leader>o :Telescope flutter commands <CR> ]])

