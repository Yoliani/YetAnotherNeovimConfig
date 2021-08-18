local function get_marks()
  local marks = vim.fn.getmarklist("%")
  local ns = 0
  local buf = 0
  return print(vim.inspect(marks))
end
return get_marks()
