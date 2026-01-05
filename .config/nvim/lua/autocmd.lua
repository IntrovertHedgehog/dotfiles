local autocmd = vim.api.nvim_create_autocmd

autocmd("WinEnter", {
	callback = function()
		vim.wo.cursorlineopt = "both"
	end,
})

autocmd("WinLeave", {
	callback = function()
		vim.wo.cursorlineopt = "number"
	end,
})

-- Source - https://stackoverflow.com/a
-- Posted by Luiz Menezes, modified by community. See post 'Timeline' for change history
-- Retrieved 2025-12-13, License - CC BY-SA 3.0

local tprint = function(tbl, indent)
	if not indent then
		indent = 0
	end
	local toprint = string.rep(" ", indent) .. "{\r\n"
	indent = indent + 2
	for k, v in pairs(tbl) do
		toprint = toprint .. string.rep(" ", indent)
		if type(k) == "number" then
			toprint = toprint .. "[" .. k .. "] = "
		elseif type(k) == "string" then
			toprint = toprint .. k .. "= "
		end
		if type(v) == "number" then
			toprint = toprint .. v .. ",\r\n"
		elseif type(v) == "string" then
			toprint = toprint .. '"' .. v .. '",\r\n'
		elseif type(v) == "table" then
			toprint = toprint .. tprint(v, indent + 2) .. ",\r\n"
		else
			toprint = toprint .. '"' .. tostring(v) .. '",\r\n'
		end
	end
	toprint = toprint .. string.rep(" ", indent - 2) .. "}"
	return toprint
end

autocmd("ColorScheme", {
	callback = function(ev)
		local scheme = ev.match
		local file = io.open(vim.fn.stdpath "data" .. "/colorscheme", "w")
		if file then
			file:write(scheme)
			file:close()
		end
	end,
})
