local M = {}

M.get_lsp_diagnostic = function(self)
  local result = {}
  local levels = {
    errors = 'Error',
    warnings = 'Warning',
    info = 'Information',
    hints = 'Hint'
  }

  for k, level in pairs(levels) do
    result[k] = vim.lsp.diagnostic.get_count(0, level)
  end

  if self:is_truncated(self.trunc_width.diagnostic) then
    return ''
  else
    return string.format(
      "| :%s :%s :%s :%s ",
      result['errors'] or 0, result['warnings'] or 0,
      result['info'] or 0, result['hints'] or 0
    )
  end
end

return M
