all: lua/showmarks.lua

lua/%.lua: fnl/%.fnl
			fennel --compile $< > $@
