return {
	"hrsh7th/nvim-cmp",
	name = "cmp",
	dependencies = {
		"onsails/lspkind.nvim",
        "L3MON4D3/LuaSnip",
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		local cmp_mappings = {
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
			["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
			["<S-Tab>"] = cmp.mapping.confirm({ select = true }),
		}

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert(cmp_mappings),
			sources = cmp.config.sources({
				{ name = "copilot", priority = 10 },
				{ name = "nvim_lsp", priority = 9 },
				{ name = "lazydev", priority = 8 },
				{ name = "nvim_lsp_signature_help", priority = 7 },
				{ name = "luasnip", priority = 6 },
				{ name = "nvim_lua", priority = 5 },
				{ name = "path", priority = 4 },
				{ name = "buffer", priority = 3 },
				{ name = "tmux", priority = 2 },
				{ name = "cmdline", priority = 1 },
			}),
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					menu = {
						copilot = "[Copilot]",
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
				ghost_text = false,
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

		require("cmp_git").setup({})

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

		vim.keymap.set("n", "<leader>ct", ":CompletionToggle<CR>", { silent = true })
	end,
	wants = { "LuaSnip" },
	requires = {
		{ "ray-x/lsp_signature.nvim", event = "VeryLazy" },
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-cmdline",
		"petertriho/cmp-git",
		{ "davidsierradz/cmp-conventionalcommits", ft = "gitcommit" },
		"andersevenrud/cmp-tmux",
		{
			"zbirenbaum/copilot-cmp",
			config = function()
				require("copilot_cmp").setup()
			end,
		},
	},
}
