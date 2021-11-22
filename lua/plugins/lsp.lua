local lspinstall = require("lspinstall")
local lspconfig = require "lspconfig"
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

-- Configure lua language server for neovim development
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
--Specific
--#region
--
--
lspconfig.flow.setup {
  on_attach = on_attach
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  filetypes = {"typescript", "typescriptreact", "typescript.tsx"}
}

lspconfig.diagnosticls.setup {
  on_attach = on_attach,
  filetypes = {
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
  },
  init_options = {
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
}

-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
      spacing = 4,
      prefix = ""
    }
  }
)

--Languages
local go_settings = {
  go = {
    cmd = {vim.fn.expand("/home/edgardoyoliani/.local/share/nvim/lspinstall/go/gopls")},
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

local rust_settings = {
  rust = {
    cmd = {vim.fn.expand("/home/edgardoyoliani/.local/share/nvim/lspinstall/rust/rust-analyzer")}
  }
}

local intelephense_settings = {
  cmd = {"intelephense", "--stdio"},
  filetypes = {"php"},
  intelephense = {
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
}
-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
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
  capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
  return {capabilities = capabilities, on_attach = on_attach}
end

local function setup_servers()
  require "lspinstall".setup()
  local installed_servers = require "lspinstall".installed_servers()
  local required_servers = {"lua", "go", "typescript", "python", "bash", "vim"}
  for _, svr in pairs(required_servers) do
    if not vim.tbl_contains(installed_servers, svr) then
      lspinstall.install_server(svr)
    end
  end
  lspinstall.setup()

  for _, server in pairs(installed_servers) do
    local config = make_config()
    if server == "lua" then
      config.settings = lua_settings
      require "lspconfig"[server].setup(config)
    elseif server == "rust" then
      config.settings = rust_settings
      require "lspconfig"[server].setup(config)
    elseif server == "php" then
      config.settings = intelephense_settings
      require "lspconfig"[server].setup(config)
    elseif server == "rust-analyzer" then
      require "lspconfig".rust_analyzer.setup {
        on_attach = on_attach,
        settings = {
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
      }
    else
      if server == "go" then
        config.settings = go_settings
        require "lspconfig"[server].setup(config)
      else
        require "lspconfig"[server].setup {
          on_attach = on_attach,
          flags = {
            debounce_text_changes = 150
          }
        }
      end
    end

    if server == "javascript" then
      require "lspconfig".eslint.setup {}
    end
  end
end
setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require "lspinstall".post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

local configs = require "lspconfig/configs"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

if not lspconfig.emmet_ls then
  configs.emmet_ls = {
    default_config = {
      cmd = {"emmet-ls", "--stdio"},
      filetypes = {"html", "css", "blade"},
      root_dir = function(fname)
        return vim.loop.cwd()
      end,
      settings = {}
    }
  }
end
lspconfig.emmet_ls.setup {capabilities = capabilities}

-- replace the default lsp diagnostic letters with prettier symbols
vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})

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
