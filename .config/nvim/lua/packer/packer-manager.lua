local M = {
    load_plugins = function()
        require('packer').startup(function(use)
            use 'L3MON4D3/LuaSnip'
            use 'Mofiqul/adwaita.nvim'
            use 'catppuccin/nvim'
            use 'editorconfig/editorconfig-vim'
            use 'freitass/todo.txt-vim'
            use 'hrsh7th/cmp-buffer'
            use 'hrsh7th/cmp-cmdline'
            use 'hrsh7th/cmp-nvim-lsp'
            use 'hrsh7th/cmp-path'
            use 'hrsh7th/nvim-cmp'
            use 'kyazdani42/nvim-web-devicons'
            use 'lukas-reineke/indent-blankline.nvim'
            use 'neovim/nvim-lspconfig'
            use 'numToStr/Comment.nvim'
            use 'nvim-lualine/lualine.nvim'
            use 'nvim-treesitter/nvim-treesitter'
            use 'projekt0n/github-nvim-theme'
            use 'rafamadriz/friendly-snippets'
            use 'sainnhe/edge'
            use 'sainnhe/everforest'
            use 'sainnhe/gruvbox-material'
            use 'sainnhe/sonokai'
            use 'rose-pine/neovim'
            use 'savq/melange'
            use 'shaunsingh/nord.nvim'
            use 'tanvirtin/monokai.nvim'
            use 'tpope/vim-fugitive'
            use 'tpope/vim-obsession'
            use 'tpope/vim-repeat'
            use 'tpope/vim-sensible'
            use 'tpope/vim-speeddating'
            use 'tpope/vim-surround'
            use 'wbthomason/packer.nvim'
            use 'kyazdani42/nvim-tree.lua'
            use { 'nvim-telescope/telescope.nvim',
                tag = '0.1.0',
                requires = { {'nvim-lua/plenary.nvim'} }
            }
            use 'akinsho/toggleterm.nvim'
            use 'lewis6991/gitsigns.nvim'
            use 'moll/vim-bbye'
            use 'williamboman/mason.nvim'
            use 'williamboman/mason-lspconfig.nvim'
            use 'sbdchd/neoformat'
            use {
                "ThePrimeagen/refactoring.nvim",
                requires = {
                    {"nvim-lua/plenary.nvim"},
                    {"nvim-treesitter/nvim-treesitter"}
                }
            }
            use 'wellle/targets.vim'
            use 'ray-x/go.nvim'
            use {
                "cuducos/yaml.nvim",
                ft = {"yaml"}, -- optional
                requires = {
                    "nvim-treesitter/nvim-treesitter",
                    "nvim-telescope/telescope.nvim" -- optional
                },
            }
            use 'jamestthompson3/nvim-remote-containers'
        end)
    end,

    install = function()
        local fn = vim.fn
        local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
        if fn.empty(fn.glob(install_path)) > 0 then
            print 'Installing packer...'
            fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
            vim.cmd [[packadd packer.nvim]]
            return true
        end
    return false
	end,

    first_sync = function()
        print("Running 'PackerSync' for the first time. Please restart Neovim after installation of plugins is complete.")
	    require('packer').sync()
    end,
}

return M
