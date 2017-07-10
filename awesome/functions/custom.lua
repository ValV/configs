-- Lua
local naughty = naughty or require("naughty")

-- Override print function to display messages via 'naughty' plugin as:
-- print ('Title', 'Text line 1', 'Text line 2', ...)

print = function (msg, ...)
--	if not naughty then return end
	naughty.notify({ preset = naughty.config.presets.low,
			 title = msg,
			 text = table.concat({...}, '\n') })
end

-- Display all accessible global vaiables.
display_globals = function ()
--	if not naughty then return end
	local result = {}
	for k, v in pairs(_G) do
		result[#result+1] = string.format("%-16s %s", k, tostring(v))
	end
	table.sort(result)
	naughty.notify({ timeout = 0,
			 title = "Globals",
			 text = table.concat(result, '\n'),
			 font = "Monospace 7",})
end
