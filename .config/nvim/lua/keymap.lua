local map = vim.keymap.set

map("n", "<esc>", "<cmd>nohl<CR>", { desc = "no highlight" })
map({ "v", "n" }, "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map({ "v", "n" }, "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
map("t", "<esc>", "<C-\\><C-N>", { desc = "Escape terminal mode" })
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Escape terminal mode" })

-- insert nav
map("i", "<C-l>", "<Right>", { desc = "right" })
map("i", "<C-h>", "<Left>", { desc = "left" })
map("i", "<C-j>", "<Down>", { desc = "down" })
map("i", "<C-k>", "<Up>", { desc = "up" })

-- emacs
map({ "i", "c" }, "<A-f>", "<C-Right>", { desc = "word next" })
map({ "i", "c" }, "<A-b>", "<C-Left>", { desc = "word back" })
map({ "i", "c" }, "<C-f>", "<Right>", { desc = "right" })
map({ "i", "c" }, "<C-b>", "<Left>", { desc = "left" })
map({ "i", "c" }, "<C-a>", "<Home>", { desc = "start of line" })
map({ "i", "c" }, "<C-e>", "<End>", { desc = "end of line" })
map({ "i", "c" }, "<A-j>", "<Down>", { desc = "next hist cmd cxt aware" })
map({ "i", "c" }, "<A-k>", "<Up>", { desc = "prev hist cmd cxt aware" })
map({ "i", "c" }, "<C-k>", "<C-w>", { desc = "<C-BS> and <C-H> to kill word" })

--tmux nav
map({ "n" }, "<C-h>", function()
	require("nvim-tmux-navigation").NvimTmuxNavigateLeft()
end, {})
map({ "n" }, "<C-j>", function()
	require("nvim-tmux-navigation").NvimTmuxNavigateDown()
end, {})
map({ "n" }, "<C-k>", function()
	require("nvim-tmux-navigation").NvimTmuxNavigateUp()
end, {})
map({ "n" }, "<C-l>", function()
	require("nvim-tmux-navigation").NvimTmuxNavigateRight()
end, {})

-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "telescope find files" })
map(
	"n",
	"<leader>fa",
	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "telescope find all" }
)
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })

-- nvtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "file tree" })

-- conform
map("n", "<leader>fm", "<cmd>Format<CR>", { desc = "format buffer" })

-- lsp
map("n", "gD", function()
	vim.lsp.buf.declaration()
end, { desc = "LSP declaration" })

map("n", "gd", function()
	vim.lsp.buf.definition()
end, { desc = "LSP definition" })

map("n", "K", function()
	vim.lsp.buf.hover()
end, { desc = "LSP hover" })

map("n", "gi", function()
	vim.lsp.buf.implementation()
end, { desc = "LSP implementation" })

map("n", "<leader>ls", function()
	vim.lsp.buf.signature_help()
end, { desc = "LSP signature help" })

map("n", "<leader>D", function()
	vim.lsp.buf.type_definition()
end, { desc = "LSP definition type" })

map("n", "<leader>ra", function()
	vim.lsp.buf.rename()
end, { desc = "LSP rename" })

map("n", "<leader>ca", function()
	vim.cmd [[Lspsaga code_action]]
end, { desc = "LSP code action" })

map("n", "<leader>pd", function()
	vim.cmd [[Lspsaga peek_definition]]
end, { desc = "LSP code action" })

map("n", "gr", function()
	vim.lsp.buf.references()
end, { desc = "LSP references" })

map("n", "<leader>lf", function()
	vim.diagnostic.open_float()
end, { desc = "Floating diagnostic" })

map("n", "<leader>lr", function()
	vim.cmd [[Lspsaga finder]]
end, { desc = "Show references" })

map("n", "<leader>lc", function()
	vim.cmd [[Lspsaga incoming_calls]]
end, { desc = "Incoming calls" })

map("n", "<leader>lC", function()
	vim.cmd [[Lspsaga outgoing_calls]]
end, { desc = "Outgoing calls" })

map("n", "[d", function()
	vim.diagnostic.jump { count = -1, float = true }
end, { desc = "Goto prev" })

map("n", "]d", function()
	vim.diagnostic.jump { count = 1, float = true }
end, { desc = "Goto next" })

map("n", "<leader>q", function()
	vim.diagnostic.setloclist()
end, { desc = "Diagnostic setloclist" })

map("n", "<leader>wa", function()
	vim.lsp.buf.add_workspace_folder()
end, { desc = "Add workspace folder" })

