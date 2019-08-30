local awful = require('awful')
local gears = require('gears')
local wibox = require("wibox")
local beautiful = require("beautiful")
local inspect = require('inspect')
local taglist_buttons = require('awesome.tag')
local tasklist_buttons = require('awesome.task')
local wallpaper = require('awesome.wallpaper')
local lain  = require("lain")
local markup = lain.util.markup

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", wallpaper.set)

-- Render screens
awful.screen.connect_for_each_screen(
	function(s)
		-- Wallpaper
		wallpaper.set(s)

		-- Each screen has its own tag table.
		for i = 1, #beautiful.tagnames do
			tag = awful.tag.add(beautiful.tagnames[i], {
				icon = nil,
				layout = awful.layout.layouts[1],
				master_fill_policy = "master_width_factor",
				gap_single_client = true,
				gap = 15,
				screen = s,
				selected = (i == 1 and true or false),
				bg_color = beautiful.tagcolors_bg[i],
				bg_focus = beautiful.tagcolors_bg_focus[i]
			})
		end

		--awful.tag(beautiful.tagnames, s, awful.layout.layouts[1])

		-- Create a promptbox for each screen
		s.mypromptbox = awful.widget.prompt()
		-- Create an imagebox widget which will contain an icon indicating which layout we're using.
		-- We need one layoutbox per screen.
		s.mylayoutbox = awful.widget.layoutbox(s)
		s.mylayoutbox:buttons(gears.table.join(
			awful.button({ }, 1, function () awful.layout.inc( 1) end),
			awful.button({ }, 3, function () awful.layout.inc(-1) end),
			awful.button({ }, 4, function () awful.layout.inc( 1) end),
			awful.button({ }, 5, function () awful.layout.inc(-1) end)))

		-- Create a taglist widget
		s.mytaglist = awful.widget.taglist {
			screen  = s,
			filter  = awful.widget.taglist.filter.all,
			buttons = taglist_buttons,
			widget_template = {
				id = 'background_role',
				widget = wibox.container.background,
				{
					forced_width = 100,
					forced_height = 100,
					layout = wibox.container.margin
				},
				update_callback = function(self, c3, index, objects) --luacheck: no unused args
					file = io.open("teststuff", "w")
					io.output(file)
					io.write(inspect(self:get_children_by_id('background_role')[1].set_forced_height(self)))
					io.close(file)
            		--print(inspect(self:get_children_by_id('background_role')[1].get_forced_width()))
            		--self:get_children_by_id('background_role')[1].markup = '<b> '..index..' </b>'
        		end,
				--[[id = 'background_role',
				widget = wibox.container.background,
				-- Add support for hover colors and an index label
				create_callback = function(self, c3, index, objects) --luacheck: no unused args
					self:get_children_by_id('index_role')[1].markup = '<b> '..c3.index..' </b>'
					self:connect_signal('mouse::enter', function()
						if self.bg ~= '#ff0000' then
							self.backup     = self.bg
							self.has_backup = true
						end
						self.bg = '#ff0000'
					end)
					self:connect_signal('mouse::leave', function()
						if self.has_backup then self.bg = self.backup end
					end)
				end,
				update_callback = function(self, c3, index, objects) --luacheck: no unused args
					self:get_children_by_id('index_role')[1].markup = '<b> '..c3.index..' </b>'
				end,]]
			},


			--[[widget_template = {
				id = 'background_role',
				widget = wibox.container.background,
				{
					left  = 50,
					right = 50,
					layout = wibox.container.margin
				},
				widget = wibox.container.place,
				{
					content_fill_horizontal = true,
					layout = wibox.container.place
				}
			},--]]
		}
		--s.mytaglist:struts({top = 0, bottom = 0, left = 0, right = 0})

		-- Create the wibox
		s.mywibox = awful.wibar({
			position = "top",
			screen = s,
			--width = beautiful.wibar_width,
			height = beautiful.wibar_height,
		})
		-- @todo use proper struts
		--s.mywibox:struts({top = 0, bottom = 0, left = 0, right = 0})
		s.mywiboxright = awful.wibar({
			position = "top",
			screen = s,
			width = beautiful.wibar_right_width,
			height = beautiful.wibar_right_height
		})

		-- Align wiboxes
		awful.placement.top_left(s.mywibox)
		awful.placement.top_right(s.mywiboxright)

		-- Add widgets to the wibox
		s.mywibox:setup {
			layout = wibox.layout.fixed.horizontal,
			--[[{ -- Left widgets
				layout = wibox.layout.flex.horizontal,
				-- mylauncher,
				--require('widget/mopidy')
				--s.mypromptbox,
			},]]
			nil,
			{
				layout = wibox.layout.fixed.horizontal,
				s.mytaglist,
			},
			nil,
			-- s.mytasklist, -- Middle widget
			--[[{ -- Right widgets
				layout = wibox.layout.fixed.horizontal,
				--awful.widget.keyboardlayout(),
				--wibox.widget.systray(),
				--wibox.widget.textclock(),
				--s.mylayoutbox
			},]]
		}
		s.mywiboxright:setup {
			{
				layout = wibox.layout.align.horizontal,
				nil,
				nil,
				-- s.mytasklist, -- Middle widget
				{ -- Right widgets
					layout = wibox.layout.fixed.horizontal,
					--awful.widget.keyboardlayout(),
					--wibox.widget.systray(),
					wibox.widget.textclock(beautiful.textclock),
					--s.mylayoutbox
				},
			},
			right = 10,
			widget = wibox.container.margin,

		}
	end
)
