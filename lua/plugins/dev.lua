return {
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
    {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require('cmp')
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0,       })
      table.insert(opts.sources, {
	name = "nvim_lsp"
      })
      table.insert(opts.sources, {
        name = "luasnip"
      })
      table.insert(opts.sources, {
        name = "buffer"
      })
      opts.snippet = {
	expand = function(args)
	  require('luasnip').lsp_expand(args.body) 	end
      }
      opts.mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    })
    end,
    init = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require('lspconfig')
      local servers = vim.g.language_servers

      for _, serv in ipairs(servers) do
        lspconfig[serv].setup({
	  capabilities = capabilities
	})
      end
    end,
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      "mason-org/mason-lspconfig.nvim"
    }
  },
  {
     "L3MON4D3/LuaSnip",
     init = function()
	require('luasnip.loaders.from_vscode').lazy_load()
     end,
     dependencies = {
       "rafamadriz/friendly-snippets"
     }
  },

}
