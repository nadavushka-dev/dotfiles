return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          "c",
          "html",
          "javascript",
          "typescript",
          "lua",
          "vim",
          "vimdoc",
          "json"
        },
        auto_install = true,
        highlight = { enable = true },
        sync_install = false,
        indent = { enable = true },
    })
    end
  }
}

