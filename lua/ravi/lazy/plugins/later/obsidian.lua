return {
    "epwalsh/obsidian.nvim",
    config = function()
        local obsidian = require("obsidian")

        require("obsidian").setup({
            workspaces = {
                {
                    name = "notebook.md",
                    path = "~/projects/personal/notebook.md/",
                },
            },
            mappings = {
                ["gf"] = {
                    action = function()
                        return obsidian.util.gf_passthrough()
                    end,
                    opts = { noremap = false, expr = true, buffer = true },
                },
                -- Toggle check-boxes.
                ["<leader>ch"] = {
                    action = function()
                        return obsidian.util.toggle_checkbox()
                    end,
                    opts = { buffer = true },
                },
            },
        })
    end,
}
