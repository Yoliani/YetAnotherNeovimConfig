local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}

-- dont copy any deleted text , this is disabled by default so uncomment the below mappings if you want them!
--[[ remove this line

map("n", "dd", [=[ "_dd ]=], opt)
map("v", "dd", [=[ "_dd ]=], opt)
map("v", "x", [=[ "_x ]=], opt)

 this line too ]]
local opts = {silent = true}
local maps = vim.api.nvim_set_keymap
vim.g.mapleader = " "

-- MAPPINGS
maps("n", "<S-t>", [[<Cmd>tabnew<CR>]], opts) -- new tab
maps("n", "<S-x>", [[<Cmd>bdelete<CR>]], opts) -- close tab

-- move between tabs
maps("n", "<TAB>", [[<Cmd>BufferLineCycleNext<CR>]], opts)
maps("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]], opts)
-- OPEN TERMINALS --
--map("n", "<C-l>", [[<Cmd>vnew term://zsh <CR>]], opt) -- term over right
map("n", "<C-x>", [[<Cmd> split term://zsh | resize 10 <CR>]], opt) --  term bottom
map("n", "<C-t>t", [[<Cmd> tabnew | term <CR>]], opt) -- term newtab
-- map("n",)
-- COPY EVERYTHING --
map("n", "<C-y>", [[ <Cmd> %y+<CR>]], opt)

-- toggle numbers ---
map("n", "<leader>n", [[ <Cmd> set nu!<CR>]], opt)

-- toggle truezen.nvim's ataraxis and minimalist mode
map("n", "<leader>z", [[ <Cmd> TZAtaraxis<CR>]], opt)
map("n", "<leader>m", [[ <Cmd> TZMinimalist<CR>]], opt)

map("n", "<C-s>", [[ <Cmd> w <CR>]], opt)

--Diffview
map("n", "<leader>2", ":DiffviewOpen<CR>", {noremap = true, silent = true})
map("n", "<leader>21", ":DiffviewClose<CR>", {noremap = true, silent = true})
map("n", "<leader>22", ":DiffviewOpen master<CR>", {noremap = true, silent = true})

--Split
map("n", "<leader>3", ":<C-u>split<CR>")
map("n", "<leader>31", ":<C-u>vsplit<CR>")

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
map("n", "<leader>ip", ":lua Indent_Php()<Cr>")
vim.api.nvim_set_keymap(
  "n",
  "<leader>ln",
  "<cmd>lua require('tests.nui_lsp').lsp_rename()<CR>",
  {noremap = true, silent = true}
)
vim.cmd(
  [[
  augroup My_group
  autocmd!
  autocmd Filetype python nnoremap <F5> :w<CR>:vert ter python3 "%"<CR>
  augroup END
  
  ]]
)

map("n", "<leader>sp", [[:lua require("stabilize").setup()]], {noremap = true, silent = true})

map("n", "<F4>", [[:w<CR>:vert ter python3 "%"<CR>]], {noremap = true, silent = true}) -- term over right

map(
  "n",
  "<F9>",
  [[:w<CR>:vert ter /usr/bin/env /usr/lib/jvm/java-11-openjdk-amd64/bin/java -Dfile.encoding=UTF-8 "%"<CR>]],
  {noremap = true, silent = true}
)

map("n", "<F8>", ":!jfx %<CR>", {noremap = true, silent = true})

--
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

--Github copilot mapping accept
--vim.g.copilot_no_tab_map = true
--map("i", "<C-J>", "copilot#Accept()<CR>", opts)
vim.cmd([[
  imap <silent><script><expr> <C-F> copilot#Accept("\<CR>")
   let g:copilot_no_tab_map = v:true
  ]])
