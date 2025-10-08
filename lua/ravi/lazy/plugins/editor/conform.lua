return {
    "stevearc/conform.nvim",
    config = function()
        local conform = require("conform")

        local es_formatters = { "biome", "prettier" }

        conform.setup({
            formatters_by_ft = {
                javascript = es_formatters,
                typescript = es_formatters,
                javascriptreact = es_formatters,
                typescriptreact = es_formatters,
                svelte = es_formatters,
                css = es_formatters,
                html = es_formatters,
                yaml = es_formatters,
                markdown = {},
                lua = { "stylua" },
                gdscript = { "gdformat" },
                python = { "isort", "black" },
                bash = { "shfmt" },
                vue = { "stylelint" },
            },
            formatters = {
                biome = {
                    args = { "format", "--stdin-file-path", "$FILENAME" },
                },
            },
            format_on_save = function(bufnr)
                -- Disable with a global or buffer-local variable
                if vim.g.enable_autoformat == false or vim.b[bufnr].enable_autoformat == false then
                    return nil
                end
                return { lsp_format = "fallback", timeout_ms = 500 }
            end,
        })

        vim.api.nvim_create_user_command("FormatOnSaveToggle", function(args)
            if args.bang then
                -- FormatOnSaveToggle! will toggle just for current buffer
                if not vim.b.enable_autoformat then
                    print("setting vim.b.enable_autoformat = true")
                    vim.b.enable_autoformat = true
                else
                    print("setting vim.b.enable_autoformat = false")
                    vim.b.enable_autoformat = false
                end
            end

            if not vim.g.enable_autoformat then
                print("setting vim.g.enable_autoformat = true")
                vim.g.enable_autoformat = true
            else
                print("setting vim.g.enable_autoformat = false")
                vim.g.enable_autoformat = false
            end
        end, {
            desc = "Toggle autoformat on save.",
            bang = true,
        })
    end,

    vim.api.nvim_create_user_command("Format", function(args)
        require("conform").format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 700,
        })
    end, {}),

    vim.keymap.set({ "n", "v" }, "<leader>fo", function()
        require("conform").format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 700,
        })
    end, { desc = "[Fo]rmat file or selected range" }),
}
