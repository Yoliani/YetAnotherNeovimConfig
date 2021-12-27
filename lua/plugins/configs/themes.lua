local nightfox = require("nightfox")

-- This function set the configuration of nightfox. If a value is not passed in the setup function
-- it will be taken from the default configuration above
nightfox.setup(
  {
    fox = "duskfox", -- change the colorscheme to use nordfox
    styles = {
      comments = "italic", -- change style of comments to be italic
      keywords = "bold", -- change style of keywords to be bold
      functions = "italic,bold" -- styles can be a comma separated list
    },
    inverse = {
      match_paren = true -- inverse the highlighting of match_parens
    },
    colors = {
      red = "#FF000", -- Override the red color for MAX POWER
      bg_alt = "#000000"
    },
    hlgroups = {
      TSPunctDelimiter = {fg = "${red}"}, -- Override a highlight group with the color red
      LspCodeLens = {bg = "#000000", style = "italic"}
    }
  }
)

-- Load the configuration set above and apply the colorscheme
--nightfox.load()

local catppuccino = require("catppuccin")

-- configure it
catppuccino.setup(
  {
    transparent_background = false,
    term_colors = false,
    styles = {
      comments = "italic",
      functions = "italic",
      keywords = "italic",
      strings = "bold",
      variables = "NONE"
    },
    integrations = {
      treesitter = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = "italic",
          hints = "italic",
          warnings = "italic",
          information = "italic"
        },
        underlines = {
          errors = "underline",
          hints = "underline",
          warnings = "underline",
          information = "underline"
        }
      },
      lsp_trouble = true,
      lsp_saga = true,
      gitgutter = false,
      gitsigns = true,
      telescope = true,
      nvimtree = {
        enabled = true,
        show_root = true
      },
      which_key = true,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = true
      },
      dashboard = false,
      neogit = false,
      vim_sneak = false,
      fern = false,
      barbar = false,
      bufferline = true,
      markdown = true,
      lightspeed = true,
      ts_rainbow = true,
      hop = false,
      cmp = true
    }
  }
)
vim.g.material_style = "palenight"
require("material").setup(
  {
    contrast = true, -- Enable contrast for sidebars, floating windows and popup menus like Nvim-Tree
    borders = false, -- Enable borders between verticaly split windows
    popup_menu = "palenight", -- Popup menu style ( can be: 'dark', 'light', 'colorful' or 'stealth' )
    italics = {
      comments = false, -- Enable italic comments
      keywords = false, -- Enable italic keywords
      functions = false, -- Enable italic functions
      strings = false, -- Enable italic strings
      variables = false -- Enable italic variables
    },
    contrast_windows = {
      -- Specify which windows get the contrasted (darker) background
      "terminal", -- Darker terminal background
      "packer", -- Darker packer background
      "qf" -- Darker qf list background
    },
    text_contrast = {
      lighter = false, -- Enable higher contrast text for lighter style
      darker = false -- Enable higher contrast text for darker style
    },
    disable = {
      background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
      term_colors = false, -- Prevent the theme from setting terminal colors
      eob_lines = false -- Hide the end-of-buffer lines
    },
    custom_highlights = {} -- Overwrite highlights with your own
  }
)

-- nvim-web-devicons
-- Create highlights for statusline
-- local icons = require("nvim-web-devicons").get_icons()
-- for _, icon_data in pairs(icons) do
--   if icon_data.color and icon_data.name then
--     local hl_group = icon_data.name and "StatuslineDevIcon" .. icon_data.name
--     if hl_group then
--       highlight(hl_group, {fg = icon_data.color, bg = c.statusline})
--     end
--   end
-- end

--Gruvbox
--vim.g.gruvbox_flat_style = "dark"
--vim.cmd [[colorscheme gruvbox-flat]]

-- catpuccin
--vim.cmd [[colorscheme catppuccin ]]

-- tokyonight
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions = false
vim.g.tokyonight_sidebars = {"qf", "vista_kind", "terminal", "packer"}
vim.g.tokyonight_colors = {hint = "orange", error = "#ff0000"}
--vim.cmd [[colorscheme tokyonight]]

-- NORD
--vim.g.nord_contrast = false
--vim.g.nord_borders = true
--vim.g.nord_disable_background = true
--vim.g.nord_italic = false
--require("nord").set()
--
--require("palenightfall").setup()
--
--Vscode

vim.g.vscode_style = "dark"
--vim.cmd [[colorscheme vscode]]

--- Moonlight
--require("moonlight").set()

--Material.nvim
--vim.cmd [[colorscheme material]]

--vim.cmd [[colorscheme onedarker]]

--Kanagawa
require("kanagawa").setup(
  {
    undercurl = true,
    commentStyle = "italic",
    functionStyle = "NONE",
    keywordStyle = "italic",
    statementStyle = "bold",
    typeStyle = "NONE",
    specialReturn = true,
    specialException = true,
    transparent = false,
    colors = {},
    overrides = {}
  }
)

-- setup must be called before loading
--vim.cmd("colorscheme kanagawa")

vim.g.onedark_style = "cool"
--vim.cmd("colorscheme onedark")
--
--Gruvbox baby

vim.cmd [[colorscheme gruvbox-baby]]
local onedarkpro = require("onedarkpro")
onedarkpro.setup(
  {
    theme = "onedark",
    colors = {},
    hlgroups = {}, -- Override default highlight groups
    styles = {
      strings = "NONE", -- Style that is applied to strings
      comments = "NONE", -- Style that is applied to comments
      keywords = "bold", -- Style that is applied to keywords
      functions = "italic", -- Style that is applied to functions
      variables = "NONE" -- Style that is applied to variables
    },
    options = {
      bold = true, -- Use the themes opinionated bold styles?
      italic = true, -- Use the themes opinionated italic styles?
      underline = true, -- Use the themes opinionated underline styles?
      undercurl = true, -- Use the themes opinionated undercurl styles?
      cursorline = false, -- Use cursorline highlighting?
      transparency = false, -- Use a transparent background?
      terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
      window_unfocussed_color = false -- When the window is out of focus, change the normal background?
    }
  }
)

--onedarkpro.load()
