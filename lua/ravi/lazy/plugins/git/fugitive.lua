return {
    "tpope/vim-fugitive",
    config = function()
        local keymap = vim.keymap.set

        keymap("n", "<leader>gs", vim.cmd.Git)
        keymap("n", "<leader>ga", ":Git stage % | echo 'Staged ' . expand('%:t')<CR>")

        local Fugitive = vim.api.nvim_create_augroup("Fugitive", {})
        vim.api.nvim_create_autocmd("BufWinEnter", {
            group = Fugitive,
            pattern = "*",
            callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = { buffer = bufnr, remap = false }

                keymap("n", "<leader>gp", function()
                    vim.cmd.Git("push")
                end, opts)

                keymap("n", "<leader>gpf", function()
                    vim.cmd.Git("push -f")
                end, opts)

                keymap("n", "<leader>gl", function()
                    vim.cmd.Git({ "pull --rebase --autostash" })
                end, opts)

                keymap("n", "<leader>gm", function()
                    vim.cmd.Git("mergetool")
                end, opts)

                -- Prefill cmdline with "Git branch "
                keymap("n", "gb<leader>", ":Git branch ", opts)
                -- Prefill cmdline with "Git switch "
                keymap("n", "gs<leader>", ":Git switch ", opts)
                -- Prefill cmdline with "Git push "
                keymap("n", "gp<leader>", ":Git push ", opts)

                -- Publish new branch and push to it
                keymap("n", "<leader>gip", ":!git push -u origin $(git rev-parse --abbrev-ref HEAD)<CR>")

                keymap("n", "gu", "<cmd>diffget //2<cr>")
                keymap("n", "gh", "<cmd>diffget //3<cr>")
            end,
        })
    end,
}
