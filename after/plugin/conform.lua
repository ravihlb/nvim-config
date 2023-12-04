local conform = require("conform")

conform.event = { "BufReadPre", "BufNewFile" }

conform.setup({
	formatters_by_ft = {
		javascript = { "prettier" },
		python = { "isort", "black" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		svelte = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		lua = { "stylua" },
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	},
})
