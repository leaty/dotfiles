local awful = require('awful')

app = {
	terminal = 'urxvt',
	editor = 'urxvt -e vim',
	compositor = '.scripts/compton/compton.sh'
}

-- Autostart
awful.spawn(app.compositor)

return app