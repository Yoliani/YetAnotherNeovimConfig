local ok, feline = ey.safe_require 'feline'
if not ok then
  return
end

local lsp = require 'feline.providers.lsp'
local vi_mode_utils = require 'feline.providers.vi_mode'
local gps = require 'nvim-gps'

local git = require 'feline.providers.git'
local bg_to_mode_color = false -- Set the whole statusbar to be the color of the vim

local force_inactive = {
  filetypes = {},
  buftypes = {},
  bufnames = {},
}

local components = {
  active = { {}, {}, {} },
  inactive = { {}, {}, {} },
}

---------------------------------PROPERTIES---------------------------------

local colors = {
  bg = '#0F8DC3',
  black = '#282828',
  yellow = '#d8a657',
  cyan = '#89b482',
  oceanblue = '#45707a',
  gray = '#45707a',
  green = '#a9b665',
  orange = '#e78a4e',
  violet = '#d3869b',
  magenta = '#c14a4a',
  fg = '#a89984',
  skyblue = '#7daea3',
  red = '#ea6962',
  white = '#fafafa',
}

force_inactive.filetypes = {
  'NvimTree',
  'dbui',
  'packer',
  'startify',
  'fugitive',
  'fugitiveblame',
  'CHADTree',
}

force_inactive.buftypes = {
  'terminal',
}

local vi_mode_colors = {
  NORMAL = 'green',
  OP = 'green',
  INSERT = 'red',
  VISUAL = 'skyblue',
  LINES = 'skyblue',
  BLOCK = 'skyblue',
  REPLACE = 'violet',
  ['V-REPLACE'] = 'violet',
  ENTER = 'cyan',
  MORE = 'cyan',
  SELECT = 'orange',
  COMMAND = 'green',
  SHELL = 'green',
  TERM = 'green',
  NONE = 'yellow',
}
local function block(bg, fg)
  if not bg then
    bg = colors.bg
  end
  if not fg then
    fg = colors.white
  end
  return {
    body = {
      fg = fg,
      bg = bg,
    },
    sep_left = {
      fg = colors.bg,
      bg = bg,
    },
    sep_right = {
      fg = colors.bg,
      bg = colors.bg,
    },
  }
end
local function default_hl()
  return {
    fg = bg_to_mode_color and colors.bg or colors.gray,
    bg = bg_to_mode_color and vi_mode_utils.get_mode_color() or 'NONE',
  }
end

local function line_percentage()
  local curr_line = vim.api.nvim_win_get_cursor(0)[1]
  local lines = vim.api.nvim_buf_line_count(0)
  local percent = string.format('%s', 100)

  if curr_line ~= lines then
    percent = string.format('%s', math.ceil(curr_line / lines * 99))
  end

  return lines, percent
end
local function line_col()
  local row = vim.api.nvim_win_get_cursor(0)[1]
  local col = vim.api.nvim_win_get_cursor(0)[2]

  return row .. ':' .. col
end

components.active[1][1] = {
  provider = function()
    return require('feline.providers.vi_mode').get_vim_mode() .. ' '
  end,
  hl = function()
    local val = {}
    val.fg = 'white'
    val.bg = 'bg'
    val.style = 'bold'
    return val
  end,
  left_sep = {
    str = 'vertical_bar_thin',
    hl = function()
      return {
        fg = vi_mode_utils.get_mode_color(),
        bg = 'bg',
      }
    end,
  },
  right_sep = {
    str = 'vertical_bar_thin',
    hl = function()
      return {
        fg = colors.bg,
        bg = colors.bg,
      }
    end,
  },
}

components.active[1][2] = {
  provider = function()
    return '  ' .. require('feline.providers.git').git_branch() .. ' '
  end,
  truncate_hide = true,
  enabled = function()
    return git.git_info_exists()
  end,
  hl = function()
    return block().body
  end,
  left_sep = {
    str = 'vertical_bar_thin',
    hl = function()
      return block().sep_left
    end,
  },
  right_sep = {
    str = 'vertical_bar_thin',
    hl = function()
      return block().sep_right
    end,
  },
}

components.active[1][3] = {
  provider = function()
    return ' '
      .. require('feline.providers.file').file_info({
      }, {
        type = 'short',
      })
      .. ' '
  end,
  hl = function()
    return block().body
  end,
  left_sep = {
    str = 'vertical_bar_thin',
    hl = function()
      return block().sep_left
    end,
  },
  right_sep = {
    str = 'vertical_bar_thin',
    hl = function()
      return block().sep_right
    end,
  },
}

