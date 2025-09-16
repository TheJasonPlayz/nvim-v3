return {
	{
		"saghen/blink.cmp",
		dependencies = { 'rafamadriz/friendly-snippets' },
		opts = {
			keymap = { preset = 'default' },
			appearance = {
				nerd_font_variant = 'mono'
			},
			completion = { documentation = { auto_show = false } },
			sources = { default = { 'lsp', 'path', 'snippets', 'buffer' }, },
			fuzzy = { implementation = 'prefer_rust_with_warning' }
		},
		opts_extend = { 'sources.default' }
	},
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
		}
	},
	{ 'm4xshen/autoclose.nvim', opts = {} },
	{
		'HiPhish/rainbow-delimiters.nvim',
		init = function()
			require('rainbow-delimiters.setup').setup({})
		end
	},
	{
		'stevearc/conform.nvim',
		opts = {
			formatters_by_ft = {
				python = { "black" }
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "typescript" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	},
}
