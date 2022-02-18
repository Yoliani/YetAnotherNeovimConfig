local async

async =
  vim.loop.new_async(
  vim.schedule_wrap(
    function()
      require("yoliani.globals")
      require("plugins")
      require("settings")
      require("yoliani.plugins")
      require("core.mappings")
      require("core.autocmds")
    end
  )
)

async:send()
