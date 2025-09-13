require('config.lazy')

require("lazy").setup("plugins")
require("lazy").setup("plugins.langs")

vim.o.clipboard = 'unnamedplus'
vim.o.number = true

vim.keymap.set('n', '<leader>ee', function()
	vim.cmd("cd ~/AppData/Local/nvim")
	require('telescope.builtin').find_files()
end)
