if vim.g.vscode ~= nil then
    return {}
end

return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
        -- { "L3MON4D3/LuaSnip", version = "v2.*" },
        "mgalliou/blink-cmp-tmux",
    },
    version = "v2.*",
    build = { "cargo build --release" },
    opts = {
        fuzzy = { implementation = "prefer_rust" },
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
                -- tmux = {
                --     module = "blink-cmp-tmux",
                --     name = "tmux",
                --     -- default options
                --     opts = {
                --         all_panes = true,
                --         capture_history = false,
                --         -- only suggest completions from `tmux` if the `trigger_chars` are
                --         -- used
                --         -- triggered_only = false,
                --         -- trigger_chars = { "." },
                --     },
                -- },
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
                        { "label", "label_description", gap = 1.5 },
                        { "kind_icon", "kind", gap = 1 },
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
