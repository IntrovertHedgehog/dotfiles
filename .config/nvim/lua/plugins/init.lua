return {
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
			"TmuxNavigatorProcessList",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "v0.1.9",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Telescope",
		opts = function()
			return require "plugins.telescope"
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = function()
			return require "plugins.nvimtree"
		end,
		config = function(_, opts)
			require("nvim-tree").setup(opts)
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show { global = false }
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"stevearc/conform.nvim",
		cmd = { "Format" },
		opts = function()
			return require "plugins.conform"
		end,
		config = function(_, opts)
			require("conform").setup(opts)
			require "plugins.cmd.conform"
		end,
		dependencies = { "mason-org/mason.nvim" },
	},
	-- git stuff
	{
		"lewis6991/gitsigns.nvim",
		event = "BufNew",
		opts = {},
	},

	-- lsp stuff
	{
		"mason-org/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUpdate" },
		opts = {},
	},

	{
		"neovim/nvim-lspconfig",
		event = "FileType",
		config = function()
			require "plugins.lspconfig"
		end,
		dependencies = { "mason-org/mason.nvim" },
	},

	-- load luasnips + cmp related in insert mode only
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				-- snippet plugin
				"L3MON4D3/LuaSnip",
				dependencies = "rafamadriz/friendly-snippets",
				opts = { history = true, updateevents = "TextChanged,TextChangedI" },
				config = function(_, opts)
					require("luasnip").config.set_config(opts)
					require "plugins.luasnip"
				end,
			},

			-- autopairing of (){}[] etc
			{
				"windwp/nvim-autopairs",
				opts = {
					fast_wrap = {},
					disable_filetype = { "TelescopePrompt", "vim" },
				},
				config = function(_, opts)
					require("nvim-autopairs").setup(opts)

					-- setup cmp for autopairs
					local cmp_autopairs = require "nvim-autopairs.completion.cmp"
					require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
				end,
			},

			-- cmp sources plugins
			{
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"https://codeberg.org/FelipeLema/cmp-async-path.git",
			},
		},
		opts = function()
			return require "plugins.cmp"
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		opts = function()
			return require "plugins.treesitter"
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",

		keys = { "<A-i>" },
		opts = function()
			return require "plugins.toggleterm"
		end,
	},
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		opts = function()
			return require "plugins.lspsaga"
		end,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require "plugins.harpoon"
		end,
		-- not lazy cuz on loading file the marked
		-- files marked from last session is saved
		lazy = false,
	},
	{
		"tpope/vim-fugitive",
		branch = "master",
		lazy = true,
		cmd = {
			"G",
			"Git",
			"Gdiffsplit",
			"Gvdiffsplit",
			"Gedit",
			"Gread",
			"Gwrite",
			"Grep",
			"GMove",
			"GDelete",
			"GBrowse",
		},
	},
	{
		"lervag/vimtex",
		lazy = false, -- VimTex is already lazy loaded mostly
		config = function()
			require "plugins.vimtex"()
		end,
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			require "plugins.nvim-dap"
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			require "plugins.nvim-dap-ui"
		end,
	},
	{
		"Weissle/persistent-breakpoints.nvim",
		dependencies = { "mfussenegger/nvim-dap" },
		opts = function()
			return require "plugins.perf_breakpoints"
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "TodoQuickFix", "TodoLocList", "TodoTelescope" },
		config = function()
			require("todo-comments").setup()
		end,
	},
	{ "kevinhwang91/nvim-bqf", lazy = false },
	{
		-- TODO: with git sections
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = { theme = "tokyonight" },
		},
	},
	{
		"AlexvZyl/nordic.nvim",
		priority = 1000,
		lazy = false,
		opts = {},
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"hedyhli/outline.nvim",
		cmd = {"OutlineOpen"},
		opts = {}
	},
}
