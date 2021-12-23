local autocommands = {}

local def = {
  _general_settings = {
    {
      "Filetype",
      "python",
      "nnoremap <buffer> <F5> :w<CR>:vert ter python3 '%'<CR>"
    },
    {
      "Filetype",
      "qf,help,man,lspinfo",
      "nnoremap <silent> <buffer> q :close<CR>"
    },
    -- {
    --   "TextYankPost",
    --   "*",
    --   "silent!lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200})"
    -- },
    {
      "BufRead",
      "setlocal formatoptions-=c formatoptions-=r formatoptions-=o"
    },
    {
      "BufNewFile",
      "setlocal formatoptions-=c formatoptions-=r formatoptions-=o"
    }
  },
  _filetypechanges = {
    {"BufWinEnter", ".tf", "setlocal filetype=terraform"},
    {"BufRead", "*.tf", "setlocal filetype=terraform"},
    {"BufNewFile", "*.tf", "setlocal filetype=terraform"},
    {"BufWinEnter", ".zsh", "setlocal filetype=sh"},
    {"BufRead", "*.zsh", "setlocal filetype=sh"},
    {"BufNewFile", "*.zsh", "setlocal filetype=sh"}
  },
  _markdown = {
    {"FileType", "markdown", "setlocal wrap"},
    {"FileType", "markdown", "setlocal spell"}
  },
  _auto_resize = {
    -- will cause split windows to be resized evenly if main window is resized
    {"VimResized", "*", "wincmd ="}
  },
  _packer_compile = {
    -- will cause split windows to be resized evenly if main window is resized
    {"BufWritePost", "plugins.lua", "PackerCompile"}
  },
  _general_lsp = {
    {"FileType", "lspinfo", "nnoremap <silent> <buffer> q :q<CR>"}
  }
}

function autocommands.define_augroups(definitions) -- {{{1
  for group_name, definition in pairs(definitions) do
    vim.cmd("augroup " .. group_name)
    vim.cmd "autocmd!"

    for _, def in pairs(definition) do
      local command = table.concat(vim.tbl_flatten {"autocmd", def}, " ")
      vim.cmd(command)
    end

    vim.cmd "augroup END"
  end
end

autocommands.define_augroups(def)

return autocommands
