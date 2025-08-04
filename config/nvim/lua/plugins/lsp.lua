return {
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		config = function()
			require("tiny-inline-diagnostic").setup()
			vim.diagnostic.config({ virtual_text = false })
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"html",
					"gopls",
					"bashls",
					"jsonls",
					"cssls",
				},
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua", -- Lua formatter
					"prettier", -- JS/TS/HTML/CSS/JSON formatter
					"goimports", -- Go imports formatter
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } }, -- Fixed typo
					},
				},
			},
		},
		config = function()
			local cmp = require("blink.cmp")
			local capabilities = cmp.get_lsp_capabilities()
			local lsp = require("lspconfig")

			lsp.lua_ls.setup({ capabilities = capabilities })
			lsp.ts_ls.setup({ capabilities = capabilities })
			lsp.html.setup({ capabilities = capabilities })
			lsp.gopls.setup({ capabilities = capabilities })
			lsp.cssls.setup({ capabilities = capabilities })
			lsp.jsonls.setup({ capabilities = capabilities })
			lsp.bashls.setup({ capabilities = capabilities })

			-- LSP Keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>ee", function()
				vim.diagnostic.setloclist()
			end, { desc = "Show diagnostic" })
		end,
	},
	{
		"stevearc/conform.nvim",
		lazy = false,
		priority = 100,
		config = function()
			local conform = require("conform")
			_G.conform = conform
			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					go = { "goimports" },
					html = { "prettier" },
					css = { "prettier" },
					scss = { "prettier" },
					json = { "prettier" },
					yaml = { "prettier" },
					markdown = { "prettier" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true, -- Use LSP formatting if conform formatter unavailable
				},
			})

			-- Manual format keymap
			vim.keymap.set("n", "<leader>fd", function()
				conform.format({ async = true, lsp_fallback = true })
			end, { desc = "Format document" })
		end,
	},
}
