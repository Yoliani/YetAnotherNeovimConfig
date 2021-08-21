local _2afile_2a = "fnl/showmarks.fnl"
local function get_marks()
  local marks = vim.fn.getmarklist("%")
  local ns = 0
  local buf = 0
  for _, _2_ in ipairs(marks) do
    local _each_3_ = _2_
    local mark = _each_3_["mark"]
    local _each_4_ = _each_3_["pos"]
    local _0 = _each_4_[1]
    local line = _each_4_[2]
    local _1 = _each_4_[3]
    local _2 = _each_4_[4]
    vim.api.nvim_buf_set_virtual_text(buf, ns, line, {mark, WarningMsg}, {})
  end
  return nil
end
return get_marks()