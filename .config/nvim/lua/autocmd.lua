local autocmd = vim.api.nvim_create_autocmd

autocmd("WinEnter", {
	callback = function()
		vim.wo.cursorlineopt = "both"
	end,
})

autocmd("WinLeave", {
	callback = function ()
		vim.wo.cursorlineopt = "number"
	end
})
