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
        -- "rust",
        -- "go"
    },
    highlight = {
        enable = true,
        use_languagetree = true
    },
    autotag = {
    enable = true,
    filetypes = {"html", "javascript", "xml", 'javascriptreact','typescriptreact', 'vue' }
    }
}
