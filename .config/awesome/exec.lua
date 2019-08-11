local awful = require("awful")

local execs = {
	"~/.scripts/background/vidbg.sh"
}

for _,v in pairs(execs) do
	awful.util.spawn_with_shell(v)
end