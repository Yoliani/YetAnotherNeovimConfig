local _2afile_2a = "/home/edgardoyoliani/.config/nvim/fnl/init.fnl"
local _1_
do
  local name_4_auto = "dotfiles"
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
    return {require("dotfiles.mapping"), require("aniseed.nvim"), require("plugins.bufferline-config")}
  end
  ok_3f_21_auto, val_22_auto = pcall(_5_)
  if ok_3f_21_auto then
    _1_["aniseed/local-fns"] = {require = {mapping = "dotfiles.mapping", nvim = "aniseed.nvim", plugins = "plugins.bufferline-config"}}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local mapping = _local_4_[1]
local nvim = _local_4_[2]
local plugins = _local_4_[3]
local _2amodule_2a = _1_
local _2amodule_name_2a = "dotfiles"
do local _ = ({nil, _1_, nil, {{}, nil, nil, nil}})[2] end
nvim.g.maplocalleader = " "
nvim.o.termguicolors = true
nvim.o.mouse = "a"
nvim.o.clipboard = "unnamedplus"
nvim.w.number = true
nvim.o.updatetime = 100
nvim.ex.colorscheme("nightfox")
nvim.ex.highlight("NormalFloat ctermbg=grey guibg=grey")
mapping.setup()
local _1_ = _1_
do
  local name_4_auto = "plugins"
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
local autoload0
local function _9_(...)
  return (require("aniseed.autoload")).autoload(...)
end
autoload0 = _9_
local function _12_(...)
  local ok_3f_21_auto, val_22_auto = nil, nil
  local function _11_()
    return {}
  end
  ok_3f_21_auto, val_22_auto = pcall(_11_)
  if ok_3f_21_auto then
    _1_["aniseed/local-fns"] = {}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_10_ = _12_(...)
local _2amodule_2a0 = _1_
local _2amodule_name_2a0 = "plugins"
do local _ = ({nil, _1_, nil, {{}, nil, nil, nil}})[2] end
return require("plugins")