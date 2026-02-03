vim.lsp.config("lua_ls", {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if
				path ~= vim.fn.stdpath "config"
				and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
			then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				version = "LuaJIT",
				path = {
					"lua/?.lua",
					"lua/?/init.lua",
				},
			},
			workspace = {
				checkThirdParty = false,
				library = vim.api.nvim_get_runtime_file("", true),
			},
		})
	end,
	settings = {
		Lua = {},
	},
})

vim.lsp.config("asm-lsp", {
	cmd = { "asm-lsp" },
	filetypes = { "asm", "vmasm" },
	root_markers = { ".asm-lsp.toml", ".git" },
})

vim.lsp.enable "lua_ls"
vim.lsp.enable "clangd"
vim.lsp.enable "asm-lsp"
vim.lsp.enable "bashls"
vim.lsp.enable "basedpyright"
