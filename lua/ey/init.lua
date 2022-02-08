local async

async = vim.loop.new_async(vim.schedule_wrap(function()
	require("ey.options")
	require("ey.disable_builtin")
	require("ey.myfunctions")
end))

async:send()
