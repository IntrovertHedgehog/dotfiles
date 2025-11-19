return {
	save_dir = vim.fn.stdpath "data" .. "/nvim_checkpoints",
	load_breakpoints_event = { "BufReadPost" },
	perf_record = false,
	on_load_breakpoint = nil,
}
