-- https://github.com/nanotee/nvim-lua-guide#using-meta-accessors
-- vim.o.{option}: behaves like :set
-- vim.go.{option}: behaves like :setglobal
-- vim.bo.{option}: behaves like :setlocal for buffer-local options
-- vim.wo.{option}: behaves like :setlocal for window-local options

local Type = {
	GLOBAL_OPTION = "o",
	WINDOW_OPTION = "wo",
	BUFFER_OPTION = "bo",
}

local add_options = function(option_type, id, options)
	if type(id) == "table" then
		options = id
		id = 0
	end

	if type(options) ~= "table" then
		error('options should be a type of "table"')
		return
	end

	for key, value in pairs(options) do
		-- adding options to vim
		-- id condition is there to make it compatible with global options
		-- global options has no id
		-- vim['o']['mouse'] = 4
		-- vim['wo'][10]['number'] = true
		if id == 0 then
			vim[option_type][key] = value
		else
			vim[option_type][id][key] = value
		end
	end
end

local Option = {}

Option.g = function(options)
	add_options(Type.GLOBAL_OPTION, options)
end

Option.w = function(id, options)
	add_options(Type.WINDOW_OPTION, id, options)
end

Option.b = function(id, options)
	add_options(Type.BUFFER_OPTION, id, options)
end

local options = {}
options.g = function(list)
	for key, value in pairs(list) do
		vim.g[key] = value
	end
end
options.w = function(list)
	for key, value in pairs(list) do
		vim.w[key] = value
	end
end
options.b = function(list)
	for key, value in pairs(list) do
		vim.b[key] = value
	end
end

return options
