local status, presence = ey.safe_require(require, "presence")

if not status then
	--print()
	vim.notify("[presence] Could not load presence.lua", "warn")
	return
end

presence.setup()
