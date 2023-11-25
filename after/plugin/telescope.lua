local builtin = require('telescope.builtin')
local keymap = vim.keymap.set
keymap('n', '<C-p>', builtin.git_files, {})
keymap('n', '<C-f>', builtin.find_files, {})
keymap('n', '<leader>ps', builtin.live_grep, {})
keymap('n', '<C-b>', builtin.buffers, {})
