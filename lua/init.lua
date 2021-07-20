--equire"settings"

local async

async =
   vim.loop.new_async(
      vim.schedule_wrap(
         function ()
            require("pluginList")
            require("utils")
            require("plugins")
            require("mappings")
            require("settings")

            
         end
   )
)
async:send()


