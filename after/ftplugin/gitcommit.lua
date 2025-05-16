require("cmp").setup.filetype("gitcommit", {
	sources = {
		{ name = "git" },
        { name = "conventionalcommits" },
		{ name = "luasnip" },
		{ name = "tmux" },
		{ name = "buffer" },
	},
})
