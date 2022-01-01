local async

async =
  vim.loop.new_async(
  vim.schedule_wrap(
    function()
      require("plugins")
      require("settings")
      require("core.pluginsInit")
      require("core.mappings")
      require("core.autocmds")
    end
  )
)

async:send()
