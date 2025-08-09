return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "isort", "black" },
					rust = { "rustfmt" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					php = { "php-cs-fixer" },
				},
				default_format_opts = {
					lsp_format = "fallback",
				},
				format_on_save = {
					lsp_format = "fallback",
					timeout_ms = 500,
				},
			})
		end,
	},
}
