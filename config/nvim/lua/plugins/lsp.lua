return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
      require('tiny-inline-diagnostic').setup()
      vim.diagnostic.config({ virtual_text = false })
    end
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "html", "gopls", "bashls", "jsonls", "cssls" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", wirds = { "vim%.uv" } }
          }
        }
      }
    },
    config = function()
      local cmp = require('blink.cmp')
      local capabilities = cmp.get_lsp_capabilities()

      local lsp = require("lspconfig")
      lsp.lua_ls.setup { capabilities = capabilities }
      lsp.ts_ls.setup { capabilities = capabilities }
      lsp.html.setup { capabilities = capabilities }
      lsp.gopls.setup { capabilities = capabilities }
      lsp.cssls.setup { capabilities = capabilities }
      lsp.jsonls.setup { capabilities = capabilities }
      lsp.bashls.setup { capabilities = capabilities }

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>ee", function() vim.diagnostic.setloclist() end, { desc = "Show diagnostic" })
      vim.keymap.set('n', '<leader>fd', vim.lsp.buf.format, {})

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end
          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
      })
    end,
  }
}
