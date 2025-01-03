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

map("n", "[d", function() vim.diagnostic.goto_prev() end)
map("n", "]d", function() vim.diagnostic.goto_prev() end)

--- Markdown specific mappings
vim.api.nvim_create_augroup("markdown", { clear = true })

-- Link
vim.api.nvim_create_autocmd("BufEnter", {
    group = "markdown",
    pattern = { "*.md" },
    callback = function()
        vim.keymap.set("v", "<leader>l", '"2c["2pa]()h')
        vim.keymap.set("n", "<leader>h", function()
            vim.o.syntax = "html"
        end)
    end,
})

-- Markdown Reset (checkboxes)
vim.api.nvim_create_autocmd("BufEnter", {
    group = "markdown",
    pattern = { "*.md" },
    callback = function()
        vim.keymap.set("n", "<leader>mr", function()
            vim.cmd("%s/\\[[^ ]\\+\\]/[ ]/g")
        end)
    end,
})

vim.api.nvim_create_autocmd("BufWinLeave", {
    group = "markdown",
    pattern = { "*.md" },
    callback = function()
        vim.keymap.del("v", "<leader>l")
    end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function()
        map('n', '<leader>r', vim.lsp.buf.rename, {})
        map('n', '<leader>ca', vim.lsp.buf.code_action, {})

        map('n', '<leader>gd', vim.lsp.buf.definition, {})
    end
})
