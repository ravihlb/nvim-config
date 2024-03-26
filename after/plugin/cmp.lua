local cmp = require("cmp")
local lspkind = require("lspkind")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = {
	["<C-Space>"] = cmp.mapping.complete(),
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
}

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert(cmp_mappings),
	sources = {
		{ name = "nvim_lsp" },
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
