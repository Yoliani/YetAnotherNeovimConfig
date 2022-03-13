local status_ok, chadtree = pcall(require, "chadtree")
if not status_ok then
	return
end
local chadtree_settings = { name = { "nord" } }
vim.api.nvim_set_var("chadtree_settings.theme.icon_colour_set", chadtree_settings)
--chadtree_settings.theme.icon_colour_set("nerdtree_syntax_dark")
