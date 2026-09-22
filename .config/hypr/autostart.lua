local monitor = require('monitor')
local workspace = require('workspace')
local app = require('app')
local svc = require('service')
local service = function(s) return 'systemctl --user start ' .. s end

return {
	-- Apps
	app.lod,
	app.nextcloud,
	{ app.terminal, { workspace = workspace.term.id } },
	{ app.code, { workspace = workspace.code.id } },
	{ app.browser, { workspace = workspace.web.id } },
	{ app.discord, { workspace = workspace.chat.id } },
	{ app.steam, { workspace = workspace.chat.id } },
	{ app.music, { workspace = workspace.music.id } },
	{ app.mail('leaty'), { workspace = workspace.mail.id } },
	{ app.mail('work'), { workspace = workspace.mail.id } },
	{ app.wallpaper(monitor.main.output), { reload = true } },
	{ app.wallpaper(monitor.right.output), { reload = true } },

	-- Services
	service(svc.crypto),
	service(svc.rkeepd),
	service(svc.paction),
}
