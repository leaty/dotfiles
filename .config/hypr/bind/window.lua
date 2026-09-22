return {
	-- Focus
	['SUPER + H'] = hl.dsp.focus { direction = 'left' },
	['SUPER + J'] = hl.dsp.focus { direction = 'down' },
	['SUPER + K'] = hl.dsp.focus { direction = 'up' },
	['SUPER + L'] = hl.dsp.focus { direction = 'right' },

	-- Move
	['SUPER + SHIFT + H'] = hl.dsp.window.move { direction = 'left' },
	['SUPER + SHIFT + J'] = hl.dsp.window.move { direction = 'down' },
	['SUPER + SHIFT + K'] = hl.dsp.window.move { direction = 'up' },
	['SUPER + SHIFT + L'] = hl.dsp.window.move { direction = 'right' },

	-- State
	['SUPER + F'] = hl.dsp.window.fullscreen(),
	['SUPER + SHIFT + Q'] = hl.dsp.window.kill(),
	['SUPER + SHIFT + SPACE'] = hl.dsp.window.float(),

	-- Mouse
	['SUPER + mouse:272'] = { hl.dsp.window.drag(), { mouse = true } },
	['SUPER + mouse:273'] = { hl.dsp.window.resize(), { mouse = true } },
}
