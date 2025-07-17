return {
    "tpope/vim-fugitive",
    config = function()
        local keymap = vim.keymap.set

        keymap("n", "<leader>gs", vim.cmd.Git)

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

                vim.keymap.set("n", "<leader>gp", function()
                    vim.cmd.Git("push")
                end, opts)

                vim.keymap.set("n", "<leader>gl", function()
                    vim.cmd.Git({ "pull --rebase --autostash" })
                end, opts)

                -- NOTE: It allows me to easily set the branch i am pushing and any tracking
                -- needed if i did not set the branch up correctly
                vim.keymap.set("n", "<leader>t", ":Git push -u origin", opts)

                -- Fill in "Git branch " on cmdline
                vim.keymap.set("n", "gb<leader>", ":Git branch ", opts)
                -- Fill in "Git switch " on cmdline
                vim.keymap.set("n", "gs<leader>", ":Git switch --autostash", opts)

                -- Publish new branch and push to it
                vim.keymap.set("n", "<leader>gip", ":!git push -u origin $(git rev-parse --abbrev-ref HEAD)<CR>")

                keymap("n", "gu", "<cmd>diffget //2<cr>")
                keymap("n", "gh", "<cmd>diffget //3<cr>")
            end,
        })
    end,
}
