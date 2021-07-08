"Kite & LSP"
 au User lsp_setup call lsp#register_server({
     \ 'name': 'kite',
     \ 'cmd': '~/.local/share/kite/current/kite-lsp --editor=nvim',
     \ 'whitelist': ["php", "javascript", "python", "bash", "html", "go"],
     \ })

" Turn off Kite
let g:kite_supported_languages = ['*']
let g:kite_completions=1
