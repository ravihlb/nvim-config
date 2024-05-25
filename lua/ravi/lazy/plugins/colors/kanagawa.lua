return {
	"rebelot/kanagawa.nvim",
	name = "kanagawa",
	config = function()
		require("kanagawa").setup({
			colors = {
				palette = {
					lotusWhite3 = "#f4efc9",
					sumiInk3 = "#1D1C19",
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
