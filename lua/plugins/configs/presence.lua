local status, presence = pcall(require, "presence")

if not status then
  print("[presence] Could not load presence.lua")
  return
end

presence.setup()
