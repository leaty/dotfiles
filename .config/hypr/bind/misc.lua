local cmd = require('command')

return {
	-- Hyprland
	['SUPER + SHIFT + R'] = cmd.hyprland.reload,
	['SUPER + SHIFT + ALT + Q'] = hl.dsp.exit(),
	['SUPER + LESS'] = cmd.hyprland.split.toggle,

	-- Modes
	['SUPER + SHIFT + G'] = cmd.mode.default,
	['SUPER + SHIFT + F'] = cmd.mode.focus,

	-- Colors
	['SUPER + SHIFT + ALT + N'] = cmd.color.next,
	['SUPER + SHIFT + ALT + P'] = cmd.color.prev,

	-- Wallpapers
	['SUPER + SHIFT + N'] = cmd.wallpaper.next,
	['SUPER + SHIFT + P'] = cmd.wallpaper.prev,

	-- Keyboard toggle
	['SUPER + ODIAERESIS'] = cmd.keyboard.default,
	['SUPER + PARENLEFT'] = cmd.keyboard.normal,
}
