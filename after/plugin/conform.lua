local conform = require("conform")

conform.event = { "BufReadPre", "BufNewFile" }

conform.setup({
	formatters_by_ft = {
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescriptreact = { "prettierd" },
		svelte = { "prettierd" },
		css = { "prettierd" },
		html = { "prettierd" },
		json = { "prettierd" },
		yaml = { "prettierd" },
		markdown = { "prettierd" },
		lua = { "stylua" },
		php = { "phpcbf" },
		gdscript = { "gdtoolkit" },
		python = { "isort", "black" },
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	},
})

require("conform").formatters.prettierd = {
	env = {
		string.format("PRETTIERD_DEFAULT_CONFIG=%s", vim.fn.expand("~/.config/nvim/utils/.prettierrc.json")),
	},
}

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
