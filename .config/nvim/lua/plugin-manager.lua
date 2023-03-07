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

        { "lervag/vimtex" },

        { 'freitass/todo.txt-vim', ft="todo", },

        {
            "folke/todo-comments.nvim",
            dependencies = "nvim-lua/plenary.nvim",
            config = function()
                require("todo-comments").setup({})
            end
        },

        { 'lukas-reineke/indent-blankline.nvim' },

        { 'numToStr/Comment.nvim' },

        { 'nvim-lualine/lualine.nvim', lazy = false, },

        { 'nvim-treesitter/nvim-treesitter', lazy = false },

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
    }
end

return M
