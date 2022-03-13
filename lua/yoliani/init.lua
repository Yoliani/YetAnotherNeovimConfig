local async

async = vim.loop.new_async(vim.schedule_wrap(function()
	require("yoliani.options")
	require("yoliani.disable_builtin")
	require("yoliani.myfunctions")
end))

async:send()
