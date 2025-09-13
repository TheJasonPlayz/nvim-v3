return {
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim'
		},
		init = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>tf', builtin.find_files, { desc = 'Telescope find files' })
			vim.keymap.set('n', '<leader>tg', builtin.live_grep, { desc = 'Telescope live grep' })
			vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Telescope buffers' })
			vim.keymap.set('n', '<leader>th', builtin.help_tags, { desc = 'Telescope help tags' })

			vim.keymap.set('n', '<C-p>', ":lua require'telescope'.extensions.project.project{}<CR>",
				{ noremap = true, silent = true })
			vim.keymap.set('n', '<C-h>', ":Telescope helpgrep<CR>")
		end
	},
	{
		'nvim-telescope/telescope-project.nvim',
		dependencies = {
			'nvim-telescope/telescope.nvim'
		}
	},
	{
		'catgoose/telescope-helpgrep.nvim',
		dependencies = {
			'nvim-telescope/telescope.nvim'
		}
	}
}
