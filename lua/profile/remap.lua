vim.g.mapleader = " "
vim.keymap.set("n", "<C-S-v>", '"+y')
vim.keymap.set("n", "<C-S-v>", '"+p')

vim.keymap.set("n", "<C-q>", "<C-a>")

vim.keymap.set("n", "s", '"_s')

vim.keymap.set("n", "<Leader>+", ":resize +5<CR>", { silent = true })
vim.keymap.set("n", "<Leader>-", ":resize -5<CR>", { silent = true })

vim.keymap.set("n", "+", ":vert resize +5<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "-", ":vert resize -5<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

vim.keymap.set({ "n", "v" }, "$", "g_")

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<F3>", ":d<CR>")

vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 700,
	})
end, { desc = "Format file or selected range" })
