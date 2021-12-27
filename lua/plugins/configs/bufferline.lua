local M = {}

M.buffer_line = function()
  local present, bufferline = pcall(require, "bufferline")
  if not present then
    return
  end
  bufferline.setup {
    options = {
      offsets = {{filetype = "ChadTree", text = "", padding = 1}},
      buffer_close_icon = "",
      modified_icon = "",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 22,
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
end

M.cokeline = function()
  local present, cokeline = pcall(require, "cokeline")
  if not present then
    print("cokeline not found")
    return
  end

  local colors = require("onedarkpro").get_colors(vim.g.onedarkpro_style)

  cokeline.setup(
    {
      show_if_buffers_are_at_least = 2,
      mappings = {
        cycle_prev_next = true
      },
      default_hl = {
        focused = {
          fg = colors.purple,
          bg = "NONE",
          style = "bold"
        },
        unfocused = {
          fg = colors.gray,
          bg = "NONE"
        }
      },
      components = {
        {
          text = function(buffer)
            return buffer.index ~= 1 and "  "
          end
        },
        {
          text = function(buffer)
            return buffer.index .. ": "
          end,
          hl = {
            style = function(buffer)
              return buffer.is_focused and "bold" or nil
            end
          }
        },
        {
          text = function(buffer)
            return buffer.unique_prefix
          end,
          hl = {
            fg = function(buffer)
              return buffer.is_focused and colors.purple or colors.gray
            end,
            style = "italic"
          }
        },
        {
          text = function(buffer)
            return buffer.filename .. " "
          end,
          hl = {
            style = function(buffer)
              return buffer.is_focused and "bold" or nil
            end
          }
        },
        {
          text = function(buffer)
            return buffer.is_modified and " ●"
          end,
          hl = {
            fg = function(buffer)
              return buffer.is_focused and colors.red
            end
          }
        },
        {
          text = "  "
        }
      }
    }
  )
end

M.cokeline()
