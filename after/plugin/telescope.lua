local keymap = vim.keymap.set
local builtin = require("telescope.builtin")
local git_worktree = require("telescope").extensions.git_worktree

require("telescope").load_extension("git_worktree")

keymap("n", "<C-p>", builtin.git_files, {})
keymap("n", "<C-f>", builtin.find_files, {})
keymap("n", "<leader>ps", builtin.live_grep, {})
keymap("n", "<C-b>", builtin.buffers, {})

keymap("n", "<leader>wl", git_worktree.git_worktrees, {})
keymap("n", "<leader>wc", git_worktree.create_git_worktree, {})
