return {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
        hint_prefix = "· ",  -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
    },
    config = function(_, opts) require'lsp_signature'.setup(opts) end
}
