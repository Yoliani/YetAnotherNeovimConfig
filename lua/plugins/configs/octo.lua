local status_ok, octo = pcall(require, "octo")
if not status_ok then
	print("[Octo] Error loading Octo library")
	return
end

octo.setup()
