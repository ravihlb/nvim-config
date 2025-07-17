return {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    keys = function()
        return {}
    end,
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()

        local ls = require("luasnip")

        vim.keymap.set({ "i" }, "<C-K>", function()
            ls.expand()
        end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-L>", function()
            ls.jump(1)
        end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-J>", function()
            ls.jump(-1)
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<C-E>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, { silent = true })

        local es_snippets = {
            es = {
                {
                    ls.snippet("cl", {
                        ls.text_node("console.log("),
                        ls.insert_node(1),
                        ls.text_node(")"),
                    }),
                },
                {
                    ls.snippet("cd", {
                        ls.text_node("console.dir("),
                        ls.insert_node(1),
                        ls.text_node(")"),
                    }),
                },
            },
        }

        ls.add_snippets(nil, {
            javascript = es_snippets,
        })

        ls.filetype_extend("javascript", {
            "typescript",
            "svelte",
        })
    end,
}
