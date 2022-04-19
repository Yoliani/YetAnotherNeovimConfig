local icons = require("yoliani.icons")
_G.ey = {}
YantNeovim = {
	colorscheme = "onedarkpro",
	ui = {
		float = {
			border = "rounded",
			highlight = "NightflyRed", -- check available by :Telescope highlights
		},
	},
	plugins = {

		package_info = {
			enabled = false,
		},
		rooter = {
			-- Removing package.json from list in Monorepo Frontend Project can be helpful
			-- By that your live_grep will work related to whole project, not specific package
			patterns = { ".git", "package.json", "_darcs", ".bzr", ".svn", "Makefile" }, -- Default
		},
	},
	icons = icons,

	-- LSP settings (for overriding per client)
	-- Load servers (They will be automatically installed after next "Sync plugins" launch)
	-- Check installed servers by :LspInstallInfo
	lsp = {
		servers = {
			-- 'bash',
			-- 'css',
			-- 'eslint',
			-- 'graphql',
			-- 'html',
			-- 'json',
			-- 'lua',
			-- 'tailwind',
			-- 'tsserver',
			-- 'vue2'
		},
	},
}


P = function(v)
	print(vim.inspect(v))
	return v
end

RELOAD = function(...)
	return require("plenary.reload").reload_module(...)
end

R = function(name)
	RELOAD(name)
	return require(name)
end


function ey.safe_require(module, opts)
  opts = opts or { silent = false }
  local ok, result = pcall(require, module)
  if not ok and not opts.silent then
    vim.notify(result, vim.log.levels.ERROR, { title = string.format("Error requiring: %s", module) })
  end
  return ok, result
end

function ey.get_icon(filename, extension, opts)
  local ok, devicons = ey.safe_require("nvim-web-devicons")
  if not ok then
    vim.notify("nvim-web-devicons not installed")
  end

  local icon_str, icon_color = devicons.get_icon_color(filename, extension, { default = true })

  local icon = { str = icon_str }

  if opts.colored_icon ~= false then
    icon.hl = { fg = icon_color }
  end

  return icon
end
function ey.find_pattern_match(tbl, val)
  return tbl and next(vim.tbl_filter(function(pattern)
    return val:match(pattern)
  end, tbl))
end
local lsp = vim.lsp
function ey.get_lsp_names()
    local clients = {}

    for _, client in pairs(lsp.buf_get_clients(0)) do
        clients[#clients + 1] = client.name
    end

    return table.concat(clients, ' '), ' '
end
