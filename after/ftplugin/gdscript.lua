local cmd = vim.lsp.rpc.connect("127.0.0.1", 6005)
local pipe = "/tmp/godot.pipe"

vim.lsp.start({
    name = "Godot",
    cmd = cmd,
    root_dir = vim.fs.dirname(vim.fs.find({ "project.godot", ".git"}, { upward = true })[1]),
    on_attach = function()
        vim.api.nvim_command('echo serverstart("' .. pipe .. '")')
    end
})
