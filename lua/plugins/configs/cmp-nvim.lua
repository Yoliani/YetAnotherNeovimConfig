local cmp = require("cmp")
vim.opt.completeopt = "menuone,noselect"
--require("cmp-npm")
local lsp_symbols = {
	Text = "   (Text) ",
	Method = "   (Method)",
	Function = "   (Function)",
	Constructor = "   (Constructor)",
	Field = " ﴲ  (Field)",
	Variable = "[] (Variable)",
	Class = "   (Class)",
	Interface = " ﰮ  (Interface)",
	Module = "   (Module)",
	Property = " 襁 (Property)",
	Unit = "   (Unit)",
	Value = "   (Value)",
	Enum = " 練 (Enum)",
	Keyword = "   (Keyword)",
	Snippet = "   (Snippet)",
	Color = "   (Color)",
	File = "   (File)",
	Reference = "   (Reference)",
	Folder = "   (Folder)",
	EnumMember = "   (EnumMember)",
	Constant = " ﲀ  (Constant)",
	Struct = " ﳤ  (Struct)",
	Event = "   (Event)",
	Operator = "   (Operator)",
	TypeParameter = "   (TypeParameter)",
}

-- require("lspkind").init({
-- 	with_text = true,
-- 	preset = "codicons",
-- 	symbol_map = lsp_symbols,
-- })
local lspkind = require("lspkind")
lspkind.init()

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
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif require("luasnip").expand_or_jumpable() then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif require("luasnip").jumpable(-1) then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
			else
				fallback()
			end
		end,
	},
	--    formatting = {
	--      format = lspkind.cmp_format()
	--    },
	formatting = {
		-- format = function(entry, item)
		-- 	item.kind = lsp_symbols[item.kind] .. " " .. item.kind
		-- 	-- set a name for each source
		-- 	item.menu = ({
		-- 		spell = "(Spell)",
		-- 		buffer = "(Buffer)",
		-- 		calc = "(Calc)",
		-- 		emoji = "(Emoji)",
		-- 		nvim_lsp = "(LSP)",
		-- 		path = "(Path)",
		-- 		look = "(Look)",
		-- 		treesitter = "(Treesitter)",
		-- 		luasnip = "(LuaSnip)",
		-- 		nvim_lua = "(Lua)",
		-- 		latex_symbols = "(Latex)",
		-- 		cmp_tabnine = "(Tabnine)",
		-- 		orgmode = "(orgmode)",
		-- 		ultisnips = "(UltiSnips)",
		-- 		npm = "",
		-- 	})[entry.source.name]
		-- 	return item
		-- end,
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
				--cmp_tabnine = "(Tabnine)",
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
		{ name = 'copilot' },

		-- { name = "calc" },
		-- { name = "emoji" },
		-- { name = "look" },
		-- { name = "latex_symbols" },
		--{ name = "cmp_tabnine" },
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
--[[
local tabnine = require("cmp_tabnine.config")
tabnine:setup({
	max_lines = 1000,
	max_num_results = 20,
	sort = true,
	run_on_every_keystroke = true,
})
--]]
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).

--[[
cmp.setup.cmdline(
  "/",
  {
    sources = {
      {name = "buffer"}
    }
  }
)

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(
  ":",
  {
    sources = cmp.config.sources(
      {
        {name = "path"}
      },
      {
        {name = "cmdline"}
      }
    )
  }
)
--]]
