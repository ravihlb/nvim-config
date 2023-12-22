local conform = require("conform")

conform.event = { "BufReadPre", "BufNewFile" }

conform.setup({
	formatters_by_ft = {
		javascript = { "prettierd" },
		python = { "isort", "black" },
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
