--local current_def = vim.fn.expand("<cword>")
local Input = require("nui.input")
local event = require("nui.utils.autocmd").event



local function goToDef()
	local params = vim.lsp.util.locations_to_items()
	vim.lsp.buf_request(0, "textDocument/declaration")	
end
