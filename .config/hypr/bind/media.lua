local cmd = require('command')

return {
	-- Player
	['XF86AudioPlay'] = cmd.player.play,
	['XF86AudioNext'] = cmd.player.next,
	['XF86AudioPrev'] = cmd.player.prev,

	-- Audio
	['SUPER + SHIFT + A'] = cmd.audio.switch,
	['XF86AudioRaiseVolume'] = cmd.audio.up,
	['XF86AudioLowerVolume'] = cmd.audio.down,
	['XF86AudioMute'] = cmd.audio.toggle,

	-- Screencap
	['PRINT'] = cmd.screencap.monitor,
	['SHIFT + PRINT'] = cmd.screencap.select,
	['CONTROL + PRINT'] = cmd.screencap.full,

	-- Screencast
	['SUPER + PRINT'] = cmd.screencast.monitor,
	['SUPER + SHIFT + PRINT'] = cmd.screencast.select,
	['SUPER + CONTROL + PRINT'] = cmd.screencast.stop,
}
