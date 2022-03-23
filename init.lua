local async

async = vim.loop.new_async(vim.schedule_wrap(function()
  require 'utils'
  require 'config'
  require 'plugins'
  require 'settings'
  require 'yoliani.plugins'
  require 'core.mappings'
  require 'core.autocmds'
  require 'core.commands'
end))

async:send()
