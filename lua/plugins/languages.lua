--For Flutter
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

--Rust
local opts = {
  tools = {
    -- rust-tools options
    -- automatically set inlay hints (type hints)
    -- There is an issue due to which the hints are not applied on the first
    -- opened file. For now, write to the file to trigger a reapplication of
    -- the hints or just run :RustSetInlayHints.
    -- default: true
    autoSetHints = true,
    -- whether to show hover actions inside the hover window
    -- this overrides the default hover handler so something like lspsaga.nvim's hover would be overriden by this
    -- default: true
    hover_with_actions = true,
    -- These apply to the default RustRunnables command
    runnables = {
      -- whether to use telescope for selection menu or not
      -- default: true
      use_telescope = true

      -- rest of the opts are forwarded to telescope
    },
    -- These apply to the default RustSetInlayHints command
    inlay_hints = {
      -- wheter to show parameter hints with the inlay hints or not
      -- default: true
      show_parameter_hints = true,
      -- prefix for parameter hints
      -- default: "<-"
      parameter_hints_prefix = "<- ",
      -- prefix for all the other hints (type, chaining)
      -- default: "=>"
      other_hints_prefix = "=> ",
      -- whether to align to the lenght of the longest line in the file
      max_len_align = false,
      -- padding from the left if max_len_align is true
      max_len_align_padding = 1,
      -- whether to align to the extreme right or not
      right_align = false,
      -- padding from the right if right_align is true
      right_align_padding = 7
    },
    hover_actions = {
      -- the border that is used for the hover window
      -- see vim.api.nvim_open_win()
      border = {
        {"╭", "FloatBorder"},
        {"─", "FloatBorder"},
        {"╮", "FloatBorder"},
        {"│", "FloatBorder"},
        {"╯", "FloatBorder"},
        {"─", "FloatBorder"},
        {"╰", "FloatBorder"},
        {"│", "FloatBorder"}
      },
      -- whether the hover action window gets automatically focused
      -- default: false
      auto_focus = false
    }
  },
  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = {} -- rust-analyer options
}

require("rust-tools").setup(opts)
