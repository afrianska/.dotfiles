return {
	{
		"stevearc/conform.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "ruff" },
					rust = { "rustfmt" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					php = { "php-cs-fixer" },
					tailwindcss = { "rustywind" },
					html = { "superhtml" },
					json = { "fixjson" },
				},
				default_format_opts = {
					lsp_format = "fallback",
				},
				format_on_save = {
					lsp_format = "fallback",
					timeout_ms = 1000,
				},
				notify_on_error = true,
				formatters = {
					php = {
						command = "php-cs-fixer",
						args = {
							"fix",
							"$FILENAME",
							"--config=/your/path/to/config/file/[filename].php",
							"--allow-risky=yes", -- if you have risky stuff in config, if not you dont need it.
						},
						stdin = false,
					},
				},
			})
		end,
	},
}
