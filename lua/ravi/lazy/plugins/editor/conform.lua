return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")

		local es_formatters = { "prettierd" }

		conform.setup({
			formatters_by_ft = {
				javascript = es_formatters,
				typescript = es_formatters,
				javascriptreact = es_formatters,
				typescriptreact = es_formatters,
				svelte = es_formatters,
				css = es_formatters,
				html = es_formatters,
				yaml = es_formatters,
				markdown = es_formatters,
				lua = { "stylua" },
				gdscript = { "gdformat" },
				python = { "isort", "black" },
				bash = { "shfmt" },
				vue = { "stylelint" },
			},
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.enable_autoformat == false or vim.b[bufnr].enable_autoformat == false then
					return nil
				end
				return { lsp_format = "fallback", timeout_ms = 500 }
			end,
		})

		vim.api.nvim_create_user_command("FormatOnSaveToggle", function(args)
			if args.bang then
				-- FormatOnSaveToggle! will toggle just for current buffer
				if not vim.b.enable_autoformat then
					print("setting vim.b.enable_autoformat = true")
					vim.b.enable_autoformat = true
				else
					print("setting vim.b.enable_autoformat = false")
					vim.b.enable_autoformat = false
				end
			end

			if not vim.g.enable_autoformat then
				print("setting vim.g.enable_autoformat = true")
				vim.g.enable_autoformat = true
			else
				print("setting vim.g.enable_autoformat = false")
				vim.g.enable_autoformat = false
			end
		end, {
			desc = "Toggle autoformat on save.",
			bang = true,
		})
	end,
}
