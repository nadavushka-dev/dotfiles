return {
	{ "nvim-lua/plenary.nvim" },
	{
		"echasnovski/mini.files",
		version = "*",
		config = function()
			local minifiles = require("mini.files")
			minifiles.setup({
				-- Customization of shown content
				content = {
					filter = nil, -- Predicate for which file system entries to show
					prefix = nil, -- What prefix to show to the left of file system entry
					sort = nil, -- In what order to show file system entries
				},

				-- Module mappings created only inside explorer
				mappings = {
					close = "q",
					go_in = "l", -- Enter directory/open file
					go_in_plus = "L", -- Enter directory and close parent
					go_out = "h", -- Go to parent directory
					go_out_plus = "H", -- Go to parent and close children
					reset = "<BS>", -- Reset to entry under cursor
					reveal_cwd = "@", -- Reveal current working directory
					show_help = "g?", -- Show help
					synchronize = "=", -- Synchronize file system with current state
					trim_left = "<", -- Trim to the left (remove columns)
					trim_right = ">", -- Trim to the right (remove columns)
				},

				-- General options
				options = {
					permanent_delete = true, -- Whether to delete permanently or move to trash
					use_as_default_explorer = false, -- Whether to use as default file explorer
				},

				-- Customization of explorer windows
				windows = {
					max_number = math.huge, -- Maximum number of windows to show side by side
					preview = false, -- Whether to show preview of file/directory under cursor
					width_focus = 25, -- Width of focused window
					width_nofocus = 15, -- Width of non-focused window
					width_preview = 25, -- Width of preview window
				},
			})

			vim.keymap.set("n", "-", function()
				minifiles.open(vim.api.nvim_buf_get_name(0))
			end, { desc = "Open mini.files with current file" })

			vim.keymap.set("n", "<leader><leader>-", function()
				minifiles.open(vim.fn.getcwd())
			end, { desc = "Open mini.files at cwd" })
		end,
	},
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

			vim.api.nvim_create_user_command("Ex", function()
				oil.open()
			end, {
				desc = "Open Oil file manager",
				nargs = "?", -- Optional argument
			})

			vim.api.nvim_create_user_command("Sex", function()
				oil.toggle_float()
			end, {
				desc = "Open Oil file manager",
				nargs = "?", -- Optional argument
			})
		end,
	},
	-- TELESCOPE
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		config = function()
			local actions = require("telescope.actions")
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-d>"] = actions.delete_buffer,
						},
						n = {
							["<C-d>"] = actions.delete_buffer,
							["dd"] = actions.delete_buffer,
						},
					},
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
