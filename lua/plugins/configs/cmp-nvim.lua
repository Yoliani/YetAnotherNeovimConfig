local cmp = require("cmp")
vim.opt.completeopt = "menuone,noselect"
require("plugins.configs.luasnip")
local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end
local lspkind = require("lspkind")
lspkind.init()
-- Utils
local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end
cmp.setup({
	completion = {
		completeopt = "menuone,noinsert, noselect",
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = true,
	},
	snippet = {
		expand = function(args)
			-- For `vsnip` user.
			--vim.fn["vsnip#anonymous"](args.body)

			-- For `luasnip` user.
			require("luasnip").lsp_expand(args.body)

			-- For `ultisnips` user.
			--vim.fn["UltiSnips#Anon"](args.body)
			--
		end,
	},
	sorting = {
		-- TODO: Would be cool to add stuff like "See variable names before method names" in rust, or something like that.
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			-- copied from cmp-under, but I don't think I need the plugin for this.
			-- I might add some more of my own.
			function(entry1, entry2)
				local _, entry1_under = entry1.completion_item.label:find("^_+")
				local _, entry2_under = entry2.completion_item.label:find("^_+")
				entry1_under = entry1_under or 0
				entry2_under = entry2_under or 0
				if entry1_under > entry2_under then
					return false
				elseif entry1_under < entry2_under then
					return true
				end
			end,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
	duplicates = {
		buffer = 1,
		path = 1,
		nvim_lsp = 0,
		luasnip = 1,
	},
	mapping = {
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	},
	--    formatting = {
	--      format = lspkind.cmp_format()
	--    },
	formatting = {

		format = lspkind.cmp_format({
			with_text = true,
			menu = {
				spell = "(Spell)",
				buffer = "(Buffer)",
				calc = "(Calc)",
				emoji = "(Emoji)",
				nvim_lsp = "(LSP)",
				path = "(Path)",
				look = "(Look)",
				treesitter = "(Treesitter)",
				luasnip = "(LuaSnip)",
				nvim_lua = "(api)",
				latex_symbols = "(Latex)",
				cmp_tabnine = "(Tabnine)",
				orgmode = "(orgmode)",
				ultisnips = "(UltiSnips)",
				npm = "",
				copilot = "(Copilot)",
			},
		}),
	},
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
		{ name = "path" },
		{ name = "luasnip" },
		{ name = "ultisnips" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
		{ name = "treesitter" },
		{ name = "spell" },
		{ name = "copilot" },
		-- { name = "calc" },
		-- { name = "emoji" },
		-- { name = "look" },
		-- { name = "latex_symbols" },
		-- { name = "cmp_tabnine" },
		{ name = "neorg" },
		{ name = "orgmode" },
		-- { name = "npm" },
	},
	documentation = {
		border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
	},
})

vim.cmd([[
augroup NvimCmp
au!
au FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
augroup END
]])

-- local tabnine = require("cmp_tabnine.config")
-- tabnine:setup({
-- 	max_lines = 1000,
-- 	max_num_results = 3,
-- 	sort = true,
-- 	show_prediction_strength = true,
-- 	run_on_every_keystroke = true,
-- 	snipper_placeholder = "..",
-- 	ignored_file_types = {},
-- })

  -- Use buffer source for `/`
  cmp.setup.cmdline("/", {
    sources = {
      { name = "buffer" },
    },
  })

  -- Use cmdline & path source for ':'
  cmp.setup.cmdline(":", {
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  })

  -- Auto pairs
  local cmp_autopairs = require "nvim-autopairs.completion.cmp"
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
