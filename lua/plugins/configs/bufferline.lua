local M = {}

M.buffer_line = function()
	local present, bufferline = pcall(require, "bufferline")
	if not present then
		return
	end
	bufferline.setup({
		options = {
			offsets = { { filetype = "ChadTree", text = "", padding = 1 } },
			buffer_close_icon = "",
			modified_icon = "",
			close_icon = "",
			left_trunc_marker = "",
			right_trunc_marker = "",
			max_name_length = 22,
			max_prefix_length = 14,
			tab_size = 20,
			show_tab_indicators = true,
			enforce_regular_tabs = true,
			view = "multiwindow",
			show_buffer_close_icons = false,
			separator_style = "thick",
			right_mouse_command = "vertical sbuffer %d",
			--numbers = "buffer_id",
			persist_buffer_sort = true,
			diagnostics = "nvim_lsp",
			diagnostics_update_in_insert = false,
		},
	})
end

M.cokeline = function()
	local present, cokeline = pcall(require, "cokeline")
	if not present then
		print("cokeline not found")
		return
	end

	local colors = require("onedarkpro").get_colors(vim.g.onedarkpro_style)
	local rq_mappings = require("cokeline/mappings")
	local rq_get_hex = require("cokeline/utils").get_hex

	local comments_fg = rq_get_hex("Comment", "fg")
	local errors_fg = rq_get_hex("DiagnosticError", "fg")
	local warnings_fg = rq_get_hex("DiagnosticWarn", "fg")
	cokeline.setup({
		show_if_buffers_are_at_least = 2,
		mappings = {
			cycle_prev_next = true,
		},
		default_hl = {

			fg = function(buffer)
				return buffer.is_focused and colors.purple or colors.gray
			end,
			bg = "NONE",
			style = function(buffer)
				return buffer.is_focused and "bold" or "NONE"
			end,
		},
		components = {
			{
				--Icons
				text = function(buffer)
					return (rq_mappings.is_picking_focus() or rq_mappings.is_picking_close())
							and buffer.pick_letter .. " "
						or buffer.devicon.icon
				end,
				hl = {
					fg = function(buffer)
						return (rq_mappings.is_picking_focus() and colors.purple)
							or (rq_mappings.is_picking_close() and colors.red)
							or buffer.devicon.color
					end,
					style = function(_)
						return (rq_mappings.is_picking_focus() or rq_mappings.is_picking_close()) and "italic,bold"
							or nil
					end,
				},
			},
			{
				-- buffer index
				text = function(buffer)
					return buffer.index ~= 1 and "" or ""
				end,
			},
			{
				text = function(buffer)
					return buffer.index .. ": "
				end,
				hl = {
					style = function(buffer)
						return buffer.is_focused and "bold" or nil
					end,
				},
			},
			{
				text = function(buffer)
					return buffer.unique_prefix
				end,
				hl = {
					fg = function(buffer)
						return buffer.is_focused and colors.purple or colors.gray
					end,
					style = "italic",
				},
			},
			{
				text = function(buffer)
					return buffer.filename .. " "
				end,
				hl = {
					style = function(buffer)
						return buffer.is_focused and "bold" or nil
					end,
				},
			},
			{
				text = function(buffer)
					return (buffer.diagnostics.errors ~= 0 and "  " .. buffer.diagnostics.errors)
						or (buffer.diagnostics.warnings ~= 0 and "  " .. buffer.diagnostics.warnings)
						or ""
				end,
				hl = {
					fg = function(buffer)
						return (buffer.diagnostics.errors ~= 0 and errors_fg)
							or (buffer.diagnostics.warnings ~= 0 and warnings_fg)
							or nil
					end,
				},
				truncation = { priority = 2 },
			},
			{
				text = function(buffer)
					return buffer.is_modified and " ●" or " "
				end,
				hl = {
					fg = function(buffer)
						return buffer.is_focused and colors.red
					end,
				},
				delete_buffer_on_left_click = true,
				truncation = { priority = 5 },
			},
			{
				text = "  ",
			},
		},
	})
end

M.cokeline()
