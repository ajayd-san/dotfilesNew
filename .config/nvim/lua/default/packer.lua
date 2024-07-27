local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end
-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim"    -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"  -- Useful lua functions used ny lots of plugins
    use 'mbbill/undotree'
    -- themes
    use { "catppuccin/nvim", as = "catppuccin" }
    -- use 'ful1e5/onedark.nvim'
    use "olimorris/onedarkpro.nvim"
    -- use 'navarasu/onedark.nvim'
    use "rebelot/kanagawa.nvim"
    use "windwp/nvim-autopairs"
    use "tpope/vim-commentary"
    use "nvim-telescope/telescope.nvim"
    use {
        'edolphin-ydf/goimpl.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-lua/popup.nvim' },
            { 'nvim-telescope/telescope.nvim' },
            { 'nvim-treesitter/nvim-treesitter' },
        },
    }
    use "tpope/vim-sleuth"

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use {
        'phaazon/hop.nvim',
        branch = 'v2'
    }
    use('neovim/nvim-lspconfig')
    use('williamboman/mason.nvim')
    use('williamboman/mason-lspconfig.nvim')

    use("lukas-reineke/indent-blankline.nvim")
    -- completion
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-nvim-lua')
    use('saadparwaiz1/cmp_luasnip')

    -- snippets
    use('L3MON4D3/LuaSnip')
    use('rafamadriz/friendly-snippets')


    use('kyazdani42/nvim-web-devicons')
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly'                    -- optional, updated every week. (see issue #1193)
    }

    -- git
    use('tpope/vim-fugitive')
    use "sindrets/diffview.nvim"


    use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }
    use('lewis6991/gitsigns.nvim')

    use { "akinsho/toggleterm.nvim", tag = '*' }
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
    }
    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
    }

    use('https://github.com/preservim/tagbar')

    --navigation
    use('ThePrimeagen/harpoon')
    -- RUST
    use 'simrat39/rust-tools.nvim'
    use {
        'saecki/crates.nvim',
        tag = 'v0.3.0',
        requires = { 'nvim-lua/plenary.nvim' },
    }
    -- go
    use 'ray-x/go.nvim'
    use 'ray-x/guihua.lua'
    use 'golang/vscode-go'


    -- Debugging
    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } }
    use 'theHamsta/nvim-dap-virtual-text'
    use 'mfussenegger/nvim-dap-python'
    use 'leoluz/nvim-dap-go'

    use {
        "kevinhwang91/nvim-hlslens",
    }
    use('Aasim-A/scrollEOF.nvim')

    use({ "jose-elias-alvarez/null-ls.nvim" })

    use({ "HiPhish/rainbow-delimiters.nvim" })

    --code folding
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

    -- task runner
    use {
        'stevearc/overseer.nvim',
        config = function() require('overseer').setup() end
    }

    --better nvim ui
    use { 'stevearc/dressing.nvim' }

    use { 'tpope/vim-surround' }

    -- handy brancket mappings
    use {'/tpope/vim-unimpaired'}

    -- experimental
    use("folke/noice.nvim")


    -- close all buffers except the current one
    use("vim-scripts/BufOnly.vim")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
