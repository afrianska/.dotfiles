return {
	{
		"mason-org/mason.nvim",
		opts = {},
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"ts_ls",
					"pyright",
					"intelephense",
					"ruff",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
			-- This setup relate to completions.lua
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			require("lspconfig").lua_ls.setup({ capabilities = capabilities })
			require("lspconfig").rust_analyzer.setup({ capabilities = capabilities })
			require("lspconfig").ts_ls.setup({ capabilities = capabilities })
			require("lspconfig").pyright.setup({ capabilities = capabilities })
			require("lspconfig").ruff.setup({ capabilities = capabilities })
			require("lspconfig").intelephense.setup({ capabilities = capabilities })
			require("lspconfig").ruff.setup({ capabilities = capabilities })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
