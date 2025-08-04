return {
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "LspAttach",
		config = function()
			require("tiny-inline-diagnostic").setup()
			vim.diagnostic.config({ virtual_text = false })
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "mason.nvim" },
		event = { "BufReadPre", "BufNewFile" },
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
				automatic_installation = true,
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason.nvim" },
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua",
					"prettier",
					"goimports",
				},
				auto_update = false,
				run_on_start = false,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"saghen/blink.cmp",
			"mason.nvim",
			"mason-lspconfig.nvim",
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
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

			-- LSP Keymaps (set on LspAttach for better performance)
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<leader>ee", vim.diagnostic.setloclist, { desc = "Show diagnostic" })
				end,
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>fd",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				desc = "Format document",
			},
		},
		config = function()
			local conform = require("conform")
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
					lsp_fallback = true,
				},
			})
		end,
	},
}
