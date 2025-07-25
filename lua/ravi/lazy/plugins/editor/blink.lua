return {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    version = "v0.*",
    opts = {
        keymap = {
            preset = "default",
            ["<C-p>"] = { "select_prev", "fallback" },
            ["<C-n>"] = { "select_next", "fallback" },
            ["<C-j>"] = { "snippet_forward", "fallback" },
            ["<C-k>"] = { "snippet_backward", "fallback" },
            ["<Tab>"] = { "accept", "fallback" },
            ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
        },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
            per_filetype = {
                gitcommit = { "buffer", "path" },
            },
            providers = {
                buffer = {
                    name = "Buffer",
                    module = "blink.cmp.sources.buffer",
                },
                path = {
                    name = "Path",
                    module = "blink.cmp.sources.path",
                    score_offset = 3,
                },
                snippets = {
                    name = "Snippets",
                    module = "blink.cmp.sources.snippets",
                    score_offset = -3,
                },
                cmdline = {
                    name = "Cmdline",
                    module = "blink.cmp.sources.cmdline",
                },
            },
        },
        cmdline = {
            enabled = true,
            sources = {
                [":"] = { "path", "cmdline" },
                ["/"] = { "buffer" },
                ["?"] = { "buffer" },
            },
        },
        completion = {
            accept = {
                auto_brackets = {
                    enabled = true,
                },
            },
            menu = {
                draw = {
                    treesitter = { "lsp" },
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
            },
        },
        signature = {
            enabled = true,
        },
    },
    opts_extend = { "sources.default" },
}
