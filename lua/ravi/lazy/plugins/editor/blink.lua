return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
        "mgalliou/blink-cmp-tmux",
    },
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
            default = { "lsp", "snippets", "buffer", "path", "tmux" },
            providers = {
                buffer = {
                    name = "buffer",
                    module = "blink.cmp.sources.buffer",
                },
                path = {
                    name = "path",
                    module = "blink.cmp.sources.path",
                    score_offset = 3,
                },
                snippets = {
                    name = "snippets",
                    module = "blink.cmp.sources.snippets",
                    score_offset = -3,
                },
                cmdline = {
                    module = "blink.cmp.sources.cmdline",
                },
                tmux = {
                    module = "blink-cmp-tmux",
                    name = "tmux",
                    -- default options
                    opts = {
                        all_panes = false,
                        capture_history = false,
                        -- only suggest completions from `tmux` if the `trigger_chars` are
                        -- used
                        triggered_only = false,
                        trigger_chars = { "." },
                    },
                },
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
