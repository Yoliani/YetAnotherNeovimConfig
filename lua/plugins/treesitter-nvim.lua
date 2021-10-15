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

local parsers = require "nvim-treesitter.parsers"
local query = require "vim.treesitter.query"

local function print(str)
  vim.api.nvim_out_write(vim.inspect(str) .. "\n")
end

local lang = "html"

local parser = parsers.get_parser(0, lang)
local tree = parser:parse()[1]
local node = tree:root()
local q = query.get_query(lang, "highlights")
for id, n, metadata in q:iter_captures(node, 0, 0, 3) do
  print("Capture: " .. id .. " / " .. q.captures[id])
  print("Node: " .. n:type())
end
