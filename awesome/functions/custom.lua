-- Lua
local naughty = naughty or require("naughty")

-- Global help/debug table (remember old 'help' as '__help')
local __help = help
help = {}

-- Print function to display messages via 'naughty' plugin:
-- printn ('Title', 'Text line 1', 'Text line 2', ...)
function help.printn(msg, ...)
--	if not naughty then return end
	naughty.notify({ preset = naughty.config.presets.low,
			 title = msg,
			 text = table.concat({...}, '\n') })
end

-- Display all accessible global vaiables.
function help.display_globals()
--	if not naughty then return end
	local result = {}
	for k, v in pairs(_G) do
		result[#result + 1] = string.format("%-16s %s", k, tostring(v))
	end
	table.sort(result)
	naughty.notify({ timeout = 0,
			 title = "Globals",
			 text = table.concat(result, '\n'),
			 font = "Monospace 7",})
end

-- General help() - display all help.* functions
function help.show()
	local result = {}
	for k, v in pairs(help) do
		result[#result + 1] = string.format("%-16s %s", k, tostring(v))
	end
	table.sort(result)
	local text = "Call: help.<name>()\n---\n"
	text = text .. table.concat(result, '\n')
	naughty.notify({ timeout = 0, title = "Help functions:",
			 text = text, font = "Monospace 9"})
end

setmetatable(help, {__call = help.show})
