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
    -- colorscheme = "neon_latte",
    transparency = false,
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
      gitgutter = true,
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
      hop = false
    }
  }
)

--Gruvbox
--vim.g.gruvbox_flat_style = "hard"
--vim.cmd [[colorscheme gruvbox-flat]]
--vim.cmd [[colorscheme catppuccin ]]
-- Example config in Lua
vim.g.tokyonight_style = "storm"
--"storm"
--vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = {"qf", "vista_kind", "terminal", "packer"}

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = {hint = "orange", error = "#ff0000"}
vim.cmd [[colorscheme tokyonight]]
