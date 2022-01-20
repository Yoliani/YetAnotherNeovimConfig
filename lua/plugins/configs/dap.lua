local status, dap = pcall(require, "dap")
if not status then
  return
end
dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = "launch",
    name = "Launch file",
    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}", -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
        return cwd .. "/venv/bin/python"
      elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
        return cwd .. "/.venv/bin/python"
      else
        return "/usr/bin/python"
      end
    end
  }
}

dap.adapters.lldb = {
  type = "executable",
  command = "/usr/bin/lldb-vscode", -- adjust as needed
  name = "lldb"
}

dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = {os.getenv("HOME") .. "/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js"}
}
dap.configurations.javascript = {
  {
    type = "node2",
    request = "launch",
    program = "${workspaceFolder}/${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    console = "integratedTerminal"
  }
}
dap.defaults.fallback.terminal_win_cmd = "80vsplit new"
--vim.fn.sign_define("DapBreakpoint", {text = "🟥", texthl = "", linehl = "",
--numhl = ""})
--vim.fn.sign_define("DapBreakpointRejected", {text = "🟦", texthl = "", linehl
--= "", numhl = ""})
--vim.fn.sign_define("DapStopped", {text = "⭐️", texthl = "", linehl = "",
--numhl = ""})

require("nvim-dap-virtual-text").setup()

local _status, dapui = pcall(require, "dapui")
if not _status then
  return
end
dapui.setup(
  {
    icons = {expanded = "▾", collapsed = "▸"},
    mappings = {
      -- Use a table to apply multiple mappings
      expand = {"<CR>", "<leader>db"},
      open = "o",
      remove = "d",
      edit = "e",
      repl = "r"
    },
    sidebar = {
      -- You can change the order of elements in the sidebar
      elements = {
        -- Provide as ID strings or tables with "id" and "size" keys
        {
          id = "scopes",
          size = 0.25 -- Can be float or integer > 1
        },
        {id = "breakpoints", size = 0.25},
        {id = "stacks", size = 0.25},
        {id = "watches", size = 00.25}
      },
      size = 40,
      position = "left" -- Can be "left", "right", "top", "bottom"
    },
    tray = {
      elements = {"repl"},
      size = 10,
      position = "bottom" -- Can be "left", "right", "top", "bottom"
    },
    floating = {
      max_height = nil, -- These can be integers or a float between 0 and 1.
      max_width = nil, -- Floats will be treated as percentage of your screen.
      border = "single", -- Border style. Can be "single", "double" or "rounded"
      mappings = {
        close = {"q", "<Esc>"}
      }
    },
    windows = {indent = 1}
  }
)
