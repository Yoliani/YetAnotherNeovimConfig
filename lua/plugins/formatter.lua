-- Prettier function for formatter
local prettier = function()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
    stdin = true
  }
end

require("formatter").setup(
  {
    logging = false,
    filetype = {
      php = {
        function()
          return {
            exe = "php-cs-fixer",
            args = {"fix", "-q"},
            stdin = false
          }
        end
      },
      javascriptreact = {prettier},
      javascript = {prettier},
      typescript = {prettier},
      html = {prettier},
      --[[      html = {
        function()
          return {
            exe = "prettierd",
            args = {vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      },
--]]
      css = {prettier},
      scss = {prettier},
      markdown = {prettier},
      lua = {
        -- Stylua
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      },
      rust = {
        rustfmt = function()
          return {
            exe = "rustfmt",
            args = {"--emit=stdout"},
            stdin = true
          }
        end
      }
      --[[
          php = {
      function()
        {
          exe = './vendor/bin/phpcbf',
          args = { '--standard=PSR12', bufname },
          stdin = false,
        }
      end
    }
--]]
    }
  }
)

-- Runs Formatter on save
vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.jsx,*.ts,*.css,*.scss,*.md,*.html,*.lua,*.php,*.rs : FormatWrite
augroup END
]],
  true
)
