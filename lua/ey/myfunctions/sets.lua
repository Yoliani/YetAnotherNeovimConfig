--for tmux
vim.cmd([[let g:tmux_navigator_save_on_switch = 2
]])
vim.cmd([[
set clipboard+=unnamedplus
set clipboard+=unnamed
filetype on
filetype plugin on
filetype plugin indent on
set completeopt=menu,menuone,noselect
set modifiable
]])
vim.cmd([[packadd packer.nvim]])
