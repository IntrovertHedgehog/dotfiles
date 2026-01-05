local KEYS = require "keymap"

return {
	{
		"alexghergh/nvim-tmux-navigation",
		lazy = false,
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
		keys = KEYS["which-key.nvim"],
	},
	{
		"stevearc/conform.nvim",
		cmd = { "Format", "ConformInfo" },
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
		cmd = { "ToggleTerm" },
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
		ft = { "tex" },
		config = function()
			require "plugins.vimtex"()
		end,
	},
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		config = function()
			require "plugins.nvim-dap"
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		keys = KEYS["nvim-dap-ui"],
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			require "plugins.nvim-dap-ui"
		end,
	},
	{
		"Weissle/persistent-breakpoints.nvim",
		lazy = true,
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
			options = { theme = "auto" },
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
	{ "rebelot/kanagawa.nvim", lazy = false, priority = 1000, opts = {} },
	{ "scottmckendry/cyberdream.nvim", lazy = false, priority = 1000, opts = { variant = "auto" } },
	{
		"hedyhli/outline.nvim",
		cmd = { "OutlineOpen" },
		opts = function()
			return require "plugins.outline"
		end,
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
	},
	{
		"RRethy/vim-illuminate",
		lazy = false,
	},
}
