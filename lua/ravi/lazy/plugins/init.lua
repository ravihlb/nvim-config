return {
	{
		"nvim-lua/plenary.nvim",
		name = "plenary",
	},

	{
		"folke/trouble.nvim",
		config = function()
			--- TODO
			require("trouble").setup({
				icons = false,
			})
		end,
	},

}
