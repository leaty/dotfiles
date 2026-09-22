local iter = require("lib.iter")
local map = iter.map
local filter = iter.filter
local hypr = {}

function hypr.setup(spec)
	hl.config(spec.config)

	map(spec.monitors, hl.monitor)
	map(spec.workspaces, hypr.workspace)
	map(spec.binds, hypr.bind)
	map(spec.rules.window, hl.window_rule)
	map(spec.rules.layer, hl.layer_rule)
	map(spec.curves, hypr.curve)
	map(spec.animations, hypr.animate)

	hypr.reload(filter(spec.apps, hypr.reloadable))
	hypr.start(spec.apps)
end

function hypr.curve(c, k)
	hl.curve(k, c)
end

function hypr.animate(a, k)
	a.leaf = k
	a.enabled = true
	hl.animation(a)
end

function hypr.workspace(w, k)
	if type(w) == 'table' then
		hl.workspace_rule({
			workspace = w.id,
			monitor = w.monitor,
			default = w.default,
			default_name = k,
		})
	end
end

function hypr.bind(b, k)
	local o = {}

	-- Dispatcher with options
	if type(b) == 'table' and type(b[1]) == 'userdata' then
		b, o = b[1], b[2]
	-- Nested binds (recurse)
	elseif type(b) == 'table' then
		return map(b, function(bb, kk) hypr.bind(bb, k .. ' + ' .. kk) end)
	-- Commands
	elseif type(b) == 'string' then
		b = hl.dsp.exec_cmd(b)
	end

	hl.bind(k, b, o)
end

function hypr.start(apps)
	hl.on('hyprland.start', function()
		map(apps, function(a)
			local o = {}
			if type(a) == 'table' then
				a, o = a[1], a[2]
			end

			-- Force silent for workspace-specific apps
			if o.workspace ~= nil then
				o.workspace = o.workspace .. ' silent'
			end

			-- Remove reload option (not applicable here)
			if o.reload ~= nil then
				o.reload = nil
			end

			hl.exec_cmd(a, o)
		end)
	end)
end

function hypr.reload(apps)
	hl.on('config.reloaded', function()
		map(apps, function(a)
			hl.exec_cmd(a[1])
		end)
	end)
end

function hypr.reloadable(app)
	return type(app) == 'table' and app[2].reload == true
end

return hypr
