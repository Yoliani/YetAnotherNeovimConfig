-- Configuration
require('Navigator').setup({
    auto_save = 'current',
    disable_on_zoom = true
})

-- Keybindings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', "<A-1>", "<CMD>lua require('Navigator').left()<CR>", opts)
map('n', "<A-3>", "<CMD>lua require('Navigator').up()<CR>", opts)
map('n', "<A-2>", "<CMD>lua require('Navigator').right()<CR>", opts)
map('n', "<A-4>", "<CMD>lua require('Navigator').down()<CR>", opts)
map('n', "<A-5>", "<CMD>lua require('Navigator').previous()<CR>", opts)
