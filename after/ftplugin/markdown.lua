vim.cmd("set wrap lbr", { silent = true })
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

local function set_buffer_keymap(lhs, rhs, opts)
    opts = { buffer = true, silent = true }
    vim.keymap.set({"n", "v"}, lhs, rhs, opts)
end

--- Markdown specific mappings
vim.api.nvim_create_augroup("markdown", { clear = true })

-- Link
vim.api.nvim_create_autocmd("BufEnter", {
	group = "markdown",
	pattern = { "*.md" },
	callback = function()
        -- Inserts visual selection as title of a Markdown hyperlink
        -- [L]ink
		set_buffer_keymap("<leader>l", 'eB"2c["2pa]()h')

        -- [B]oldens text
		set_buffer_keymap("<leader>b", 'eB"2c**"2pa**')

        -- Surrounds with ` (backticks)
        -- [E]nquote
		-- set_buffer_keymap("<leader>e", 'eB"2cE`"2pa`B')
  --       -- Around visual selection
		-- set_buffer_keymap("<leader>e", 'eB"2c`"2pa`')

        -- Example

	end,
})
