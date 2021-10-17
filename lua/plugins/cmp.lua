local cmp = require("cmp")
vim.opt.completeopt = "menu,menuone,noselect"
local luasnip = require("luasnip")

if not luasnip then
  return
end

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
  TypeParameter = "   (TypeParameter)"
}

cmp.setup(
  {
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end
    },
    mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true
      },
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
      ["<cr>"] = cmp.mapping.confirm({select = true})
    },
    formatting = {
      format = function(entry, item)
        item.kind = lsp_symbols[item.kind] .. " " .. item.kind
        -- set a name for each source
        item.menu =
          ({
          spell = "[Spell]",
          buffer = "[Buffer]",
          calc = "[Calc]",
          emoji = "[Emoji]",
          nvim_lsp = "[LSP]",
          path = "[Path]",
          look = "[Look]",
          treesitter = "[treesitter]",
          luasnip = "[LuaSnip]",
          nvim_lua = "[Lua]",
          latex_symbols = "[Latex]",
          cmp_tabnine = "[Tab9]"
        })[entry.source.name]
        return item
      end
    },
    sources = {
      {name = "nvim_lsp"},
      {name = "vsnip"},
      {name = "path"},
      {name = "luasnip"},
      {name = "ultisnips"},
      {name = "buffer"},
      {name = "nvim_lua"},
      {name = "treesitter"},
      {name = "spell"},
      {name = "calc"},
      {name = "emoji"},
      {name = "look"},
      {name = "latex_symbols"},
      {name = "cmp_tabnine"},
      {name = "neorg"},
      {name = "cmp_luasnip"}
    }
  }
)

vim.cmd(
  [[
augroup NvimCmp
au!
au FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
augroup END
]]
)

local tabnine = require("cmp_tabnine.config")
tabnine:setup(
  {
    max_lines = 1000,
    max_num_results = 20,
    sort = true,
    run_on_every_keystroke = true
  }
)
