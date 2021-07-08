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
-- OPEN TERMINALS --
map("n", "<C-l>", [[<Cmd>vnew term://bash <CR>]], opt) -- term over right
map("n", "<C-x>", [[<Cmd> split term://bash | resize 10 <CR>]], opt) --  term bottom
map("n", "<C-t>t", [[<Cmd> tabnew | term <CR>]], opt) -- term newtab
-- map("n",)
-- COPY EVERYTHING --
map("n", "<C-a>", [[ <Cmd> %y+<CR>]], opt)

-- toggle numbers ---
map("n", "<leader>n", [[ <Cmd> set nu!<CR>]], opt)

-- toggle truezen.nvim's ataraxis and minimalist mode
map("n", "<leader>z", [[ <Cmd> TZAtaraxis<CR>]], opt)
map("n", "<leader>m", [[ <Cmd> TZMinimalist<CR>]], opt)

map("n", "<C-s>", [[ <Cmd> w <CR>]], opt)
-- vim.cmd("inoremap jh <Esc>")

-- Commenter Keybinding
map("n", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})
map("v", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})

--Diffview
map("n", "<leader>2", ":DiffviewOpen<CR>", {noremap = true, silent = true})
map("n", "<leader>21", ":DiffviewClose<CR>", {noremap = true, silent = true})
map("n", "<leader>22", ":DiffviewOpen master<CR>", {noremap = true, silent = true})

--Split
map("n", "<leader>3", ":<C-u>split<CR>")
map("n", "<leader>31", ":<C-u>vsplit<CR>")     



local cmd = vim.cmd

cmd(':command! WQ wq')
cmd(':command! WQ wq')
cmd(':command! Wq wq')
cmd(':command! Wqa wqa')
cmd(':command! W w')
cmd(':command! Q q')


local settings_manager = require '../misc-utils/settings'
settings_manager.load_settings()

--
--  Cycle Themes
--
local base16 = require "base16"
local themes_names = {
    "material","onedark","nord", "monokai", "solarized", "twilight", "ocean", "google","brewer", "default"
}
local log_cycle_theme = true
local base16_position = settings_manager.get_value("current_theme", 1)
base16_position = (base16_position - 1 % #themes_names) + 1
base16(base16.themes[themes_names[base16_position]], true)

function _G.cycle_teme ()
    if base16_position == 11 then 
        base16_position = 0
    end
    base16_position = (base16_position % #themes_names) + 1
    --print("BAse position = ", base16_position)
    base16(base16.themes[themes_names[base16_position]], true)
    settings_manager.set_value("current_theme", base16_position)
    if log_cycle_theme == true then
        print(base16_position)
        print("Theme changed to: " .. themes_names[base16_position])
    end
end



--
--  Mappings
--

map("n", "<leader>tn", ":lua cycle_teme()<Cr>")
