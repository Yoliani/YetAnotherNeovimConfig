local async

async =
   vim.loop.new_async(
      vim.schedule_wrap(
         function ()
            require("pluginList")
            require("settings")
            require("utils")
            require("plugins")
            require("mappings")
         end
   )
)
async:send()


