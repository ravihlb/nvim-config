local conform = require("conform")

local es_formatters = { { "biome", "prettierd" } }

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
	format_on_save = function(bufnr)
		-- Disable with a global or buffer-local variable
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 500, lsp_fallback = true }
	end,
})

vim.api.nvim_create_user_command("FormatOnSaveToggle", function(args)
	if args.bang then
		-- FormatOnSaveToggle! will toggle just for current buffer
		vim.b.disable_autoformat = not vim.b.disable_autoformat
	end

	vim.g.disable_autoformat = not vim.g.disable_autoformat
end, {
	desc = "Toggle autoformat on save.",
	bang = true,
})
