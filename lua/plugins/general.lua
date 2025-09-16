return {
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		opts = {},
		keys = {
			{ "n", "<leader>tt", ":ToggleTerm<CR>", desc = "Toggle Terminal" },
		},
	},
	{
		"nvim-pack/nvim-spectre",
		opts = {
			is_block_ui_break = true
		},
		keys = {
		  { 'n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', desc = "Toggle Spectre" },
		  { 'n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', desc = "Search current word" },
		  { 'v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', desc = "Search current word" },
		  { 'n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', desc = "Search on current file" },
		},
	},
	-- {
	-- 	"m4xshen/hardtime.nvim",
	-- 	lazy = false,
	-- 	dependencies = { "MunifTanjim/nui.nvim" },
	-- 	opts = {},
	-- },
}
