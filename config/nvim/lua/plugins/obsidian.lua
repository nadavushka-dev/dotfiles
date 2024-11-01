return {
  "epwalsh/obsidian.nvim",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {},
  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "ObsidianVault",
          path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/ObsidianVault",
        },
      },
    })
    vim.opt.conceallevel = 2
    vim.keymap.set("n", "<leader>oo", ":ObsidianOpen<CR>")
    -- vim.keymap.set("n", "<leader>fn", ":ObsidianQuickSwitch<CR>")
  end
}
