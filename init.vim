"" /$$$$$$ /$$   /$$ /$$$$$$ /$$$$$$$$     /$$    /$$ /$$$$$$ /$$      /$$
""|_  $$_/| $$$ | $$|_  $$_/|__  $$__/    | $$   | $$|_  $$_/| $$$    /$$$
 "" | $$  | $$$$| $$  | $$     | $$       | $$   | $$  | $$  | $$$$  /$$$$
 "" | $$  | $$ $$ $$  | $$     | $$       |  $$ / $$/  | $$  | $$ $$/$$ $$
 "" | $$  | $$  $$$$  | $$     | $$        \  $$ $$/   | $$  | $$  $$$| $$
 "" | $$  | $$\  $$$  | $$     | $$         \  $$$/    | $$  | $$\  $ | $$
"" /$$$$$$| $$ \  $$ /$$$$$$   | $$    /$$   \  $/    /$$$$$$| $$ \/  | $$
 "|______/|__/  \__/|______/   |__/   |__/    \_/    |______/|__/     |__/" 



""            ,-._
""           _.-'  '--.
""         .'      _  -`\_
""        / .----.`_.'----'
""        ;/     `
""       /_;
"          Edgardo Yoliani
""    ._      ._      ._      ._
" _.-._)`\_.-._)`\_.-._)`\_.-._)`\_.-._
"
"    https://github.com/Yoliani
"-------------------------Lua-----------------------"
lua require("init")


"------------------------------- Autocommands --------------------------------"

"augroup recompile_plugins
 "" autocmd!
 "" autocmd BufWritePost plugins.lua call <SID>recompile_plugins()
"augroup END

augroup number_toggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" TODO: Find out why tf I do this
augroup win_resize
  autocmd!
  autocmd VimResized * wincmd =
augroup END

" Go away, netrw!
augroup hide_netrw
  autocmd!
  autocmd FileType netrw setl bufhidden=wipe
augroup END

source $HOME/.config/nvim/plugins/kite.vim

if has('nvim-0.5')
  augroup lsp
    au!
    au FileType java lua require('jdtls').start_or_attach({cmd = {'java-lsp.sh'}})
  augroup end
endif

source $HOME/.config/nvim/plugins/jdtls.vim
source $HOME/.config/nvim/plugins/telescope.vim





