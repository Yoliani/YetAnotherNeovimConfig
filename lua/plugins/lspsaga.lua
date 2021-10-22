local saga = require "lspsaga"

saga.init_lsp_saga {
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
  border_style = "round"
}

local opts = {silent = true}
local maps = vim.api.nvim_set_keymap

maps("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
maps("n", "<leader>K", "<Cmd>Lspsaga hover_doc<CR>", opts)
maps("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
maps("n", "<leader>gh", "<Cmd>Lspsaga lsp_finder<CR>", opts)
vim.cmd [[inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>]]

require("lsp-colors").setup(
  {
    Error = "#db4b4b",
    Warning = "#e0af68",
    Information = "#0db9d7",
    Hint = "#10B981"
  }
)
