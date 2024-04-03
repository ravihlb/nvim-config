local keymap = vim.keymap.set
local builtin = require("telescope.builtin")

require("telescope").load_extension("git_worktree")

keymap("n", "<C-p>", builtin.git_files, {})
keymap("n", "<C-f>", function()
	builtin.find_files({ hidden = true })
end)
keymap("n", "<C-h>", builtin.help_tags, {})
keymap("n", "<C-b>", builtin.buffers, {})

keymap("n", "<leader>pws", function()
	local word = vim.fn.expand("<cWORD>")
	builtin.grep_string({ search = word })
end)

keymap("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
