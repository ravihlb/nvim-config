function ToggleNetrw()
	if vim.api.nvim_buf_get_option(0, "filetype") == "netrw" then
		vim.api.nvim_exec("close", false)
	else
		vim.api.nvim_exec(":Lexplore", false)
	end
end

vim.keymap.set("n", "<C-e>", ToggleNetrw)
