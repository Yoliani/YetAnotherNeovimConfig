local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
    ensure_installed = {
        "javascript",
        "html",
        "css",
        "bash",
        "lua",
        "json",
        "python",
        "go",
        "java",
        "dart",
        "bash",
        "rust",
        "typescript",
	"tsx",
	"regex"
    },
    highlight = {
        enable = true,
        use_languagetree = true
    },
    autotag = {
    enable = true,
    filetypes = {"html", "javascript", "xml", 'javascriptreact','typescriptreact', 'vue' }
    },
    rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
    colors = {}, -- table of hex strings
    termcolors = {} -- table of colour name strings
  }
}

local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/vhyrro/tree-sitter-norg",
        files = { "src/parser.c" },
        branch = "main"
    },
}
