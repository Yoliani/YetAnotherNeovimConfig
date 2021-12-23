require "bufferline".setup {
  options = {
    offsets = {{filetype = "NvimTree", text = "", padding = 1}},
    buffer_close_icon = "",
    modified_icon = "",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 18,
    max_prefix_length = 14,
    tab_size = 20,
    show_tab_indicators = true,
    enforce_regular_tabs = true,
    view = "multiwindow",
    show_buffer_close_icons = false,
    separator_style = "thick",
    right_mouse_command = "vertical sbuffer %d",
    --numbers = "buffer_id",
    persist_buffer_sort = true,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false
  }
}
