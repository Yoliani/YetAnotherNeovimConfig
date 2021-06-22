vim.cmd(
  [[
  augroup My_group
  autocmd!
  autocmd Filetype python nnoremap <buffer> <F5> :w<CR>:vert ter python3 "%"<CR>

  augroup END
  
  ]]
)
