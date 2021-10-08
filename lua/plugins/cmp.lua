local cmp = require("cmp")
local lspkind = require("lspkind")

vim.opt.completeopt = "menuone,noselect"
local luasnip = require("luasnip")

local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", true)
end

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
      ["<Tab>"] = cmp.mapping(
        function(fallback)
          if vim.fn.pumvisible() == 1 then
            feedkey("<C-n>")
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
          end
        end,
        {"i", "s"}
      ),
      ["<S-Tab>"] = cmp.mapping(
        function(fallback)
          if vim.fn.pumvisible() == 1 then
            feedkey("<C-p>")
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end,
        {"i", "s"}
      ),
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
