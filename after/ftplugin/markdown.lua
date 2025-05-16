vim.cmd("set wrap lbr", { silent = true })
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

--- Markdown specific mappings
vim.api.nvim_create_augroup("markdown", { clear = true })

-- Link
vim.api.nvim_create_autocmd("BufEnter", {
	group = "markdown",
	pattern = { "*.md" },
	callback = function()
        -- Inserts visual selection as title of a Markdown hyperlink
        -- [L]ink
		vim.keymap.set("v", "<leader>l", '"2c["2pa]()h')

        -- [B]oldens text
		vim.keymap.set("v", "<leader>b", '"2c**"2pa**')

        -- Surrounds with ` (backticks)
        -- [E]nquote
		vim.keymap.set("n", "<leader>e", '"2cE`"2pa`B')
        -- Around visual selection
		vim.keymap.set("v", "<leader>e", '"2c`"2pa`')

        -- Example
		-- vim.keymap.set("v", "<leader>l", '"2c["2pa]()h')

	end,
})