map("n", "<leader>wr", function()
	vim.lsp.buf.remove_workspace_folder()
end, { desc = "Remove workspace folder" })

map("n", "<leader>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "List workspace folders" })

map("n", "<leader>o", function()
	local outline = require "outline"
	if outline.is_open() then
		vim.cmd [[OutlineFocus]]
	else
		vim.cmd [[OutlineOpen]]
	end
end, { desc = "Toggle Outline" })

-- trouble.nvim
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
map(
	"n",
	"<leader>cl",
	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	{ desc = "LSP Definitions / references / ... (Trouble)" }
)
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

-- harpoon
map("n", "<leader>a", function()
	require("harpoon"):list():add()
end, { desc = "Add file to harpoon" })
map("n", "<leader>e", function()
	require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
end, { desc = "Explore files added to harpoon" })

map("n", "<A-1>", function()
	require("harpoon"):list():select(1)
end)
map("n", "<A-2>", function()
	require("harpoon"):list():select(2)
end)
map("n", "<A-3>", function()
	require("harpoon"):list():select(3)
end)
map("n", "<A-4>", function()
	require("harpoon"):list():select(4)
end)
map("n", "<A-5>", function()
	require("harpoon"):list():select(5)
end)
map("n", "<A-6>", function()
	require("harpoon"):list():select(6)
end)
map("n", "<A-7>", function()
	require("harpoon"):list():select(7)
end)
map("n", "<A-8>", function()
	require("harpoon"):list():select(8)
end)
map("n", "<A-9>", function()
	require("harpoon"):list():select(9)
end)
map("n", "<A-0>", function()
	require("harpoon"):list():select(10)
end)

-- Toggle previous & next buffers stored within Harpoon list
map("n", "<C-S-P>", function()
	require("harpoon"):list():prev()
end)
map("n", "<C-S-N>", function()
	require("harpoon"):list():next()
end)

-- dap
map("n", "<F5>", function()
	require("dap").continue()
end, { desc = "" })
map("n", "<F9>", function()
	require("dap").step_over()
end, { desc = "" })
map("n", "<F10>", function()
	require("dap").step_into()
end, { desc = "" })
map("n", "<F11>", function()
	require("dap").step_out()
end, { desc = "" })
map("n", "<F12>", function()
	require("dap").step_back()
end, { desc = "" })
map("n", "<leader>dB", function()
	require("dap").list_breakpoints()
end, { desc = "" })
map("n", "<leader>dl", function()
	require("dap").run_last()
end, { desc = "" })
map("n", "<leader>dr", function()
	require("dap").restart()
end, { desc = "" })
map("n", "<leader>dt", function()
	require("dap").terminate()
end, { desc = "" })
map({ "n", "v" }, "<Leader>dh", function()
	require("dap.ui.widgets").hover()
end, { desc = "" })

-- dap ui -> shipped to plugins/init cuz I'm lazy
-- map("n", "<leader>do", function()
-- 	require("dapui").toggle()
-- end)

-- list_breakpoints
map("n", "<leader>db", function()
	require("persistent-breakpoints.api").toggle_breakpoint()
end, { desc = "toogle breakpoint" })
map("n", "<leader>dp", function()
	require("persistent-breakpoints.api").set_log_point()
end, { desc = "set log point" })
map("n", "<leader>dc", function()
	require("persistent-breakpoints.api").clear_all_breakpoints()
end, { desc = "clear breakpoints" })

-- tab mgmnt
map("n", "<leader>tt", "<cmd>tabnew<cr>", { desc = "new tab" })
map("n", "<leader>tn", "<cmd>tabnext<cr>", { desc = "next tab" })
map("n", "<leader>tp", "<cmd>tabprevious<cr>", { desc = "prev tab" })
map("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "close tab" })

-- toggleterm
map({ "n", "i", "t" }, "<A-h>", function()
	return "<cmd>" .. vim.v.count .. "ToggleTerm direction=horizontal<CR>"
end, { desc = "toggle horizontal term", expr = true })
map({ "n", "i", "t" }, "<A-i>", function()
	return "<cmd>" .. vim.v.count .. "ToggleTerm direction=float<CR>"
end, { desc = "toggle float term", expr = true })

-- utils
map({"n", "i", "c"}, "<M-->", require("utils").toggle_float, {desc = "toggle float win"})

-- lazy keys that requires definition
local KEYS = {
	["nvim-dap-ui"] = { {
		"<leader>do",
		function()
			require("dapui").toggle()
		end,
	} },

	["which-key.nvim"] = {
		{
			"<leader>?",
			function()
				require("which-key").show { global = false }
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}

return KEYS

