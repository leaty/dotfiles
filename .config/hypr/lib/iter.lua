local iter = {}

function iter.map(t, f)
	local r = {}

	for k, v in pairs(t) do
		r[k] = f(v, k)
	end

	return r
end

function iter.filter(t, f)
	local r = {}

	for k, v in pairs(t) do
		if f(v, k) then
			table.insert(r, v)
		end
	end

	return r
end

return iter
