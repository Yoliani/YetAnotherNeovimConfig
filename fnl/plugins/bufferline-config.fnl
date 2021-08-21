(module dotfiles.plugins.bufferline-config
  {autoload {nvim aniseed.nvim}})

(let [bufferline (require :bufferline)]
  (when bufferline
    {
    :buffer_close_icon  ""
    :modified_icon  ""
    :close_icon  "" 
    :left_trunc_marker  ""
    :right_trunc_marker  ""
    :max_name_length  18
    :max_prefix_length  14
    :tab_size  20
    :show_tab_indicators true
    :enforce_regular_tabs  false
    :view  "multiwindow"
    :show_buffer_close_icons  true
    :separator_style  "thick"
    :mappings false
    :right_mouse_command  "vertical sbuffer %d"
    :persist_buffer_sort  true
    }
 
  )
)

(nvim.ex.inoremap "<S-t> [[<Cmd>tabnew<CR>]]")
(nvim.ex.inoremap "<S-x> [[<Cmd>bdelete<CR>]]")
(nvim.ex.inoremap "<TAB> [[<Cmd>BufferLineCycleNext<CR>]]")
