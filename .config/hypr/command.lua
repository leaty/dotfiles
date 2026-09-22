local screen_img = '~/cloud/media/image/screen/$(date +%Y/%m/screen.%Y-%m-%d.%H.%M.%S.png)'
local screen_vid = '~/cloud/media/video/screen/$(date +%Y/%m/screen.%Y-%m-%d.%H.%M.%S.mp4)'

return {
	hyprland = {
		reload = 'hyprctl reload',
		exit = hl.dsp.exit(),
		split = {
			toggle = hl.dsp.layout('togglesplit')
		},
	},
	mode = {
		default = 'hyprmode normal',
		focus = 'hyprmode focus',
	},
	player = {
		play = 'mpc toggle',
		next = 'mpc next',
		prev = 'mpc prev',
	},
	audio = {
		up = 'audio up',
		down = 'audio down',
		toggle = 'audio toggle',
		switch = 'audio switch',
	},
	screencap = {
		full = 'screencap full ' .. screen_img,
		select = 'screencap select ' .. screen_img,
		monitor = 'screencap monitor ' .. screen_img,
	},
	screencast = {
		stop = 'screencast stop',
		select = 'screencast select ' .. screen_vid,
		monitor = 'screencast monitor ' .. screen_vid,
	},
	color = {
		next = 'colorswap next',
		prev = 'colorswap prev',
	},
	wallpaper = {
		next = function() hl.exec_cmd(string.format('wallswap -s %s next', hl.get_active_monitor().name)) end,
		prev = function() hl.exec_cmd(string.format('wallswap -s %s prev', hl.get_active_monitor().name)) end,
	},
	keyboard = {
		default = function() hl.config({ input = { kb_options = 'code:bracket' }}) end,
		normal = function() hl.config({ input = { kb_options = '' }}) end,
	},
}
