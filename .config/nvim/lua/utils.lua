local M = {}

local D = {
	toggle_float = {
		winid = -1,
		buf = -1,
	},
}

local S = {
	toggle_float = {
		win_opts = {
			relative = "editor",
			width = function()
				return math.floor(vim.api.nvim_list_uis()[1].width * 0.8)
			end,
			height = function()
				return math.floor(vim.api.nvim_list_uis()[1].height * 0.8)
			end,
			col = function()
				return math.floor(vim.api.nvim_list_uis()[1].width * 0.1)
			end,
			row = function()
				return math.floor(vim.api.nvim_list_uis()[1].height * 0.1)
			end,
		},
	},
}

function setting_resolve(tbl)
	local res = {}
	for k, v in pairs(tbl) do
		if type(v) == "function" then
			v = v()
		elseif type(v) == "table" then
			v = setting_resolve(v)
		end
		res[k] = v
	end
	return res
end

M.toggle_float = function()
	local data = D.toggle_float
	local settings = setting_resolve(S.toggle_float)
	vim.g.logging = settings
	if vim.api.nvim_win_is_valid(data.winid) then
		if vim.api.nvim_buf_is_valid(data.buf) then
			data.buf = 0
		end
		data.winid = vim.api.nvim_open_win(data.buf, true, settings.win_opts)
	else
		data.buf = vim.api.nvim_win_get_buf(data.winid)
		vim.api.nvim_win_close(data.winid, false)
		data.winid = -1
	end
end

return M
