-- File: lua/plugins/lsp.lua
return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "saghen/blink.cmp", -- For capabilities
        },
        config = function()
            -- Get capabilities from blink.cmp
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            local lspconfig = require("lspconfig")

            -- Clangd setup
            lspconfig.clangd.setup({
                capabilities = capabilities,
                settings = {
                    ["-style"] = {
                        ["BasedOnStyle"] = { "GNU" },
                    },
                },
            })

            lspconfig.gdscript.setup({
                capabilities = capabilities,
                cmd = vim.lsp.rpc.connect("192.168.112.1", 6005),
            })

            -- Mason setup
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                },
                automatic_installation = {},
                handlers = {
                    -- Default handler for all servers
                    function(server_name)
                        require("lspconfig")[server_name].setup({
                            capabilities = capabilities,
                        })
                    end,

                    -- Lua Language Server specific setup
                    ["lua_ls"] = function()
                        lspconfig.lua_ls.setup({
                            capabilities = capabilities,
                            settings = {
                                Lua = {
                                    runtime = { version = "Lua 5.1" },
                                    diagnostics = {
                                        globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                    },
                                },
                            },
                        })
                    end,

                    -- Svelte Language Server specific setup
                    ["svelte"] = function()
                        require("lspconfig")["svelte"].setup({
                            capabilities = capabilities,
                            on_attach = function(client, bufnr)
                                vim.api.nvim_create_autocmd("BufWritePost", {
                                    pattern = { "*.js", "*.ts" },
                                    callback = function(ctx)
                                        client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
                                    end,
                                })
                            end,
                        })
                    end,
                },
            })

            -- Diagnostic configuration
            vim.diagnostic.config({
                -- update_in_insert = true,
                float = {
                    focusable = true,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            })

            -- Optional: Set up LSP-related keymaps
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Buffer local mappings
                    local opts = { buffer = ev.buf }
                    -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "<C-k>", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.signature_help, opts)
                    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
                    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
                    vim.keymap.set("n", "<leader>wl", function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)
                    -- vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
                    vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename, opts)
                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    -- Using conform instead
                    -- vim.keymap.set("n", "<leader>fr", function()
                    --     vim.lsp.buf.format({ async = true })
                    -- end, opts)
                end,
            })
        end,
    },

    -- Optional: Additional LSP-related plugins
    {
        "onsails/lspkind.nvim",
        config = function()
            require("lspkind").init({
                -- defines how annotations are shown
                -- default: symbol
                -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
                mode = "symbol_text",

                -- default symbol map
                -- can be either 'default' (requires nerd-fonts font) or
                -- 'codicons' for codicon preset (requires vscode-codicons font)
                preset = "codicons",

                -- override preset symbols
                symbol_map = {
                    Text = "??",
                    Method = "??",
                    Function = "??",
                    Constructor = "",
                    Field = "??",
                    Variable = "??",
                    Class = "??",
                    Interface = "",
                    Module = "",
                    Property = "??",
                    Unit = "??",
                    Value = "??",
                    Enum = "",
                    Keyword = "??",
                    Snippet = "",
                    Color = "??",
                    File = "??",
                    Reference = "??",
                    Folder = "??",
                    EnumMember = "",
                    Constant = "??",
                    Struct = "??",
                    Event = "",
                    Operator = "??",
                    TypeParameter = "",
                },
            })
        end,
    },

    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
}
