local lazypath = vim.fn.stdpath("data") .. "lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { import = "ravi.lazy.plugins" },
    { import = "ravi.lazy.plugins.colors" },
    { import = "ravi.lazy.plugins.editor" },
    { import = "ravi.lazy.plugins.navigation" },
    { import = "ravi.lazy.plugins.git" },
    { import = "ravi.lazy.plugins.lsp" },
    { import = "ravi.lazy.plugins.mini" },
    { import = "ravi.lazy.plugins.markdown" },
})
