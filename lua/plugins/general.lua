return {
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		opts = {},
		init = function()
			vim.keymap.set("n", "<leader>tt", ":ToggleTerm<CR>", {
				desc = "Toggle Terminal"
			})
		end
	},
	{
		'Shatur/neovim-session-manager',
		init = function()
			local session_manager = require('session_manager')
			local config = require('session_manager.config')
			vim.g.currentSessionMode = config.AutoloadMode.LastSession

			session_manager.setup({
				autoload_mode = vim.g.currentSessionMode
			})

			local toggle = function()
				if vim.g.currentSessionMode == config.AutoloadMode.LastSession then
					vim.g.currentSessionMode = config.AutoloadMode.Disabled
					print("CurrentSessionMode: Disabled")
				else
					vim.g.currentSessionMode = config.AutoloadMode.LastSession
					print("CurrentSessionMode: LastSession")
				end
				session_manager.setup({ autoload_mode = vim.g.currentSessionMode })
			end
			vim.api.nvim_create_user_command("SaveSessionToggle", toggle, {})
		end
	},
	{
		"nvim-pack/nvim-spectre",
		config = function()
			require('spectre').setup({ is_block_ui_break = true })

			vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
				desc = "Toggle Spectre"
			})
			vim.keymap.set('n', '<leader>sw',
				'<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
					desc = "Search current word"
				})
			vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
				desc = "Search current word"
			})
			vim.keymap.set('n', '<leader>sp',
				'<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
					desc = "Search on current file"
				})
		end,
	},
	-- {
	-- 	"m4xshen/hardtime.nvim",
	-- 	lazy = false,
	-- 	dependencies = { "MunifTanjim/nui.nvim" },
	-- 	opts = {},
	-- },
}
