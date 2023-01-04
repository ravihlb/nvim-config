vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>e', vim.cmd.Ex)

vim.keymap.set("n", "<C-S-v>", '"+y')
vim.keymap.set("n", "<C-S-v>", '"+p')

vim.keymap.set("n", "+", ":vertical resize +5<CR>", { silent = true })
vim.keymap.set("n", "-", ":vertical resize -5<CR>", { silent = true })

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

vim.keymap.set("i", "<C-c>", "<Esc>")

