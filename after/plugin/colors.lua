function SetupSonokai(name)
	vim.g.sonokai_style = name
	vim.g.sonokai_better_performance = 1
	vim.g.sonokai_transparent_background = 1
end

require("kanagawa").setup({
	colors = {
        palette = {
            lotusWhite3 = "#f4efc9",
            sumiInk3 = "#1D1C19"
        },
		theme = {
			all = {
				ui = {
					bg_gutter = "none",
				},
			},
		},
	},
})

SetupSonokai('atlantis')
vim.cmd("colorscheme kanagawa")
