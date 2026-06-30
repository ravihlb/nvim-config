if vim.g.vscode ~= nil then
    return {}
end

return {
    "saghen/blink.cmp",
    dependencies = {
        "saghen/blink.lib",
        "rafamadriz/friendly-snippets",
        "mgalliou/blink-cmp-tmux",
    },
    build = function()
        -- build the fuzzy matcher, optionally add a timeout to `pwait(timeout_ms)`
        -- you can use `gb` in `:Lazy` to rebuild the plugin as needed
        require('blink.cmp').build():pwait()
    end,
    version = "v2.*",
    opts = {
        fuzzy = { implementation = "prefer_rust_with_warning" },
        keymap = {
            preset = "default",
            ["<C-p>"] = { "select_prev", "fallback" },
            ["<C-n>"] = { "select_next", "fallback" },
            ["<Tab>"] = { "accept", "fallback" },
            ["<C-b>"] = { "cancel" },
            ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
        },
        appearance = {
            nerd_font_variant = "mono",
        },
        signature = {
            enabled = true,
        },
        sources = {
            default = { "lsp", "snippets", "buffer", "path" },
            providers = {
                buffer = {
                    name = "buffer",
                    module = "blink.cmp.sources.buffer",
                },
                path = {
                    name = "path",
                    module = "blink.cmp.sources.path",
                },
                cmdline = {
                    module = "blink.cmp.sources.cmdline",
                    opts = {
                        complete_func = function()
                            return vim.bo.omnifunc
                        end,
                    },
                },
                tmux = {
                    module = "blink-cmp-tmux",
                    name = "tmux",
                    -- default options
                    opts = {
                        all_panes = true,
                        capture_history = false,
                        -- only suggest completions from `tmux` if the `trigger_chars` are
                        -- used
                        -- triggered_only = false,
                        -- trigger_chars = { "." },
                    },
                },
            },
        },
        completion = {
            list = {
                selection = {
                    preselect = true,
                    auto_insert = false,
                },
            },
            accept = {
                auto_brackets = {
                    enabled = true,
                },
            },
            menu = {
                auto_show = true,
                draw = {
                    align_to = "label",
                    padding = 1,
                    columns = {
                        { "label",     "label_description", gap = 2 },
                        { "kind_icon", "kind",              gap = 1 },
                    },
                    treesitter = { "lsp" },
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 50,
            },
        },
        cmdline = {
            keymap = { preset = "inherit" },
            completion = { menu = { auto_show = true } },
        },
    },
    opts_extend = { "sources.default" },
}
