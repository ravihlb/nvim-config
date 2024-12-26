return {
    "nvim-telescope/telescope.nvim",
    version = "0.1.x",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    config = function()
        local keymap = vim.keymap.set
        local builtin = require("telescope.builtin")
        require("telescope").setup({
            defaults = {
                layout_strategy = 'horizontal',
                layout_config = { width = 180 },
            }
        })


        keymap("n", "<C-p>", builtin.git_files, {})
        keymap("n", "<C-f>", function()
            builtin.find_files({ hidden = true })
        end)
        keymap("n", "<C-h>", builtin.help_tags, {})
        keymap("n", "<C-b>", builtin.buffers, {})

        keymap("n", "<leader>pws", function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)

        keymap("n", "<leader>ps", function()
            builtin.grep_string({
                search = vim.fn.input("Grep > "),
                additional_args = {
                    "-Hn"
                }
            })
        end)

        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function()
                keymap('n', '<leader>gr', function()
                    require('telescope.builtin').lsp_references({ show_line = false })
                end, {})
            end
        })
    end,

}
