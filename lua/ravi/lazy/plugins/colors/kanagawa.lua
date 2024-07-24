return {
	"rebelot/kanagawa.nvim",
	name = "kanagawa",
	config = function()
		require("kanagawa").setup({
			colors = {
				palette = {
					lotusWhite3 = "#f4efc9",
					sumiInk3 = "#191A1D",
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

		vim.cmd("colorscheme kanagawa")
	end,
}
