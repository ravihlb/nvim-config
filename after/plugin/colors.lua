function SetupSonokaiAtlantis()
    vim.g.sonokai_style = 'atlantis'
    vim.g.sonokai_better_performance = 1
    vim.g.sonokai_transparent_background = 1
end

function ColorMyPencils(color)
    if color ~= "rose-pine"
    then
        color = color or "sonokai"
        SetupSonokaiAtlantis()
    end
    vim.cmd.colorscheme(color)
    vim.opt.background = 'light'

    vim.api.nvim_set_hl(0, "Normal", { bg = 'none'})
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = 'none'})

end

ColorMyPencils()
