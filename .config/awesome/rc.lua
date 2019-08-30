pcall(require, "luarocks.loader")
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.autofocus")
require("awful.hotkeys_popup.keys")


-- Load theme
beautiful.init('.config/awesome/theme/theme.lua')

-- Load basic stuff
require('awesome.error')
require('awesome.layout')
require('awesome.rules')
require('awesome.menu')
require('awesome.screen')
require('awesome.window')
require('awesome.bind.global')
require('awesome.bind.client')
require('awesome.bind.mouse')


--pwd = '.config/awesome'

-- Config files
--dofile(pwd..'/widgets/mopidy.lua')
--local mympd = lain.widget.mpd()

--[[local lain = require('lain')
local mem = lain.widget.mem {
    settings = function()
        widget:set_markup("mem " .. mem_now.perc)
    end
}
local cpu = lain.widget.cpu {
    settings = function()
        widget:set_markup("Cpu " .. cpu_now.usage)
    end
}--]]



