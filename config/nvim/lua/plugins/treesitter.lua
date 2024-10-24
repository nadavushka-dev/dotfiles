return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "html", "javascript", "typescript", "c", "vim", "vimdoc", "query", "lua", "python", "bash" },

			highlight = { enable = true },
			indent = { enable = true },
		})
	end
}
