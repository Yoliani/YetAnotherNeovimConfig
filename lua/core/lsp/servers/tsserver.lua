local M = {}
local lspconfig = require "lspconfig"
local get_map_options = function(custom_options)
  local options = {noremap = true, silent = true}
  if custom_options then
    options = vim.tbl_extend("force", options, custom_options)
  end
  return options
end
local buf_map = function(mode, target, source, opts, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr or 0, mode, target, source, get_map_options(opts))
end
local ts_utils_settings = {
  -- debug = true,
  -- import_all_scan_buffers = 100,
  -- update_imports_on_move = true,
  -- -- filter out dumb module warning
  -- filter_out_diagnostics_by_code = {80001}
  debug = false,
  disable_commands = false,
  enable_import_on_completion = true,
  import_all_timeout = 5000, -- ms
  -- eslint
  eslint_enable_code_actions = false,
  eslint_enable_disable_comments = false,
  eslint_bin = "eslint_d",
  eslint_config_fallback = nil,
  eslint_enable_diagnostics = false,
  eslint_opts = {
    -- diagnostics_format = "#{m} [#{c}]",
    condition = function(utils)
      return utils.root_has_file(".eslintrc.js")
    end
  },
  -- formatting
  enable_formatting = false,
  formatter = "prettier_d_slim",
  formatter_config_fallback = nil,
  -- parentheses completion
  complete_parens = false,
  signature_help_in_parens = false,
  -- update imports on file move
  update_imports_on_move = true,
  require_confirmation_on_move = true,
  watch_dir = nil,
  -- filter diagnostics
  filter_out_diagnostics_by_severity = {"hint"},
  filter_out_diagnostics_by_code = {}
}

M.setup = function(opts, on_attach)
  local ts_utils = require("nvim-lsp-ts-utils")
  opts.init_options = ts_utils.init_options
  opts.on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    on_attach(client, bufnr)

    ts_utils.setup(ts_utils_settings)
    ts_utils.setup_client(client)
    --vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>")
    --vim.api.nvim_buf_set_keymap(bufnr, "n", "gI", ":TSLspRenameFile<CR>")
    --vim.api.nvim_buf_set_keymap(bufnr, "n", "go", ":TSLspImportAll<CR>")
    buf_map("n", "tgs", ":TSLspOrganize<CR>", nil, bufnr)
    buf_map("n", "tgI", ":TSLspRenameFile<CR>", nil, bufnr)
    buf_map("n", "tgo", ":TSLspImportAll<CR>", nil, bufnr)
  end
  opts.filetypes = {
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "typescript.jsx",
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "javascript.tsx"
  }
  opts.root_dir = function()
    return vim.loop.cwd()
  end
  require("null-ls").setup()
  lspconfig["null-ls"].setup({on_attach = on_attach})
  return opts
end

return M
