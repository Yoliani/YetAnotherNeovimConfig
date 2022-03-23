local map = require("utils.keymaps").map

local opt = {}
local M = {}
local opts = { silent = true }

vim.g.mapleader = " "

local cmd = vim.cmd

cmd(":command! WQ wq")
cmd(":command! WQ wq")
cmd(":command! Wq wq")
cmd(":command! Wqa wqa")
cmd(":command! W w")
cmd(":command! Q q")
function _G.Indent_Php()
	vim.cmd([[
    set ft=html
    normal gg=G
    set ft=php
    ]])
end

M.others = function()
	-- MAPPINGS
	map("n", "<S-t>", [[<Cmd>tabnew<CR>]], opts) -- new tab
	map("n", "<S-x>", [[<Cmd>bdelete<CR>]], opts) -- close tab

	-- move between tabs
	map("n", "<Tab>", "<Plug>(cokeline-focus-next)", { noremap = false, silent = true })
	map("n", "<S-Tab>", "<Plug>(cokeline-focus-prev)", { noremap = false })
	--cokeline
	--map("n", "<TAB>", [[<Cmd>BufferLineCycleNext<CR>]], opts)
	--map("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]], opts)
	-- OPEN TERMINALS --
	--map("n", "<C-l>", [[<Cmd>vnew term://zsh <CR>]], opt) -- term over right
	map("n", "<C-x>", [[<Cmd> split term://zsh | resize 10 <CR>]], opt) --  term bottom
	map("n", "<C-t>t", [[<Cmd> tabnew | term <CR>]], opt) -- term newtab
	-- map("n",)
	-- COPY EVERYTHING --
	map("n", "<C-y>", [[ <Cmd> %y+<CR>]], opt)

	-- toggle numbers ---
	map("n", "<leader>n", [[ <Cmd> set nu!<CR>]], opt)

	-- toogle chadtree ---
	--map("n", "<leader>1", [[ <Cmd>CHADopen<CR>]], opt)

	map("n", "<C-s>", [[ <Cmd> w <CR>]], opt)

	--Diffview
	map("n", "<leader>vv", ":DiffviewOpen<CR>", { noremap = true, silent = true })
	map("n", "<leader>vc", ":DiffviewClose<CR>", { noremap = true, silent = true })


	map("n", "<leader>ip", ":lua Indent_Php()<Cr>")
	map(
		"n",
		"<leader>ln",
		"<cmd>lua require('tests.nui_lsp').lsp_rename()<CR>",
		{ noremap = true, silent = true }
	)
	vim.cmd([[
  augroup My_group
  autocmd!
  autocmd Filetype python nnoremap <F5> :w<CR>:vert ter python3 "%"<CR>
  augroup END
  
  ]])

	map("n", "<leader>sp", [[:lua require("stabilize").setup()]], { noremap = true, silent = true })

	map("n", "<F4>", [[:w<CR>:vert ter python3 "%"<CR>]], { noremap = true, silent = true }) -- term over right

	map(
		"n",
		"<F9>",
		[[:w<CR>:vert ter /usr/bin/env /usr/lib/jvm/java-11-openjdk-amd64/bin/java -Dfile.encoding=UTF-8 "%"<CR>]],
		{ noremap = true, silent = true }
	)
	map("n", "<F10>", [[:w<CR>:vert ter javac "%"<CR>]], { noremap = true, silent = true })

	map("n", "<F8>", ":!jfx %<CR>", { noremap = true, silent = true })

	--telegraph

	map(
		"n",
		"<leader><leader>M",
		[[:lua require'telegraph'.telegraph({how='tmux_popup', cmd='ils '})<Left><Left><Left>]],
		{ noremap = true, silent = true }
	)

	map("n", "<leader><leader>m", [[:Telegraph man]], { noremap = true, silent = true })

	-- LF

	map("n", "<space>lf", ":Lf<CR>", opts)

	-- Test Lua files
	map("n", ",t", "<Plug>PlenaryTestFile", { noremap = true })
	vim.cmd([[nmap ,t <Plug>PlenaryTestFile]])
end

M.treesitter = function()
	-- Treesitter Unit
	-- vau and viu select outer and inner units
	-- cau and ciu change outer and inner units
	map("x", "iu", '<cmd>lua require"treesitter-unit".select()<CR>', opts)
	map("x", "au", '<cmd>lua require"treesitter-unit".select(true)<CR>', opts)
	map("o", "iu", '<cmd><c-u>lua require"treesitter-unit".select()<CR>', opts)
	map("o", "au", '<cmd><c-u>lua require"treesitter-unit".select(true)<CR>', opts)
end

M.tmux = function()
	map("n", "<C-k>", "<cmd>lua require('tmux').move_up()<CR>", opts)
	map("n", "<C-j>", "<cmd>lua require('tmux').move_down()<CR>", opts)
	map("n", "<C-h>", "<cmd>lua require('tmux').move_left()<CR>", opts)
	map("n", "<C-l>", "<cmd>lua require('tmux').move_right()<CR>", opts)
end

M.telescope = function()
	opt = { noremap = true, silent = true }

	-- mappings
	map("n", "<Leader>ff", [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], opt)
	map("n", "<Leader>fp", [[<Cmd>lua require('telescope').extensions.media_files.media_files()<CR>]], opt)

	map("n", "<leader>M", "<cmd>lua require('telescope.builtin').keymaps() <CR>", { silent = true, noremap = true })
	map("n", "<Leader>fb", [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], opt)
	map("n", "<Leader>fh", [[<Cmd>lua require('telescope.builtin').help_tags()<CR>]], opt)
	map("n", "<Leader>fo", [[<Cmd>lua require('telescope.builtin').oldfiles()<CR>]], opt)
	map("n", "<Leader>fm", [[<Cmd> Neoformat<CR>]], opt)

	-- dashboard stuff
	map("n", "<Leader>fw", [[<Cmd> Telescope live_grep<CR>]], opt)
	map(
		"n",
		"<leader>ca",
		"<cmd>lua  require('telescope.builtin').lsp_code_actions( {layout_config={width=50, height=20} } ) <CR>",
		{ silent = true, noremap = true }
	)
	map(
		"x",
		"<leader>ca",
		"<cmd>lua  require('telescope.builtin').lsp_range_code_actions( {layout_config={width=50, height=25} } ) <CR>",
		{ silent = true, noremap = true }
	)
	map("n", ",h", [[<Cmd> Telescope help_tags <CR>]], opt)
end

M.visual_multi = function()
	vim.g.VM_maps = {
		["Find Under"] = "<C-e>",
		["Find Subword Under"] = "<C-e>",
		-- ["Select Cursor Down"] = "\\j",
		-- ["Select Cursor Up"] = "\\k"
	}
end

M.lsp = function()
	-- LSP
	-- lsp
	map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	map("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	map("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	map("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	--map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	map("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	map("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
end

M.dap = function()
	map("n", "<leader>dh", ':lua require"dap".toggle_breakpoint()<CR>')
	map("n", "<leader>dH", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
	map("n", "<c-u>", ':lua require"dap".step_out()<CR>')
	map("n", "<leader>si", ':lua require"dap".step_into()<CR>')
	map("n", "<c-o>", ':lua require"dap".step_over()<CR>')
	map("n", "<c-p>", ':lua require"dap".continue()<CR>')
	map("n", "<leader>dn", ':lua require"dap".run_to_cursor()<CR>')
	map("n", "<leader>dk", ':lua require"dap".up()<CR>')
	map("n", "<leader>dj", ':lua require"dap".down()<CR>')
	map("n", "<leader>dc", ':lua require"dap".terminate()<CR>')
	map("n", "<leader>dr", ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')
	map("n", "<leader>de", ':lua require"dap".set_exception_breakpoints({"all"})<CR>')
	map("n", "<leader>da", ':lua require"debugHelper".attach()<CR>')
	map("n", "<leader>dA", ':lua require"debugHelper".attachToRemote()<CR>')
	map("n", "<leader>di", ':lua require"dap.ui.widgets".hover()<CR>')
	map("n", "<leader>d?", ':lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>')
end

--Call mappning function
M.others()
--M.tmux()
M.treesitter()
M.telescope()
M.visual_multi()
--M.dap()
--Return the table
return M
