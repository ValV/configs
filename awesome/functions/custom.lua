-- Get Naughty
local naughty = naughty or require("naughty")

-- Global help/debug table (remember old 'help' as '__help')
local __help = help
help = {}

-- General help() - display all help.* functions
function help.show()
    local result = {}
    for k, v in pairs(help) do
        result[#result + 1] = string.format("%-16s %s", k, tostring(v))
    end
    table.sort(result)
    local text = "Call: help.<name>()\n"
                 .. "Old help table is now __help\n"
                 .. "---\n"
    text = text .. table.concat(result, '\n')
    naughty.notify({ timeout = 0,
                     title = "Help functions:",
                     text = text,
                     font = "Monospace Regular 9"})
end

-- Print function to display messages via 'naughty' plugin:
-- printn ('Title', 'Text line 1', 'Text line 2', ...)
function help.printn(msg, ...)
--    if not naughty then return end
    naughty.notify({ preset = naughty.config.presets.low,
                     title = msg,
                     text = table.concat({...}, '\n') })
end

-- Display all accessible global vaiables.
function help.display_globals()
--    if not naughty then return end
    local result = {}
    for k, v in pairs(_G) do
        result[#result + 1] = string.format("%-16s %s", k, tostring(v))
    end
    table.sort(result)
    naughty.notify({ timeout = 0,
                     title = "Globals",
                     text = table.concat(result, '\n'),
                     font = "Monospace Regular 7"})
end

-- DIsplay known clients' parameters
function help.display_clients(s)
    local clients = client.get(s) or {}
    local result = {string.format("%2s %6s %12s %14s %12.12s %8.8s %74s",
        "s#", "pid", "Xid", "type", "class", "role", "name")}
    local result_format = "%2s %6s %12s %-14s %-12.12s %-8.8s %-.74s"
    for _, c in pairs(clients) do
        result[#result + 1] =
            string.format(result_format,
            c.screen.index, tostring(c.pid) or "n/a", c.window,
            c.type, c.class, c.role or "none", c.name)
    end
    naughty.notify({ timeout = 0,
                     title = "Clients (windows):",
                     text = table.concat(result, '\n'),
                     font = "Monospace Regular 8"})
end

setmetatable(help, {__call = help.show})
