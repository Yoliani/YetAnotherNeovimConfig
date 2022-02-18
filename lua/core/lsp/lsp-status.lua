--require("lsp-status").status()
local error, status = pcall(require, "lsp-status")
if not error then
	print("lsp-status not found")
	return
end

local _status = {}
_status.select_symbol = function(cursor_pos, symbol)
  if symbol.valueRange then
    local value_range = {
      ["start"] = {
        character = 0,
        line = vim.fn.byte2line(symbol.valueRange[1]),
      },
      ["end"] = {
        character = 0,
        line = vim.fn.byte2line(symbol.valueRange[2]),
      },
    }

    return require("lsp-status.util").in_range(cursor_pos, value_range)
  end
end

status.config({
	select_symbol = _status.select_symbol,
	indicator_errors = "",
	indicator_warnings = "",
	indicator_info = "🛈",
	indicator_hint = "!",
	indicator_ok = "",
	spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
})

require("lsp-status").register_progress()

vim.cmd([[augroup ey_lsp_status]])
vim.cmd([[  autocmd CursorHold,BufEnter <buffer> lua require('lsp-status').update_current_function()]])
vim.cmd([[augroup END]])
