local cmp = require 'cmp'
vim.opt.completeopt = 'menuone,noselect'
require 'plugins.configs.luasnip'
local snip_status_ok, luasnip = pcall(require, 'luasnip')
if not snip_status_ok then
  return
end
local lspkind = require 'lspkind'
lspkind.init()
-- Utils
local check_backspace = function()
  local col = vim.fn.col '.' - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s'
end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
end
cmp.setup {
  completion = {
    completeopt = 'menuone,noinsert, noselect',
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = true,
  },
  window = {
    completion = {
      border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
      scrollbar = '║',
      autocomplete = {
        require('cmp.types').cmp.TriggerEvent.InsertEnter,
        require('cmp.types').cmp.TriggerEvent.TextChanged,
      },
    },
    documentation = {
      border = 'single',
      winhighlight = 'Normal:CmpDocumentation,FloatBorder:CmpDocumentationBorder',
      -- maxwidth = require('core.utils').fix_width(0, 0.9),
      -- maxheight = require('core.utils').fix_height(0, 0.9)
    },
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  style = {
    winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
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
        local _, entry1_under = entry1.completion_item.label:find '^_+'
        local _, entry2_under = entry2.completion_item.label:find '^_+'
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
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<c-p>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip and luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      elseif check_backspace() then
        fallback()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<c-k>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip and luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  formatting = {
    deprecated = true,
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        spell = '(Spell)',
        buffer = '(Buffer)',
        calc = '(Calc)',
        emoji = '(Emoji)',
        nvim_lsp = '(LSP)',
        path = '(Path)',
        look = '(Look)',
        treesitter = '(Treesitter)',
        luasnip = '(LuaSnip)',
        nvim_lua = '(api)',
        latex_symbols = '(Latex)',
        cmp_tabnine = '(Tabnine)',
        orgmode = '(orgmode)',
        ultisnips = '(UltiSnips)',
        npm = '',
        copilot = '(Copilot)',
      },
    },
  },
  experimental = {
    ghost_text = false,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'luasnip' },
    { name = 'ultisnips' },
    { name = 'buffer' },
    { name = 'nvim_lua' },
    { name = 'treesitter' },
    { name = 'spell' },
    { name = 'copilot' },
    -- { name = "calc" },
    -- { name = "emoji" },
    -- { name = "look" },
    -- { name = "latex_symbols" },
    -- { name = "cmp_tabnine" },
    -- { name = "neorg" },
    -- { name = "orgmode" },
    -- { name = "npm" },
  },
}

-- vim.cmd [[
-- augroup NvimCmp
-- au!
-- au FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
-- augroup END
-- ]]

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
-- cmp.setup.cmdline("/", {
--   sources = {
--     { name = "buffer" },
--   },
-- })
--
-- -- Use cmdline & path source for ':'
-- cmp.setup.cmdline(":", {
--   sources = cmp.config.sources({
--     { name = "path" },
--   }, {
--     { name = "cmdline" },
--   }),
-- })
--
-- Auto pairs
local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })
