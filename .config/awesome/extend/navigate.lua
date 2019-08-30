local awful = require('awful')
local gears = require('gears')
local inspect = require('inspect')
local navigate = {
	swap = {},
	focus = {}
}

-- @todo fix inverted
navigate.swap.direction = function(dir, inv)
	awful.client.swap.global_bydirection(dir)
end

navigate.focus.direction = function(dir, inv)
	prev = client.focus
	awful.client.focus.global_bydirection(dir)

	-- Last client, go to -1 in the inverted direction
	if prev == client.focus then
		while true do
			invprev = client.focus
			awful.client.focus.global_bydirection(inv)
			invcurr = client.focus

			-- There is nothing in the inverted direction, cancel
			if invcurr == prev then break end
			-- Ooo we've fully navigated in inverted direction, done!
			if invcurr == invprev then break end
		end
	end

	-- For floating support
	if client.focus then client.focus:raise() end
end

navigate.swap.up = function() navigate.swap.direction('up', 'down') end
navigate.swap.down = function() navigate.swap.direction('down', 'up') end
navigate.swap.left = function() navigate.swap.direction('left', 'right') end
navigate.swap.right = function() navigate.swap.direction('right', 'left') end
navigate.focus.up = function() navigate.focus.direction('up', 'down') end
navigate.focus.down = function() navigate.focus.direction('down', 'up') end
navigate.focus.left = function() navigate.focus.direction('left', 'right') end
navigate.focus.right = function() navigate.focus.direction('right', 'left') end

return navigate