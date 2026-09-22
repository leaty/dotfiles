function table.merge(...)
	local r = {}
	for _, t in ipairs({...}) do
		if type(t) == 'table' then
			for k, v in pairs(t) do
				r[k] = v
			end
		end
	end

	return r
end

return table
