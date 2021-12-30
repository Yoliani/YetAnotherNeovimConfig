------------------------------------------------------------------------------------------
------------------------------- null ls --------------------------------------------------
local null_ls = require("null-ls")
local fmt = null_ls.builtins.formatting
local dg = null_ls.builtins.diagnostics
local ca = null_ls.builtins.code_actions
local nvim_lsp = require("lspconfig")
local _debug = function(content)
  local f = io.open("/home/acc/.nvim.debug.log", "a")
  f:write(content .. "\n")
  f.close()
end

local lsputil = require("lspconfig.util")
local root_has_file = function(name)
  local cwd = vim.loop.cwd()
  return lsputil.path.exists(lsputil.path.join(cwd, name))
end

null_ls.setup(
  {
    autostart = true,
    sources = {
      fmt.trim_whitespace.with(
        {
          filetypes = {"text", "sh", "zsh", "yaml", "toml", "make", "conf", "tmux"}
        }
      ),
      fmt.rustfmt,
      fmt.stylua,
      fmt.black.with({prefer_local = ".venv/bin", extra_args = {"--line-length", "120"}}),
      -- fmt.isort,
      fmt.isort.with(
        {
          -- condition = function(utils)
          -- 	return utils.root_has_file("pyproject.toml")
          -- end,
          args = function(params)
            lsputil = require("lspconfig.util")
            local cwd = vim.loop.cwd()

            local root = nvim_lsp.pyright.get_root_dir(params.bufname)
            local config = {
              "--stdout"
            }
            if lsputil.path.exists(lsputil.path.join(root, "pyproject.toml")) then
              table.insert(config, "--settings-path")
              table.insert(config, root)
            end
            table.insert(config, "--filename")
            table.insert(config, "$FILENAME")
            table.insert(config, "-")
            return config
          end
        }
      ),
      fmt.djhtml,
      fmt.eslint_d,
      fmt.prettierd,
      fmt.stylua,
      dg.eslint_d,
      dg.flake8,
      ca.eslint
    }
  }
)
