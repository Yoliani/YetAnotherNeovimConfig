local M = {}

M.map =  function (mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

M.bufmap = function (bufnr,mode, lhs, rhs, opts)
	local options = {noremap = true, silent = true}
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	if bufnr == 0 then
		bufnr = vim.api.nvim_get_current_buf()
	end
	vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, options)
end


return M
