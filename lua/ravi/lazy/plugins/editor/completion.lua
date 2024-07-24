return {
	"hrsh7th/nvim-cmp",
	name = "cmp",
	dependencies = {
		"onsails/lspkind.nvim",
		"saadparwaiz1/cmp_luasnip",
        {
          "ray-x/lsp_signature.nvim",
          event = "VeryLazy",
        },
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		local cmp_mappings = {
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
			["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
			["<Tab>"] = cmp.mapping.confirm({ select = true }),
		}

		cmp.setup({
			snippet = {
				expand = function(args)
					require("cmp_luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert(cmp_mappings),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "luasnip" },
				{ name = "nvim_lua" },
				{ name = "path" },
				{ name = "buffer" },
				{ name = "tmux" },
				{ name = "bufname" },
			},
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					menu = {
						buffer = "[Buf]",
						nvim_lsp = "[LSP]",
						luasnip = "[LuaSnip]",
						nvim_lua = "[Lua]",
						tmux = "[tmux]",
						sqlls = "[sqlls]",
						git = "[git]",
						conventionalcommits = "[cc]",
					},
				}),
			},
			experimental = {
				native_menu = false,
				ghost_text = true,
			},
		})

		cmp.setup.filetype("gitcommit", {
			sources = {
				{ name = "luasnip" },
				{ name = "conventionalcommits" },
				{ name = "git" },
				{ name = "tmux" },
				{ name = "buffer" },
				{ name = "bufname" },
			},
		})

		cmp.setup.filetype("mysql", {
			sources = {
				{ name = "sqlls" },
				{ name = "vim-dadbod-completion" },
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline({ ":" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
				{ name = "cmdline" },
			}, {
				{ name = "buffer" },
			}),
		})

		vim.g.completion = true
		function CompletionToggle()
			cmp.setup({ enabled = not vim.g.completion })
		end

		--- Disable all completion on markdown files
		vim.api.nvim_create_autocmd("Filetype", {
			pattern = {
				"markdown",
			},
			callback = function()
				vim.g.completion = false
				CompletionToggle()
			end,
		})

		vim.api.nvim_create_user_command("CompletionToggle", function()
			CompletionToggle()
		end, {})

		vim.keymap.set("n", "<leader>ct", ":CompletionToggle<CR>", { silent = true })
	end,
}
