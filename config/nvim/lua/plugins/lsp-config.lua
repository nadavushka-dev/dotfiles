return {
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
        ensure_installed = { "lua_ls", "tsserver", "html", "pyright", "pylsp", "gopls", "bashls", "jsonls", "cssls" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {
          filetypes = { "sh", "zsh" },
        },
      },
      diagnostics = {
        update_in_insert = true,
      },
    },

    config = function()
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })

      lspconfig.tsserver.setup({
        capabilities = capabilities
      })

      lspconfig.html.setup({
        capabilities = capabilities
      })

      lspconfig.pyright.setup({
        capabilities = capabilities
      })

      lspconfig.pylsp.setup({
        capabilities = capabilities
      })

      lspconfig.gopls.setup({
        capabilities = capabilities
      })

      lspconfig.docker_compose_language_service.setup({
        capabilities = capabilities
      })

      lspconfig.dockerls.setup({
        capabilities = capabilities
      })

      lspconfig.jsonls.setup({
        capabilities = capabilities
      })

      lspconfig.cssls.setup({
        capabilities = capabilities
      })

      lspconfig.bashls.setup({
        capabilities = capabilities
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "en", vim.diagnostic.goto_next)
      vim.keymap.set("n", "ep", vim.diagnostic.goto_prev)

      vim.diagnostic.config({
        virtual_text = false
      })

      -- Show line diagnostics automatically in hover window
      vim.o.updatetime = 250
      vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
    end
  }
}
