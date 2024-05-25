return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup()

		local ft = require("Comment.ft")

		ft.set("sql", "#%s")
	end,
}
