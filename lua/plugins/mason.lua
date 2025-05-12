
return {
  { "mason-org/mason.nvim", opts = {} },
  {
    "mason-org/mason-lspconfig.nvim",
    init = function()
      vim.g.language_servers = { "lua_ls", "ts_ls" }
      require('mason-lspconfig').setup({
        ensure_installed = vim.g.language_servers
      })
    end,
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig"
    }
  },
  "neovim/nvim-lspconfig",
}

