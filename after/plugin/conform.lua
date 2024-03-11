local conform = require("conform")

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
})