components.active[1][4] = {
  provider = 'diagnostic_errors',
  icon = ' ',
  hl = function()
    return block().body
  end,
  left_sep = {
    str = 'vertical_bar_thin',
    hl = function()
      return block().sep_left
    end,
  },
  right_sep = {
    str = 'vertical_bar_thin',
    hl = function()
      return block().sep_right
    end,
  },
}

components.active[1][5] = {
  provider = 'diagnostic_warnings',
  icon = ' ',
  hl = function()
    return block().body
  end,
  left_sep = {
    str = 'vertical_bar_thin',
    hl = function()
      return block().sep_left
    end,
  },
  right_sep = {
    str = 'vertical_bar_thin',
    hl = function()
      return block().sep_right
    end,
  },
}

components.active[1][6] = {
  provider = 'diagnostic_hints',
  icon = ' ',
  hl = function()
    return block().body
  end,
  left_sep = {
    str = ' ',
    hl = function()
      return block().sep_left
    end,
  },
  right_sep = {
    str = ' ',
    hl = function()
      return block().sep_right
    end,
  },
}

components.active[1][7] = {
  provider = 'diagnostic_info',
  icon = ' ',
  hl = function()
    return block().body
  end,
  left_sep = {
    str = ' ',
    hl = function()
      return block().sep_left
    end,
  },
  right_sep = {
    str = ' ',
    hl = function()
      return block().sep_right
    end,
  },
}

-- diffAdd
components.active[3][1] = {
  provider = 'git_diff_added',
  hl = {
    fg = 'green',
    bg = 'bg',
    style = 'bold',
  },
}
-- diffModfified
components.active[3][2] = {
  provider = 'git_diff_changed',
  hl = {
    fg = 'orange',
    bg = 'bg',
    style = 'bold',
  },
}
-- diffRemove
components.active[3][3] = {
  provider = 'git_diff_removed',
  hl = {
    fg = 'red',
    bg = 'bg',
    style = 'bold',
  },
}

components.active[3][4] = {
  provider = function()
    local filename = vim.api.nvim_buf_get_name(0)
    local extension = vim.fn.fnamemodify(filename, ':e')
    local filetype = vim.bo.filetype

    local icon = ey.get_icon(filename, extension, {})
    return ' ' .. icon.str .. ' ' .. filetype .. ' '
  end,
  hl = function()
    return block().body
  end,
  left_sep = {
    str = 'vertical_bar_thin',
    hl = function()
      return block().sep_right
    end,
  },
  right_sep = {
    str = 'vertical_bar_thin',
    hl = function()
      return block().sep_left
    end,
  },
}
local function using_session()
  return (vim.g.persisting ~= nil)
end
components.active[3][5] = {
  provider = function()
    if vim.g.persisting then
      return '   '
    elseif vim.g.persisting == false then
      return '   '
    end
  end,
  enabled = function()
    return using_session()
  end,
  hl = function()
    return block().body
  end,
  left_sep = {
    str = 'vertical_bar_thin',
    hl = function()
      return block().sep_right
    end,
  },
  right_sep = {
    str = 'vertical_bar_thin',
    hl = function()
      return block().sep_left
    end,
  },
}

local function inverse_block()
  return {
    body = {
      fg = colors.bg,
      bg = vim.o.background == 'light' and colors.black or colors.gray,
    },
    sep_left = {
      fg = colors.bg,
      bg = vim.o.background == 'light' and colors.black or colors.gray,
    },
    sep_right = {
      fg = vim.o.background == 'light' and colors.black or colors.gray,
      bg = colors.bg,
    },
  }
end
-- components.active[3][6] = {
--   provider = function()
--     return ' ' .. line_col() .. ' '
--   end,
--   hl = function()
--     return block().body
--   end,
--   left_sep = {
--     str = 'vertical_bar_thin',
--     hl = function()
--       return block().sep_right
--     end,
--   },
--   right_sep = {
--     str = 'vertical_bar_thin',
--     hl = function()
--       return block().sep_left
--     end,
--   },
-- }
--
components.active[3][6] = {
  provider = function()
    local lines, percent = line_percentage()

    return ' ' .. percent .. '%%' 
  end,
  hl = function()
    return block().body
  end,
  left_sep = {
    str = 'vertical_bar_thin',
    hl = function()
      return block().sep_right
    end,
  },
  right_sep = {
    str = ' ',
    hl = function()
      return block().body
    end,
  },
}

-- LspName
components.active[2][1] = {
  provider = function()
    return '[LSP: ' .. ey.get_lsp_names() .. ']'
  end,
  hl = {
    fg = 'white',
    bg = 'bg',
    style = 'bold',
  },
  right_sep = ' ',
}

require('feline').setup {
  theme = colors,
  default_bg = colors.bg,
  default_fg = colors.white,
  vi_mode_colors = vi_mode_colors,
  components = components,
  force_inactive = force_inactive,
}
