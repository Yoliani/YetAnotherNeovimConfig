local M = {}
local bufmap = require('utils.keymaps').bufmap
M.nullls = function(client, bufnr)
  local function map(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'
  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  map('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  map('n', '<space>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
    augroup lsp_document_highlight
    autocmd! * <buffer>
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]],
      false
    )
  end
end

M.common = function(client, bufnr)
  local function map(...)
    --vim.api.nvim_buf_set_keymap(bufnr, ...)
    vim.api.nvim_set_keymap(...)
  end

  -- Enable completion triggered by <c-x><c-o>

  vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

  -- Mappings.
  local opts = { noremap = true, silent = true }
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  bufmap(0, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  bufmap(0, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  bufmap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  bufmap(0, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- bufmap(0, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  bufmap(0, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  bufmap(0, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  bufmap(0, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  bufmap(0, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  bufmap(0, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  bufmap(0, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  bufmap(0, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  bufmap(0, 'n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  bufmap(0, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  bufmap(0, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  bufmap(0, 'n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  bufmap(0, 'n', '<space>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

  --map("n", "<space>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  -- if client.server_capabilities.document_formatting then
  --   map("n", "<space>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  -- elseif client.server_capabilities.document_range_formatting then
  --   map("n", "<space>cf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  -- end
  -- -- Set autocommands conditional on server_capabilities
  -- if client.server_capabilities.document_highlight then
  --   vim.api.nvim_exec(
  --     [[
  --   augroup lsp_document_highlight
  --   autocmd! * <buffer>
  --   autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
  --   autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
  --   augroup END
  --   ]],
  --     false
  --   )
  -- end
end
local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  bufmap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  bufmap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  bufmap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  bufmap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- bufmap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  bufmap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  bufmap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  bufmap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  bufmap(bufnr, 'n', 'gl', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>', opts)
  bufmap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  bufmap(bufnr, 'n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

function M.on_attach(client, bufnr)
  if client.name == 'tsserver' then
    client.server_capabilities.document_formatting = false
  end

  -- Enable completion triggered by <C-X><C-O>
  -- See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Use LSP as the handler for formatexpr.
  -- See `:help formatexpr` for more information.
  vim.api.nvim_buf_set_option(0, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

return M
