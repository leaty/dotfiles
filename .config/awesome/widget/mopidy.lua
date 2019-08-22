local inspect = require('inspect')
local gears = require('gears')
local wibox = require('wibox')
local mpd = require('mpd')
local mpc = mpd.new({'localhost', 6600})

-- Widget
local widget = wibox.widget {
	{
		id = 'mopidy',
		text = 'Offline',
		widget = wibox.widget.textbox
	},
	layout = wibox.layout.stack,
	set_song = function(self, song)
		if song.title then
			self.mopidy.text = song.artist..' - '..song.title
		end
	end
}

-- Timer
gears.timer {
	timeout = 0.1,
	call_now = true,
	autostart = true,
	callback = function()
		widget.song = mpc:send('currentsong')
	end
}

return widget