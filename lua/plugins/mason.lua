return {
	{ "mason-org/mason.nvim", opts = {} },
	{
		"mason-org/mason-lspconfig.nvim",
		init = function()
			vim.g.language_servers = { "lua_ls", "denols", "ts_ls", "pyright" }
			require('mason-lspconfig').setup({
				ensure_installed = vim.g.language_servers,
				automatic_enable = false
			})

			for _, serv in ipairs(vim.g.language_servers) do
				if (serv == "ts_ls") then
					vim.lsp.enable(serv, true)
					vim.lsp.config(serv, {
						root_dir = function(bufnr, on_dir)
							local denofile = vim.uv.fs_stat(vim.fn.cwd() .. "/deno.jsonc")
							if not denofile then
								on_dir(vim.fn.getcwd())
							else
								print("Running DenoLS instead of TS_LS")
							end
						end
					})
				else
					vim.lsp.enable(serv, true)
				end
			end
		end,
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig"
		}
	},
	"neovim/nvim-lspconfig",
}
