local M = {}
local lspconfig = require "lspconfig"

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
  --root_dir = lspconfig.util.root_pattern(".yarn", "package.json", ".git"),
  opts.on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    on_attach(client, bufnr)

    ts_utils.setup(ts_utils_settings)
    ts_utils.setup_client(client)

    vim.api.nvim_buf_set_keymap(bufnr, "n", "tgs", ":TSLspOrganize<CR>", {silent = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "tgI", ":TSLspRenameFile<CR>", {silent = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "tgo", ":TSLspImportAll<CR>", {silent = true})
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

  return opts
end

return M
