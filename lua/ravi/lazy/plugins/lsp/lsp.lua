return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "saghen/blink.cmp", -- For capabilities
            "saghen/blink.lib",
        },
        config = function()
            -- Get capabilities from blink.cmp
            local lspconfig = vim.lsp.config

            vim.lsp.config("*", {
                capabilities = require("blink.cmp").get_lsp_capabilities()
            })

            -- Mason setup
            require("mason").setup({
                registries = {
                    "github:mason-org/mason-registry",
                    "github:Crashdummyy/mason-registry",
                },
            })
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "ts_ls",
                },
                handlers = {
                    -- Lua Language Server specific setup
                    ["lua_ls"] = function()
                        lspconfig.lua_ls.setup({
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
                        lspconfig.svelte.setup({
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

                    -- TypeScript Language Server specific setup
                    ["ts_ls"] = function()
                        lspconfig.ts_ls.setup({
                            on_attach = function(client, bufnr)
                                -- Disable ts_ls formatting to avoid conflicts with Biome
                                client.server_capabilities.documentFormattingProvider = false
                                client.server_capabilities.documentRangeFormattingProvider = false
                            end,
                            root_dir = lspconfig.util.root_pattern(
                                "package.json",
                                "tsconfig.json",
                                "jsconfig.json",
                                ".git"
                            ),
                        })
                    end,

                    -- Biome Language Server specific setup
                    ["biome"] = function()
                        lspconfig.biome.setup({
                            cmd = { "biome", "lsp-proxy" },
                            filetypes = {
                                "javascript",
                                "javascriptreact",
                                "json",
                                "jsonc",
                                "typescript",
                                "typescriptreact",
                            },
                            -- Look for biome.json first, then fallback to projects with prettier/eslint configs
                            root_dir = lspconfig.util.root_pattern(
                                "biome.json",
                                "biome.jsonc",
                                ".prettierrc",
                                ".prettierrc.json",
                                ".prettierrc.js",
                                ".eslintrc.json",
                                ".eslintrc.js",
                                "eslint.config.js",
                                "package.json"
                            ),
                            single_file_support = false,
                            on_attach = function(client, bufnr)
                                -- Detach from Svelte files
                                if vim.bo[bufnr].filetype == "svelte" then
                                    vim.lsp.buf_detach(bufnr)
                                    return
                                end

                                -- Check if project has biome.json, if not suggest migration
                                local root_dir = client.config.root_dir
                                if root_dir then
                                    local biome_config = vim.fn.findfile("biome.json", root_dir)
                                    local biome_jsonc = vim.fn.findfile("biome.jsonc", root_dir)

                                    if biome_config == "" and biome_jsonc == "" then
                                        -- Check for prettier/eslint configs and suggest migration
                                        local prettier_config = vim.fn.findfile(".prettierrc", root_dir) ~= ""
                                            or vim.fn.findfile(".prettierrc.json", root_dir) ~= ""
                                            or vim.fn.findfile(".prettierrc.js", root_dir) ~= ""

                                        local eslint_config = vim.fn.findfile(".eslintrc.json", root_dir) ~= ""
                                            or vim.fn.findfile(".eslintrc.js", root_dir) ~= ""
                                            or vim.fn.findfile("eslint.config.js", root_dir) ~= ""

                                        if prettier_config or eslint_config then
                                            vim.defer_fn(function()
                                                vim.notify(
                                                    "Biome detected existing Prettier/ESLint configs. "
                                                    .. "Run ':BiomeMigrate' to convert them to biome.json",
                                                    vim.log.levels.INFO,
                                                    { title = "Biome Migration" }
                                                )
                                            end, 1000)
                                        end
                                    end
                                end
                            end,
                        })
                    end,
                    ["basedpyright"] = function()
                        lspconfig.basedpyright.setup({
                            settings = {
                                basedpyright = {
                                    analysis = {
                                        autoSearchPaths = true,
                                        diagnosticMode = "openFilesOnly",
                                        useLibraryCodeForTypes = true,
                                    },
                                },
                            },
                        })
                    end,
                },
            })


            -- Clangd setup
            vim.lsp.config("clangd", {
                settings = {
                    ["-style"] = {
                        ["BasedOnStyle"] = { "GNU" },
                    },
                },
            })

            vim.lsp.config("gdscript", {
                cmd = vim.lsp.rpc.connect("192.168.112.1", 6005),
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

            -- Set up LSP-related keymaps
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Buffer local mappings
                    local opts = { buffer = ev.buf }
                    -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "<M-k>", vim.lsp.buf.signature_help, opts)
                    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
                    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
                    vim.keymap.set("n", "<leader>wl", function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)
                    vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename, opts)
                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
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
