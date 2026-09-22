local app = require('app')

return {
	['SUPER + RETURN'] = app.terminal,
	['ALT + RETURN'] = app.browser,
	['ALT + SHIFT + RETURN'] = app.browser_private,
	['ALT + SHIFT + SUPER + RETURN'] = app.browser_ai,
	['SUPER + D'] = app.menu,
	['SUPER + V'] = app.wgui,
	['SUPER + P'] = app.rkeep('keys'),
	['SUPER + O'] = app.rkeep('work'),
}
