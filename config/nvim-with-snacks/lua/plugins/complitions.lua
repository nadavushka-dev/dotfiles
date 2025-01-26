return {
  -- LSP Completion Source
  {
    "hrsh7th/cmp-nvim-lsp",
    config = function()
      local cmp = require('cmp')
      cmp.setup {
        sources = {
          { name = 'nvim_lsp' }
        }
      }
    end
  },

  -- LuaSnip + Snippet Sources (Friendly Snippets)
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'saadparwaiz1/cmp_luasnip',     -- nvim-cmp source for LuaSnip
      'rafamadriz/friendly-snippets', -- Collection of pre-defined snippets (React, JavaScript, etc.)
      'hrsh7th/cmp-buffer',           -- Buffer source for nvim-cmp
      'hrsh7th/cmp-path',             -- Path source for nvim-cmp
    },
    config = function()
      local cmp = require 'cmp'

      -- setup nvim-cmp
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- use luasnip for snippet expansion
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      })
      -- Lazy-load snippets from vscode-style (including React snippets)
      require("luasnip.loaders.from_vscode").lazy_load()

      -- LuaSnip keymap for expanding and jumping through snippets
      vim.api.nvim_set_keymap("i", "<Tab>", "luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'",
        { expr = true, silent = true })
    end
  },

  -- nvim-cmp for autocompletion
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require 'cmp'

      -- setup nvim-cmp
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- use luasnip for snippet expansion
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-i>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },           -- Include LuaSnip for snippet completion
          { name = 'buffer' },            -- Buffer-based completion
          { name = 'path' },              -- Path completion
        })
      })
    end
  }
}
