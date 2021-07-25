--local current_def = vim.fn.expand("<cword>")

local params = vim.lsp.util.locations_to_items()


local function goToDef()
	vim.lsp.buf_request(0, "test")
		
end
