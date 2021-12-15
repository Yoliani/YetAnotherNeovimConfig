local lsp_installer = require("nvim-lsp-installer")

lsp_installer.settings(
  {
    ui = {
      icons = {
        server_installed = "✓",
        server_pending = "➜",
        server_uninstalled = "✗"
      }
    }
  }
)
local protocol = require "vim.lsp.protocol"
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = {noremap = true, silent = true}
  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
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

  protocol.CompletionItemKind = {
    "", -- Text
    "", -- Method
    "", -- Function
    "", -- Constructor
    "", -- Field
    "", -- Variable
    "", -- Class
    "ﰮ", -- Interface
    "", -- Module
    "", -- Property
    "", -- Unit
    "", -- Value
    "", -- Enum
    "", -- Keyword
    "﬌", -- Snippet
    "", -- Color
    "", -- File
    "", -- Reference
    "", -- Folder
    "", -- EnumMember
    "", -- Constant
    "", -- Struct
    "", -- Event
    "ﬦ", -- Operator
    "" -- TypeParameter
  }
end

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
  capabilities.textDocument.completion.completionItem.documentationFormat = {"markdown", "plaintext"}
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.preselectSupport = true
  capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
  capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
  capabilities.textDocument.completion.completionItem.deprecatedSupport = true
  capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
  capabilities.textDocument.completion.completionItem.tagSupport = {valueSet = {1}}
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits"
    }
  }

  return {capabilities = capabilities, on_attach = on_attach}
end

-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
      spacing = 5,
      prefix = ""
    }
  }
)

local config = make_config()
local lua_settings = {
  Lua = {
    runtime = {
      -- LuaJIT in the case of Neovim
      version = "LuaJIT",
      path = vim.split(package.path, ";")
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = {"vim"}
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = {
        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
      }
    }
  }
}
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
-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(
  function(server)
    local opts = {config}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end
    if server.name == "sumneko_lua" then
      opts.settings = lua_settings
    elseif server.name == "tsserver" then
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
      require("null-ls").config({})
      lspconfig["null-ls"].setup({on_attach = on_attach})
    elseif server.name == "gopls" then
      --    elseif server.name == "php" then
      --[[
      opts.cmd = {"intelephense", "--stdio"}
      opts.intelephense = {
        stubs = {
          "bcmath",
          "bz2",
          "calendar",
          "Core",
          "curl",
          "zip",
          "zlib",
          "wordpress",
          "woocommerce",
          "acf-pro",
          "wordpress-globals",
          "wp-cli",
          "genesis",
          "polylang"
        },
        files = {
          maxSize = 5000000
        }
      }
        --]]
      opts.settings = {
        go = {
          -- cmd = {vim.fn.expand("/home/edgardoyoliani/.local/share/nvim/lspinstall/go/gopls")},
          settings = {
            gopls = {
              analyses = {
                unusedparams = true
              },
              staticcheck = true
            }
          }
        }
      }
    elseif server.name == "diagnosticls" then
      opts.filetypes = {
        "javascript",
        "javascriptreact",
        "json",
        "typescript",
        "typescriptreact",
        "css",
        "less",
        "scss",
        "markdown",
        "pandoc"
      }
      opts.init_options = {
        lintrs = {
          eslint = {
            command = "eslint_d",
            rootPatterns = {".git"},
            debounce = 100,
            args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
            sourceName = "eslint_d",
            parseJson = {
              errorsRoot = "[0].messages",
              line = "line",
              column = "column",
              endLine = "endLine",
              endColumn = "endColumn",
              message = "[eslint] ${message} [${ruleId}]",
              security = "severity"
            },
            securities = {
              [2] = "error",
              [1] = "warning"
            }
          }
        },
        filetypes = {
          javascript = "eslint",
          javascriptreact = "eslint",
          typescript = "eslint",
          typescriptreact = "eslint"
        },
        formatters = {
          eslint_d = {
            command = "eslint_d",
            args = {"--stdin", "--stdin-filename", "%filename", "--fix-to-stdout"},
            rootPatterns = {".git"}
          },
          prettier = {
            command = "prettier",
            args = {"--stdin-filepath", "%filename"}
          }
        },
        formatFiletypes = {
          css = "prettier",
          javascript = "eslint_d",
          javascriptreact = "eslint_d",
          json = "prettier",
          scss = "prettier",
          less = "prettier",
          typescript = "eslint_d",
          typescriptreact = "eslint_d",
          markdown = "prettier"
        }
      }
    elseif server.name == "rust_analyzer" then
      opts.settings = {
        ["rust-analyzer"] = {
          assist = {
            importMergeBehavior = "last",
            importPrefix = "by_self"
          },
          diagnostics = {
            disabled = {"unresolved-import"}
          },
          cargo = {
            loadOutDirsFromCheck = true
          },
          procMacro = {
            enable = true
          },
          checkOnSave = {
            command = "clippy"
          },
          root_dir = lspconfig.util.root_pattern("Cargo.toml", "rust-project.json") or lspconfig.util.find_git_root
        }
      }
    elseif server.name == "jsonls" then
      opts.settings = {
        json = {
          schemas = {
            {
              fileMatch = {"package.json"},
              url = "https://json.schemastore.org/package.json"
            },
            {
              fileMatch = {"tsconfig*.json"},
              url = "https://json.schemastore.org/tsconfig.json"
            },
            {
              fileMatch = {".prettierrc", ".prettierrc.json", "prettier.config.json"},
              url = "https://json.schemastore.org/prettierrc.json"
            },
            {
              fileMatch = {".eslintrc", ".eslintrc.json"},
              url = "https://json.schemastore.org/eslintrc.json"
            },
            {
              fileMatch = {".babelrc", ".babelrc.json", "babel.config.json"},
              url = "https://json.schemastore.org/babelrc.json"
            },
            {
              fileMatch = {"lerna.json"},
              url = "https://json.schemastore.org/lerna.json"
            },
            {
              fileMatch = {"now.json", "vercel.json"},
              url = "https://json.schemastore.org/now.json"
            },
            {
              fileMatch = {"ecosystem.json"},
              url = "https://json.schemastore.org/pm2-ecosystem.json"
            }
          }
        }
      }
    end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
  end
)

-- replace the default lsp diagnostic letters with prettier symbols
vim.fn.sign_define("LspDiagnosticsSignError", {text = "💢", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "❕", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "💡", numhl = "LspDiagnosticsDefaultHint"})

protocol.CompletionItemKind = {
  "", -- Text
  "", -- Method
  "", -- Function
  "", -- Constructor
  "", -- Field
  "", -- Variable
  "", -- Class
  "ﰮ", -- Interface
  "", -- Module
  "", -- Property
  "", -- Unit
  "", -- Value
  "", -- Enum
  "", -- Keyword
  "﬌", -- Snippet
  "", -- Color
  "", -- File
  "", -- Reference
  "", -- Folder
  "", -- EnumMember
  "", -- Constant
  "", -- Struct
  "", -- Event
  "ﬦ", -- Operator
  "" -- TypeParameter
}
