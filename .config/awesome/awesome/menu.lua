local app = require('app')
local awful = require('awful')
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")

--require("awful.autofocus")
require("awful.hotkeys_popup.keys")

-- {{{ Menu
-- Create a launcher widget and a main menu
menu = awful.menu({
	items = {
		{
			"awesome",
			{
				 { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
				 { "manual", app.terminal .. " -e man awesome" },
				 { "edit config", app.editor .. " " .. awesome.conffile },
				 { "restart", awesome.restart },
				 { "quit", function() awesome.quit() end },
			},
			beautiful.awesome_icon
		},
		{
			"open terminal",
			app.terminal
		}
	}
})

launcher = awful.widget.launcher({
	image = beautiful.awesome_icon,
	menu = menu
})

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}