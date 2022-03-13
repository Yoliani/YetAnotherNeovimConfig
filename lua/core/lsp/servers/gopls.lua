local M = {}

M.setup = function(opts)
	opts.settings = {
		go = {
			-- cmd = {vim.fn.expand("/home/edgardoyoliani/.local/share/nvim/lspinstall/go/gopls")},
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
					},
					staticcheck = true,
				},
			},
		},
	}
	return opts
end

return M
