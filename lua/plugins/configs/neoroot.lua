local status, neoroot = pcall(require, "neoroot")
if not status then
  return
end

local NOREF_NOERR_TRUNC = {noremap = true, silent = true, nowait = true}

vim.cmd "au BufEnter * NeoRoot"
vim.keymap.set(
  "n",
  "<Leader>p",
  function()
    vim.cmd("NeoRootSwitchMode")
  end,
  NOREF_NOERR_TRUNC
)
vim.keymap.set(
  "n",
  "<Leader>pre",
  function()
    vim.cmd("NeoRootChange")
  end,
  NOREF_NOERR_TRUNC
)
