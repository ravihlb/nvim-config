local conform = require("conform")

local es_formatters = { { "biome" } }

conform.setup({
	formatters_by_ft = {
		javascript = es_formatters,
		typescript = es_formatters,
		javascriptreact = es_formatters,
		typescriptreact = es_formatters,
		svelte = es_formatters,
		css = es_formatters,
		html = es_formatters,
		json = es_formatters,
		yaml = es_formatters,
		markdown = es_formatters,
		lua = { "stylua" },
		gdscript = { "gdformat" },
		python = { "isort", "black" },
		bash = { "shfmt" },
	},
})
