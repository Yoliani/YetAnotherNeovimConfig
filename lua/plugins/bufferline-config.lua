local _2afile_2a = "fnl/plugins/bufferline-config.fnl"
local _1_
do
  local name_4_auto = "dotfiles.plugins.bufferline-config"
  local module_5_auto
  do
    local x_6_auto = _G.package.loaded[name_4_auto]
    if ("table" == type(x_6_auto)) then
      module_5_auto = x_6_auto
    else
      module_5_auto = {}
    end
  end
  module_5_auto["aniseed/module"] = name_4_auto
  module_5_auto["aniseed/locals"] = ((module_5_auto)["aniseed/locals"] or {})
  do end (module_5_auto)["aniseed/local-fns"] = ((module_5_auto)["aniseed/local-fns"] or {})
  do end (_G.package.loaded)[name_4_auto] = module_5_auto
  _1_ = module_5_auto
end
local autoload
local function _3_(...)
  return (require("aniseed.autoload")).autoload(...)
end
autoload = _3_
local function _6_(...)
  local ok_3f_21_auto, val_22_auto = nil, nil
  local function _5_()
    return {autoload("aniseed.nvim")}
  end
  ok_3f_21_auto, val_22_auto = pcall(_5_)
  if ok_3f_21_auto then
    _1_["aniseed/local-fns"] = {autoload = {nvim = "aniseed.nvim"}}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local nvim = _local_4_[1]
local _2amodule_2a = _1_
local _2amodule_name_2a = "dotfiles.plugins.bufferline-config"
do local _ = ({nil, _1_, nil, {{}, nil, nil, nil}})[2] end
do
  local bufferline = require("bufferline")
  if bufferline then
    do local _ = {buffer_close_icon = "\239\153\149", close_icon = "\239\153\152", enforce_regular_tabs = false, left_trunc_marker = "\239\130\168", mappings = false, max_name_length = 18, max_prefix_length = 14, modified_icon = "\239\145\132", persist_buffer_sort = true, right_mouse_command = "vertical sbuffer %d", right_trunc_marker = "\239\130\169", separator_style = "thick", show_buffer_close_icons = true, show_tab_indicators = true, tab_size = 20, view = "multiwindow"} end
  end
end
nvim.ex.inoremap("<S-t> [[<Cmd>tabnew<CR>]]")
nvim.ex.inoremap("<S-x> [[<Cmd>bdelete<CR>]]")
return nvim.ex.inoremap("<TAB> [[<Cmd>BufferLineCycleNext<CR>]]")