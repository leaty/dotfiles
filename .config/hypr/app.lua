local shell = function(cmd) return string.format(os.getenv('TERMINAL') .. ' -e bash -ci "%s"', cmd) end
local mail = function(account) return string.format(shell('MUTT_ACCOUNT=%s neomutt'), account) end
local rkeep = function(session) return 'rkeep ' .. session end
local wallpaper = function(monitor) return string.format('wallswap -s %s run', monitor) end
local browser = 'firefox'

return {
	terminal = 'tt',
	discord = 'sleep 2; vesktop',
	steam = 'steam-native -silent',
	menu = 'rofi -show drun',
	nextcloud = 'sleep 5 && nextcloud',
	lod = 'lod',
	wgui = 'wgui',
	code = shell('code'),
	music = shell('ncmpcpp'),
	mail = mail,
	rkeep = rkeep,
	wallpaper = wallpaper,
	browser = browser,
	browser_ai = browser .. ' --new-window 127.0.0.1:8080',
	browser_private = browser .. ' --private-window 127.0.0.1/private.html',
}
