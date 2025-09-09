return {
    "airblade/vim-gitgutter",
    config = function()
        -- vim-gitgutter hl group
        vim.api.nvim_set_hl(0, "SignColumn", { link = "LineNr" })
    end,
}
