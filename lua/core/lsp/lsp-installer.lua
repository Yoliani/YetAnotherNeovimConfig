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
local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = YantNeovim.ui.float.border}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = YantNeovim.ui.float.border}),
}

local attachments = require("core.lsp.attachments")
local capabilities = require("core.lsp.capabilities")

lsp_installer.on_server_ready(
    function(server)
        local opts = {capabilities = capabilities.common(), on_attach = attachments.common(), handlers = handlers}

        if server.name == "sumneko_lua" then
            opts.settings = require("core.lsp.servers.sumneko_lua")
        elseif server.name == "eslint" then
            opts.on_attach = function(client, bufnr)

                client.resolved_capabilities.document_formatting = true
                attachments.common(client, bufnr)
            end
        elseif server.name == "tsserver" then
            opts.settings = require("core.lsp.servers.tsserver").setup(opts)
        elseif server.name == "gopls" then
            opts = require("core.lsp.servers.gopls").setup(opts)
        elseif server.name == "diagnosticls" then
            opts = require("core.lsp.servers.diagnosticls").setup(opts)
        elseif server.name == "rust_analyzer" then
            opts = require("core.lsp.servers.rust_analyzer").setup(opts)
        elseif server.name == "jsonls" then
            opts = require("core.lsp.servers.jsonls").setup(opts)
        elseif server.name == "efm" then
            opts.root_dir = require("lspconfig").util.root_pattern({".git/", "."})
        elseif server.name == "inteliphense" then
            opts.settings = require("core.lsp.servers." .. server.name)
        elseif server.name == "zeta_note" then
            opts.cmd = {"zeta-note"}
        elseif server.name == "bashls" then
            opts.cmd = {"bash-language-server", "start"}
        elseif server.name == "solargraph" then

            opts.settings = {
                cmd = {"solargraph", "stdio"},
                solargraph = {
                    diagnostics = true
                },
                root_dir = require("lspconfig").util.root_pattern("Gemfile", ".git"),
                filetypes = {"ruby"}
            }
        end
        vim.cmd([[ do User LspAttachBuffers ]])

        server:setup(opts)
    end
)

local lsp = require("nvim_lsp")
lsp.solargraph.setup({settings = {solargraph = {diagnostics = true, logLevel = "debug"}}})
