call plug#begin(stdpath('data') . '/plugged')

Plug 'Olical/aniseed', { 'tag': 'v3.21.0' }
Plug 'Olical/fennel.vim'
Plug 'Olical/conjure', {'tag': 'v4.23.0'}
Plug 'tpope/vim-vinegar'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'folke/which-key.nvim'
Plug 'preservim/nerdtree'
Plug 'hoob3rt/lualine.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'tanvirtin/monokai.nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'Mofiqul/vscode.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'ryanoasis/vim-devicons'

call plug#end()



let g:aniseed#env = v:true
let g:deoplete#enable_at_startup = 1

