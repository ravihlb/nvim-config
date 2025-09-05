return {
    "chrisgrieser/nvim-spider",
    lazy = true,
    keys = {
        { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
        { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
        { "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
    },
    config = function()
        -- default values
        require("spider").setup({
            skipInsignificantPunctuation = false,
            consistentOperatorPending = false, -- see the README for details
            subwordMovement = true,
            customPatterns = {}, -- see the README for details
        })
    end,
}
