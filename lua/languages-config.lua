
vim.cmd(
  [[
  augroup My_groupJava
  autocmd!
  autocmd Filetype java set makeprg=javac\ %
  set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
  map <F9> :make<Return>:copen<Return>
  map <F10> :cprevious<Return>
  map <F11> :cnext<Return>
  augroup END
  
  ]]
)

g = vim.g
opt = vim.opt
--g.kite_supported_languages = ['python', 'javascript', 'go']



--opt.completeopt+=menuone

