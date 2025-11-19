return {
	defaults = {
		mappings = {
			i = {
				["<A-f>"] = false,
				["<C-f>"] = false
			},
		},
	},
	pickers = {
		buffers = {
			mappings = {
				n = {
					["dd"] = require("telescope.actions").delete_buffer,
				},
				i = {
					["C-d"] = require("telescope.actions").delete_buffer,
				},
			},
		},
	},
}
