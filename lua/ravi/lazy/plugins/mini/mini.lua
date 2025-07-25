return {
    { "echasnovski/mini.ai", version = "*", opts = {} },
    {
        "echasnovski/mini.statusline",
        version = "*",
        opts = {
            content = {
                active = function()
                    local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
                    local git = MiniStatusline.section_git({ trunc_width = 40 })
                    local diff = MiniStatusline.section_diff({ trunc_width = 75 })
                    local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
                    local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
                    -- using math.huge (Lua's Infinity const) to force filename to truncate
                    local filename = MiniStatusline.section_filename({ trunc_width = math.huge })
                    local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
                    local location = MiniStatusline.section_location({ trunc_width = 75 })
                    local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

                    return MiniStatusline.combine_groups({
                        { hl = mode_hl, strings = { mode } },
                        { hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
                        "%<", -- Mark general truncate point
                        { hl = "MiniStatuslineFilename", strings = { filename } },
                        "%=", -- End left alignment
                        { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
                        { hl = mode_hl, strings = { search, location } },
                    })
                end,
                inactive = nil,
            },
            use_icons = true,
        },
    },
    { "echasnovski/mini.sessions", version = "*", opts = {} },
    { "echasnovski/mini.notify", version = "*", opts = {} },
    {
        "echasnovski/mini.files",
        version = "*",
        opts = {},
        keys = {
            {
                "<leader>.",
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
