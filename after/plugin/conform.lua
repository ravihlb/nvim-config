local conform = require("conform")

conform.event = { "BufReadPre", "BufNewFile" }

conform.setup({
	formatters_by_ft = {
		javascript = { "eslint_d" },
		typescript = { "eslint_d" },
		javascriptreact = { "eslint_d" },
		typescriptreact = { "eslint_d" },
		svelte = { "eslint_d" },
		css = { "eslint_d" },
		html = { "eslint_d" },
		json = { "eslint_d" },
		yaml = { "eslint_d" },
		markdown = { "eslint_d" },
		lua = { "stylua" },
		gdscript = { "gdformat" },
		python = { "isort", "black" },
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
