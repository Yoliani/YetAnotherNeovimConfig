local lspinstall = require("lspinstall")
local lspconfig = require "lspconfig"
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
    --print(server)
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
  end
end
setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require "lspinstall".post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

-- replace the default lsp diagnostic letters with prettier symbols
vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})

local protocol = require "vim.lsp.protocol"
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

--For Flutter 
require("flutter-tools").setup {
  ui = {
    -- the border type to use for all floating windows, the same options/formats
    -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
    border = "rounded"
  },
  debugger = {
    -- integrate with nvim dap + install dart code debugger
    enabled = false
  },
  widget_guides = {
    enabled = true
  },
  closing_tags = {
    prefix = "//", -- character to use for close tag e.g. > Widget
    enabled = true -- set to false to disable
  },
  dev_log = {
    open_cmd = "tabedit" -- command to use to open the log buffer
  },
  dev_tools = {
    autostart = false, -- autostart devtools server if not detected
    auto_open_browser = false -- Automatically opens devtools in the browser
  },
  outline = {
    open_cmd = "35vnew" -- command to use to open the outline buffer
  }
}

-- Telescope Integration
--      In order to set this up, you can explicitly load the extension.
require("telescope").load_extension("flutter")


vim.cmd([[ autocmd VimEnter *.dart  nnoremap <Leader>o :Telescope flutter commands <CR> ]])

--Rust
local opts = {
    tools = { -- rust-tools options
        -- automatically set inlay hints (type hints)
        -- There is an issue due to which the hints are not applied on the first
        -- opened file. For now, write to the file to trigger a reapplication of
        -- the hints or just run :RustSetInlayHints.
        -- default: true
        autoSetHints = true,

        -- whether to show hover actions inside the hover window
        -- this overrides the default hover handler so something like lspsaga.nvim's hover would be overriden by this
        -- default: true
        hover_with_actions = true,

        -- These apply to the default RustRunnables command
        runnables = {
            -- whether to use telescope for selection menu or not
            -- default: true
            use_telescope = true

            -- rest of the opts are forwarded to telescope
        },

        -- These apply to the default RustSetInlayHints command
        inlay_hints = {
            -- wheter to show parameter hints with the inlay hints or not
            -- default: true
            show_parameter_hints = true,

            -- prefix for parameter hints
            -- default: "<-"
            parameter_hints_prefix = "<- ",

            -- prefix for all the other hints (type, chaining)
            -- default: "=>"
            other_hints_prefix = "=> ",

            -- whether to align to the lenght of the longest line in the file
            max_len_align = false,

            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,

            -- whether to align to the extreme right or not
            right_align = false,

            -- padding from the right if right_align is true
            right_align_padding = 7
        },

        hover_actions = {
            -- the border that is used for the hover window
            -- see vim.api.nvim_open_win()
            border = {
                {"╭", "FloatBorder"}, {"─", "FloatBorder"},
                {"╮", "FloatBorder"}, {"│", "FloatBorder"},
                {"╯", "FloatBorder"}, {"─", "FloatBorder"},
                {"╰", "FloatBorder"}, {"│", "FloatBorder"}
            },

            -- whether the hover action window gets automatically focused
            -- default: false
            auto_focus = false
        }
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {} -- rust-analyer options
}

require('rust-tools').setup(opts)
