local M = {}

function M.map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function isempty(s)
  return s == nil or s == ""
end
--
--  Split extension function
--
--
local function lines(str)
  local t = {}
  local function helper(line)
    table.insert(t, line)
    return ""
  end
  helper((str:gsub("(.-)\r?\n", helper)))
  return t
end

--
--  Declare exports
--

M.files_settings_path = require("os").getenv("HOME") .. "/.config/nvim/lua_settings.conf"
M.settings = {}
function M.load_settings()
  local file, err = io.open(M.files_settings_path, "r")
  if file == nil then
    print("Couldn't open file: " .. err)
  else
    --print("TEST")
    local content = file:read("*a")
    local lines_arr = lines(content)
    if next(lines_arr) ~= nil then
      for v in pairs(lines_arr) do
        local vv = lines_arr[v]
        if not isempty(vv) then
          local vn_k, vn_v = string.match(vv, "([^,]+)=([^,]+)")
          M.settings[vn_k] = vn_v
        end
      end
    end
    file:close()
  end
end
function M.set_value(name, val)
  local file = io.open(M.files_settings_path, "w")
  M.settings[name] = val
  for k, v in pairs(M.settings) do
    file:write(k .. "=" .. v .. "\n")
  end
  file:close()
end
function M.get_value(name, default)
  if M.settings[name] then
    return M.settings[name]
  else
    return default
  end
end

function M.reload_yanc_config()
  vim.cmd "source ~/.config/nvim/lua/core/mappings.lua"
  vim.cmd "source ~/.config/nvim/lua/plugins/init.lua"
  vim.cmd "source ~/.config/nvim/lua/settings.lua"
  vim.cmd "source ~/.config/nvim/lua/"
  vim.cmd ":PackerCompile"
  vim.cmd ":PackerInstall"
  -- vim.cmd ":PackerClean"
end

function M.check_lsp_client_active(name)
  local clients = vim.lsp.get_active_clients()
  for _, client in pairs(clients) do
    if client.name == name then
      return true
    end
  end
  return false
end

function M.add_keymap(mode, opts, keymaps)
  for _, keymap in ipairs(keymaps) do
    vim.api.nvim_set_keymap(mode, keymap[1], keymap[2], opts)
  end
end

function M.add_keymap_normal_mode(opts, keymaps)
  M.add_keymap("n", opts, keymaps)
end

function M.add_keymap_visual_mode(opts, keymaps)
  M.add_keymap("v", opts, keymaps)
end

function M.add_keymap_visual_block_mode(opts, keymaps)
  M.add_keymap("x", opts, keymaps)
end

function M.add_keymap_insert_mode(opts, keymaps)
  M.add_keymap("i", opts, keymaps)
end

function M.add_keymap_term_mode(opts, keymaps)
  M.add_keymap("t", opts, keymaps)
end

function M.is_buffer_empty()
  -- Check whether the current buffer is empty
  return vim.fn.empty(vim.fn.expand("%:t")) == 1
end

function M.has_width_gt(cols)
  -- Check if the windows width is greater than a given number of columns
  return vim.fn.winwidth(0) / 2 > cols
end

return M
