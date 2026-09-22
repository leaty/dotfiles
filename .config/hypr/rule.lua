local window = require('window')
local workspace = require('workspace')

return {
	window = {
		-- Fade
		{ match = { tag = 'fade' }, opacity = 0.9, name = 'fade'},
		{ match = window.firefox, tag = '+fade' },
		{ match = window.lutris, tag = '+fade' },
		{ match = window.vesktop, tag = '+fade' },
		{ match = window.mumble, tag = '+fade' },
		{ match = window.steam, tag = '+fade' },
		{ match = window.element, tag = '+fade' },
		{ match = window.ledger, tag = '+fade' },
		{ match = window.telegram, tag = '+fade' },
		{ match = window.nautilus, tag = '+fade' },
		{ match = window.monitor, tag = '+fade' },

		-- Float
		{ match = window.steam, float = true },

		-- Tile
		{ match = window.steam_popup, tile = true },

		-- Shadow
		{ match = window.ueberzugpp, no_shadow = true },

		-- Assign 
		{ match = window.vesktop, workspace = workspace.chat.id .. ' silent' },

		-- Overrides
		{ match = window.all, suppress_event = 'maximize' },
		{ match = window.twitch, opacity = 1.0 },
		{ match = window.youtube, opacity = 1.0 },
		{ match = { float = true }, opacity = '0.9 override' },
		{ match = { fullscreen = true }, opacity = '1.0 override' },
	},

	layer = {
		{ match = { namespace = 'rofi' }, blur = true },
	}
}
