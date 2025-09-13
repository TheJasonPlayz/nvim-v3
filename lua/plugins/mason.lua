return {
	{ "mason-org/mason.nvim", opts = {} },
	{
		"mason-org/mason-lspconfig.nvim",
		init = function()
			vim.g.language_servers = { "pyright", "lua_ls" }
			require('mason-lspconfig').setup({
				ensure_installed = vim.g.language_servers,
				automatic_enable = false
			})

			for _, serv in ipairs(vim.g.language_servers) do
				vim.lsp.enable(serv, true)
			end
		end,
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig"
		}
	},
	"neovim/nvim-lspconfig",
}
