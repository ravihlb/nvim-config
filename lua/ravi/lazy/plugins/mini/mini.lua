return {
    { "echasnovski/mini.ai", version = "*", opts = {} },
    { "echasnovski/mini.statusline", version = "*", opts = {} },
    { "echasnovski/mini.sessions", version = "*", opts = {} },
    { "echasnovski/mini.notify", version = "*", opts = {} },
    {
        "echasnovski/mini.files",
        version = "*",
        opts = {},
        keys = {
            {
                "<leader>me",
                function()
                    local MiniFiles = require("mini.files")
                    local _ = MiniFiles.close() or MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
                    vim.defer_fn(function()
                        MiniFiles.reveal_cwd()
                    end, 30)
                end,
            },
            {
                "<leader>mo",
                function()
                    local MiniFiles = require("mini.files")
                    local _ = MiniFiles.close() or MiniFiles.open()
                end,
            },
        },
    },
    event = "VeryLazy",
}
