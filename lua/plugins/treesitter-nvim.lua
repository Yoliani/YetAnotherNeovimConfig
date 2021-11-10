local ts_config = require("nvim-treesitter.configs")

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
    "norg",
    "dart",
    "bash",
    "rust",
    "typescript",
    "tsx",
    "regex",
    "org"
  },
  indent = {
    enable = true
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {"org"},
    disable = {"org", "html", "php"},
    use_languagetree = true
  },
  autotag = {
    enable = true,
    filetypes = {"html", "javascript", "xml", "javascriptreact", "typescriptreact", "vue"}
  }
}

local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

parser_configs.org = {
  install_info = {
    url = "https://github.com/milisims/tree-sitter-org",
    revision = "main",
    files = {"src/parser.c", "src/scanner.cc"}
  },
  filetype = "org"
}

require("orgmode").setup(
  {
    org_agenda_files = {"~/Notas/org/*"},
    org_default_notes_file = "~/Notas/org/refile.org"
  }
)
