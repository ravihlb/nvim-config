return {
  "epwalsh/obsidian.nvim",
  config = function()
    local obsidian = require("obsidian")

    require("obsidian").setup({
      workspaces = {
        {
          name = "notebook.md",
          path = "~/projects/notebook.md/",
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
      ui = {
        enable = false,
        checkboxes = {
          -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
          -- Replace the above with this if you don't have a patched font:
          [" "] = { char = "☐", hl_group = "ObsidianTodo" },
          ["x"] = { char = "✔", hl_group = "ObsidianDone" },
        },
      }
    })
  end,
}
