vim.opt.guicursor = 'a:blinkon0'

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4 vim.opt.softtabstop = 4 vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.smartcase = true

vim.opt.wrap = false

vim.opt.clipboard = 'unnamedplus'
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = (os.getenv("HOME") or os.getenv("USERPROFILE")) .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.redrawtime = 10000

vim.opt.colorcolumn = '80'

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.cmd('command WriteFormat Neoformat | w')
vim.cmd('cnoreabbrev wf WriteFormat')

-- function CurrentBuffer () return vim.api.nvim_get_current_buf() end
--
-- vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufReadPost', 'FileReadPost' }, {
--     buffer = CurrentBuffer(),
--     callback = function()
--         if vim.bo.filetype == 'json' then
--             vim.api.nvim_buf_set_var(CurrentBuffer(), "shouldNeoformat", 0)
--         end
--         vim.api.nvim_buf_set_var(CurrentBuffer(), "shouldNeoformat", 1)
--     end
-- })
--
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     buffer = CurrentBuffer(),
--     callback = function()
--         local shouldNeoformat = vim.api.nvim_buf_get_var(CurrentBuffer(), "shouldNeoformat")
--
--         if shouldNeoformat then
--             vim.cmd("Neoformat")
--         end
--     end
-- })
