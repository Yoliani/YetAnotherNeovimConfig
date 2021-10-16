local async
--require "impatient"
_G.tab = {}
async =
  vim.loop.new_async(
  vim.schedule_wrap(
    function()
      require("pluginList")
      require("settings")
      require("plugins")
      require("mappings")
      require("autocmds")
    end
  )
)

async:send()
