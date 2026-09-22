--- lean - performance preset
local config = require('config')

config.general.gaps_in = 0
config.general.gaps_out = 0
config.general.border_size = 1
config.animations.enabled = false
config.decoration.shadow.enabled = false
config.decoration.blur.enabled = false
config.decoration.rounding = 0

hl.config(config)
