local map = vim.keymap.set

vim.g.mapleader = " "
map("n", "<C-S-v>", '"+y')
map("n", "<C-S-v>", '"+p')

map("n", "s", '"_s')

map("n", "<leader>+", ":resize +5<CR>", { silent = true })
map("n", "<leader>-", ":resize -5<CR>", { silent = true })

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

map("n", "<C-j>", ":cnext<CR>")
map("n", "<C-k>", ":cprev<CR>")

map("n", "[d", function()
    vim.diagnostic.goto_prev()
end)
map("n", "]d", function()
    vim.diagnostic.goto_next()
end)

map("n", "<leader>ox", ":silent !cursor . && cursor -g '%'<CR>", { silent = true, desc = "[O]pen E[x]ternal editor" })

map(
    "n",
    "<leader>wo",
    ":silent %bd|e#<CR>",
    { silent = true, desc = "Delete every buffer except this [w]indow [o]nly" }
)

map("n", "<leader>mk", ":mksession! session.vim<CR>", { desc = "[mk]session" })
