vim.cmd([[
 let g:is_mouse_enabled = 1 
  noremap <silent> <Leader>mo :call ToggleMouse()<CR> 
  function ToggleMouse() 
      if g:is_mouse_enabled == 1 
          echo "Mouse OFF" 
          set mouse= 
          let g:is_mouse_enabled = 0 
      else 
          echo "Mouse ON" 
          set mouse=a 
          let g:is_mouse_enabled = 1 
      endif 
  endfunction
]])
