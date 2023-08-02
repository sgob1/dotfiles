local M = {}

function M.install()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
        return true
    end
    vim.opt.rtp:prepend(lazypath)
    return false
end

function M.load_plugins()
    local plugins = M.get_list()
    require("lazy").setup(plugins)
end

function M.first_sync()
    local plugins = M.get_list()
    require("lazy").setup(plugins)
    require("lazy").sync()
end

function M.get_list()
    return {
        { "editorconfig/editorconfig-vim" },

        { 'freitass/todo.txt-vim', ft="todo", },

        {
            "folke/todo-comments.nvim",
            dependencies = "nvim-lua/plenary.nvim",
            config = function()
                require("todo-comments").setup({})
            end
        },

        { 'numToStr/Comment.nvim' },

        { 'vimwiki/vimwiki' },

        { 'nvim-lualine/lualine.nvim', lazy = false, },

        { 'nvim-treesitter/nvim-treesitter', lazy = false },

        { 'EdenEast/nightfox.nvim' },

        { "folke/tokyonight.nvim" },

        { 'nyoom-engineering/oxocarbon.nvim' },

        {'kdheepak/monochrome.nvim'},

        {'ramojus/mellifluous.nvim'},

        { 'ellisonleao/gruvbox.nvim' },

        { "rebelot/kanagawa.nvim" },

        { 'rose-pine/neovim', lazy = false },

        { 'savq/melange-nvim' },

        { 'shaunsingh/nord.nvim' },

        { 'sainnhe/edge' },

        { 'sainnhe/everforest' },

        {
            'sainnhe/gruvbox-material',
            lazy = false,
            priority = 1,
        },

        { 'sainnhe/sonokai', lazy = false, },

        { 
            "catppuccin/nvim",
            lazy=false,
            priority=1,
        },

        { 'tpope/vim-fugitive' },

        { 'tpope/vim-obsession' },

        {
            "monaqa/dial.nvim",
            keys = { "<C-a>", { "<C-x>", mode = "n" } },
        },

        { 'kyazdani42/nvim-tree.lua' },

        {
            'nvim-telescope/telescope.nvim',
            dependencies = { 'nvim-lua/plenary.nvim' },
        },

        { 'lewis6991/gitsigns.nvim' },

        { 'sbdchd/neoformat' },

        { 'wellle/targets.vim' },

        {
            "ThePrimeagen/refactoring.nvim",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-treesitter/nvim-treesitter"
            },
        },

        { 'jamestthompson3/nvim-remote-containers' },

        {
            "hrsh7th/nvim-cmp",
            event = "InsertEnter",
            dependencies = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-cmdline",
                "rafamadriz/friendly-snippets",
                "L3MON4D3/LuaSnip",
            }
        },

        {
            "ray-x/lsp_signature.nvim",
            config = function()
                require "lsp_signature".setup({
                    bind = true, -- This is mandatory, otherwise border config won't get registered.
                    handler_opts = {
                        border = "rounded"
                    }
                })
            end,
        },

        { 'neovim/nvim-lspconfig' },

        { 'williamboman/mason.nvim' },

        {
            "hrsh7th/nvim-cmp",
            event = "InsertEnter",
            dependencies = {
                "williamboman/mason-lspconfig.nvim",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-cmdline",
                "rafamadriz/friendly-snippets",
                "L3MON4D3/LuaSnip",
            }
        },

        {   -- https://github.com/folke/trouble.nvim
            "folke/trouble.nvim",
            dependencies = { "nvim-tree/nvim-web-devicons" }
        },
    }
end

return M
