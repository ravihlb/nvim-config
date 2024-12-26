return {
    "epwalsh/obsidian.nvim",
    config = function()
        local obsidian = require("obsidian")
        local default_template_name = "Nota Principal.md"

        require("obsidian").setup({
            workspaces = {
                {
                    name = "work",
                    path = "~/syncthing/obsidian/work/",
                },
                {
                    name = "notebook.md",
                    path = "~/syncthing/obsidian/notebook.md",
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
                ["<leader>ot"] = {
                    action = function()
                        return vim.api.nvim_exec2("ObsidianTemplate " .. default_template_name, {})
                    end,
                    opts = { buffer = true }
                },
                ["<leader>op"] = {
                    action = function()
                        return vim.api.nvim_exec2("ObsidianOpen", {})
                    end,
                    opts = { buffer = true }
                }
            },
            disable_frontmatter = true,
            ui = {
                enable = true,
                checkboxes = {
                    -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
                    -- Replace the above with this if you don't have a patched font:
                    [" "] = { char = "☐", hl_group = "ObsidianTodo" },
                    ["x"] = { char = "✔", hl_group = "ObsidianDone" },
                },
                bullets = { char = "•", hl_group = "ObsidianBullet" },
                external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
                -- Replace the above with this if you don't have a patched font:
                -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
                reference_text = { hl_group = "ObsidianRefText" },
                highlight_text = { hl_group = "ObsidianHighlightText" },
                tags = { hl_group = "ObsidianTag" },
                block_ids = { hl_group = "ObsidianBlockID" },
                hl_groups = {
                    -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
                    ObsidianTodo = { bold = true, fg = "#f78c6c" },
                    ObsidianDone = { bold = true, fg = "#89ddff" },
                    ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
                    ObsidianTilde = { bold = true, fg = "#ff5370" },
                    ObsidianImportant = { bold = true, fg = "#d73128" },
                    ObsidianBullet = { bold = true, fg = "#89ddff" },
                    ObsidianRefText = { underline = true, fg = "#c792ea" },
                    ObsidianExtLinkIcon = { fg = "#c792ea" },
                    ObsidianTag = { italic = true, fg = "#89ddff" },
                    ObsidianBlockID = { italic = true, fg = "#89ddff" },
                    ObsidianHighlightText = { bg = "#75662e" },
                },

            }
        })
    end,
}
