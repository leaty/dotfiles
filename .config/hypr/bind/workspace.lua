local map = require('lib.iter').map
local focus = function(w) return hl.dsp.focus { workspace = w } end
local move = function(w) return hl.dsp.window.move { workspace = w, follow = false } end
local named = {} for _, w in pairs(require('workspace')) do named[w.key] = w.id end
local indexed = {} for i = 1, 10 do indexed[tostring(i % 10)] = i + 100 end

return {
	['SUPER + mouse_up'] = hl.dsp.focus { workspace = 'e-1' },
	['SUPER + mouse_down'] = hl.dsp.focus { workspace = 'e+1' },
	['ALT + TAB'] = hl.dsp.focus { workspace = 'previous' },
	['ALT'] = map(named, focus),
	['ALT + SHIFT'] = map(named, move),
	['SUPER'] = map(indexed, focus),
	['SUPER + SHIFT'] = map(indexed, move),
}
