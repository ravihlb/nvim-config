local lazypath = vim.fn.stdpath('data') .. 'lazy/lazy.nvim'

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

require('lazy').setup({
    'ThePrimeagen/harpoon',
    'airblade/vim-gitgutter',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    'junegunn/goyo.vim',
    'junegunn/limelight.vim',
    'windwp/nvim-autopairs',
    'numToStr/Comment.nvim',
    'sbdchd/neoformat',
    'tpope/vim-dadbod',
    'kristijanhusak/vim-dadbod-ui',
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        build = ':TSUpdate'
    },
    {
        'nvim-telescope/telescope.nvim', version = '0.1.x',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },
    {
        'sainnhe/sonokai',
        name = 'sonokai',
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion / nvim-cmp
            {'andersevenrud/cmp-tmux'},
            {'davidsierradz/cmp-conventionalcommits'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-cmdline'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/nvim-cmp'},
            {'petertriho/cmp-git'},
            {'saadparwaiz1/cmp_luasnip'},
            {'kristijanhusak/vim-dadbod-completion'},

            -- Snippets
            {
                "L3MON4D3/LuaSnip",
                -- follow latest release.
                version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
                -- install jsregexp (optional!).
                build = "make install_jsregexp"
            },
            {'rafamadriz/friendly-snippets'},
        }
    }
})
