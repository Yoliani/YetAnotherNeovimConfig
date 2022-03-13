local async

async =
  vim.loop.new_async(
  vim.schedule_wrap(
    function()
      require("yoliani.globals")
      require("config")
      require("plugins")
      require("settings")
      require("yoliani.plugins")
      require("core.mappings")
      require("core.autocmds")
      require("core.commands")
      require("yoliani.custom_plugins")
    end
  )
)

async:send()
