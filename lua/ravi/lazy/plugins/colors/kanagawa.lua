return {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    config = function()
        require("kanagawa").setup({
            transparent = true,
            colors = {
                palette = {
                    lotusWhite3 = "#f4efc9",
                    -- sumiInk4 = "#09081D",
                },
                theme = {
                    all = {
                        ui = {
                            bg = "none",
                            bg_gutter = "none",
                        },
                    },
                },
            },

            overrides = function(colors)
                local theme = colors.theme
                return {
                    NormalFloat = { bg = "none" },
                    FloatBorder = { bg = "none" },
                    FloatTitle = { bg = "none" },

                    -- Save an hlgroup with dark background and dimmed foreground
                    -- so that you can use it where you still want darker windows.
                    -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
                    NormalDark = { bg = theme.ui.bg_m3 },

                    -- Popular plugins that open floats will link to NormalFloat by default;
                    -- set their background accordingly if you wish to keep them dark and borderless
                    LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                    MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

                    Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = vim.o.pumblend }, -- add `blend = vim.o.pumblend` to enable transparency
                    PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
                    PmenuSbar = { bg = theme.ui.bg_m1 },
                    PmenuThumb = { bg = theme.ui.bg_p2 },

                    TelescopeTitle = { fg = theme.ui.special, bold = true },
                    TelescopePromptNormal = { bg = "none" },
                    TelescopePromptBorder = { fg = theme.ui.shade0, bg = "none" },
                    TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = "none" },
                    TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = "none" },
                    TelescopePreviewNormal = { bg = "none" },
                    TelescopePreviewBorder = { bg = "none", fg = theme.ui.bg_dim },

                    BlinkCmpMenu = { bg = theme.ui.bg_m3 },
                    BlinkCmpMenuBorder = { fg = theme.ui.shade1, bg = "none" },
                    BlinkCmpLabelDetail = { bg = colors.palette.dragonBlack3 },
                    BlinkCmpMenuSelection = { bg = colors.palette.waveBlue1 },

                    MiniStatuslineModeNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg },
                    MiniStatuslineModeInsert = { fg = colors.palette.surimiOrange, bg = colors.palette.autumnGreen },
                    MiniStatuslineModeCommand = { bg = colors.palette.sumiInk4 },
                }
            end,
        })

        vim.cmd.colorscheme("kanagawa")
    end,
}
