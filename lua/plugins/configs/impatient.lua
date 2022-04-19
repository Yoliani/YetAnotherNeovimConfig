local status_ok, impatient = ey.safe_require(require,"impatient")
if not status_ok then
	return
end

impatient.enable_profile()
