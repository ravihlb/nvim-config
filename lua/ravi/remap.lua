local map = vim.keymap.set

vim.g.mapleader = " "
map("n", "<C-S-v>", '"+y')
map("n", "<C-S-v>", '"+p')

map("n", "s", '"_s')

map("n", "<Leader>+", ":resize +5<CR>", { silent = true })
map("n", "<Leader>-", ":resize -5<CR>", { silent = true })

map("n", "+", ":vert resize +5<CR>", { noremap = true, silent = true })
map("n", "-", ":vert resize -5<CR>", { noremap = true, silent = true })

map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

map("n", "j", "gj", { silent = true })
map("n", "k", "gk", { silent = true })

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '>-2<CR>gv=gv")

map({ "n", "v" }, "$", "g_")

map("i", "<C-c>", "<Esc>")

map("n", "<F3>", ":d<CR>")

--- Plugin maps

map({ "n", "v" }, "<leader>f", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 700,
	})
end, { desc = "Format file or selected range" })

map("n", "<C-j>", ":cnext<CR>")
map("n", "<C-k>", ":cprev<CR>")

map("n", "[d", function()
	vim.diagnostic.goto_prev()
end)
map("n", "]d", function()
	vim.diagnostic.goto_next()
end)

map("n", "<leader>ox", ":silent !cursor . && cursor -g %<CR>", { silent = true, desc = "[O]pen E[x]ternal editor" })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function()
		map("n", "<leader>r", vim.lsp.buf.rename, {})
		map("n", "<leader>ca", vim.lsp.buf.code_action, {})

		map("n", "gd", vim.lsp.buf.definition, {})
	end,
})
