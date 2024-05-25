return {
	"junegunn/goyo.vim",
	config = function()
		vim.g.goyo_width = 130
		vim.keymap.set("n", "<leader>gt", ":Goyo<CR>", { silent = true })
	end,
}
