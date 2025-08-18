return {
	-- OIL
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local oil = require("oil")
			oil.setup({
				keymaps = {
					["g."] = "actions.toggle_hidden",
				},
				float = {
					padding = 2,
					max_width = 0.5,
					max_height = 0.5,
					border = "rounded",
					win_options = {
						winblend = 0,
					},
					get_win_title = nil,
					preview_split = "auto",
					override = function(conf)
						return conf
					end,
				},
			})

			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
			vim.keymap.set("n", "<leader><leader>-", function()
				oil.toggle_float()
			end)
		end,
	},
	-- TELESCOPE
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					previewer = true,
					preview = {
						hide_on_startup = false,
					},
					layout_strategy = "horizontal",
					layout_config = {
						width = 0.95,
						height = 0.85,
						preview_width = 0.55,
						preview_cutoff = 1,
					},
				},
			})

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
			vim.keymap.set("n", "<leader>fe", builtin.diagnostics, { desc = "Telescope diagnostics tags" })
		end,
	},
	-- HARPOON
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon.setup()
			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end)
			vim.keymap.set("n", "<leader>x", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			vim.keymap.set("n", "<leader>1", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<leader>2", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<leader>3", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "<leader>4", function()
				harpoon:list():select(4)
			end)
			vim.keymap.set("n", "<leader>5", function()
				harpoon:list():select(5)
			end)
			vim.keymap.set("n", "<leader>6", function()
				harpoon:list():select(6)
			end)
		end,
	},
}
