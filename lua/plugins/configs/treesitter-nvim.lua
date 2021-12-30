local ts_config = require("nvim-treesitter.configs")

local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

parser_configs.norg = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg",
    files = {"src/parser.c", "src/scanner.cc"},
    branch = "main"
  }
}

parser_configs.norg_meta = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
    files = {"src/parser.c"},
    branch = "main"
  }
}

parser_configs.norg_table = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
    files = {"src/parser.c"},
    branch = "main"
  }
}
ts_config.setup {
  ensure_installed = {
    "javascript",
    "html",
    "php",
    "css",
    "bash",
    "lua",
    "json",
    "python",
    "go",
    "java",
    "c_sharp",
    "dockerfile",
    "vim",
    "dart",
    "bash",
    "rust",
    "typescript",
    "tsx",
    "regex",
    "norg",
    "norg_meta",
    "norg_table",
    "fish"
  },
  indent = {
    enable = true
  },
  highlight = {
    enable = true,
    disable = {"html", "php"},
    ----  additional_vim_regex_highlighting = {"org"},
    use_languagetree = true
  },
  autotag = {
    enable = true,
    filetypes = {"html", "javascript", "xml", "javascriptreact", "typescriptreact", "vue"}
  }, --> textobjects selection <--
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner"
      }
    },
    --> LSP interop <--
    lsp_interop = {
      enable = true,
      border = "none",
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer"
      }
    }
  },
  move = {
    enable = true,
    set_jumps = true, -- whether to set jumps in the jumplist
    goto_next_start = {
      ["]]"] = "@function.outer",
      ["]m"] = "@class.outer"
    },
    goto_next_end = {
      ["]["] = "@function.outer",
      ["]M"] = "@class.outer"
    },
    goto_previous_start = {
      ["[["] = "@function.outer",
      ["[m"] = "@class.outer"
    },
    goto_previous_end = {
      ["[]"] = "@function.outer",
      ["[M"] = "@class.outer"
    }
  },
  --> treesitter playground <--
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = "o",
      toggle_hl_groups = "i",
      toggle_injected_languages = "t",
      toggle_anonymous_nodes = "a",
      toggle_language_display = "I",
      focus_language = "f",
      unfocus_language = "F",
      update = "R",
      goto_node = "<cr>",
      show_help = "?"
    }
  },
  --> refactor module
  refactor = {
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr"
      }
    }
  },
  --> rainbow tags
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil
  }
}
