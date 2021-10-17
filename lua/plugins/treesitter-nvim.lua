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
    "regex"
  },
  indent = {
    enable = true
  },
  highlight = {
    enable = true,
    disabled = {"html"},
    use_languagetree = true
  },
  autotag = {
    enable = true,
    filetypes = {"html", "javascript", "xml", "javascriptreact", "typescriptreact", "vue"}
  }
}

local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

parser_configs.norg = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg",
    files = {"src/parser.c", "src/scanner.cc"},
    branch = "main"
  }
}
