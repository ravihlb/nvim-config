return {
    "iamcco/markdown-preview.nvim",
    config = function()
        vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<CR>", { silent = true })
    end
}
