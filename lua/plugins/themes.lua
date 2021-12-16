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
    transparent_background = true,
    term_colors = true,
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
--vim.g.gruvbox_flat_style = "hard"
--vim.cmd [[colorscheme gruvbox-flat]]

-- catpuccin
--vim.cmd [[colorscheme catppuccin ]]

-- tokyonight
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions = false
vim.g.tokyonight_sidebars = {"qf", "vista_kind", "terminal", "packer"}
vim.g.tokyonight_colors = {hint = "orange", error = "#ff0000"}
vim.cmd [[colorscheme tokyonight]]

-- NORD
--vim.g.nord_contrast = false
--vim.g.nord_borders = true
--vim.g.nord_disable_background = true
--vim.g.nord_italic = false
--require("nord").set()
--
--require("palenightfall").setup()
