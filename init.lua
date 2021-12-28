require "impatient"
local async
_G.tab = {}
async =
    vim.loop.new_async(
    vim.schedule_wrap(
        function()
            require("plugins")
            require("settings")
            require("plugins.callplugins")
            require("core.mappings").others()
            require("core.autocmds")
        end
    )
)

async:send()
