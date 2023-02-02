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
        { "folke/tokyonight.nvim" },

        { "rebelot/kanagawa.nvim" },

        { "tiagovla/tokyodark.nvim" },

        { "frenzyexists/aquarium-vim" },

        { "Mofiqul/adwaita.nvim", },

        { "catppuccin/nvim", },

        { "editorconfig/editorconfig-vim", },

        {
            "nvim-neorg/neorg",
            ft = "norg",
            config = true, -- run require("neorg").setup()
            build = ":Neorg sync-parsers",
            opts = {
                load = {
                    ["core.defaults"] = {}, -- Loads default behaviour
                    ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
                    ["core.norg.dirman"] = { -- Manages Neorg workspaces
                        config = {
                            workspaces = {
                                notes = "~/org/norg",
                            },
                        },
                    },
                },
            },
        },

        { 'freitass/todo.txt-vim', ft="todo", },

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


        {
            "glepnir/lspsaga.nvim",
            event = "BufRead",
            config = function()
                require("lspsaga").setup({})
            end,
            dependencies = { "nvim-tree/nvim-web-devicons" }
        },

        {
            "folke/todo-comments.nvim",
            dependencies = "nvim-lua/plenary.nvim",
            config = function()
                require("todo-comments").setup({})
            end
        },

        { 'lukas-reineke/indent-blankline.nvim' },

        { 'neovim/nvim-lspconfig' },

        { 'numToStr/Comment.nvim' },

        { 'nvim-lualine/lualine.nvim', lazy = false, },

        { 'nvim-treesitter/nvim-treesitter', lazy = false },

        { 'projekt0n/github-nvim-theme' },

        { 'sainnhe/edge' },

        { 'sainnhe/everforest' },

        {
            'sainnhe/gruvbox-material',
            lazy = false,
            priority = 1,
        },

        { 'sainnhe/sonokai', lazy = false, },

        { 'rose-pine/neovim', lazy = false },

        { 'savq/melange-nvim', lazy = false },

        { 'shaunsingh/nord.nvim' },

        { 'tpope/vim-fugitive' },

        { 'tpope/vim-obsession' },

        {
            "monaqa/dial.nvim",
            -- lazy-load on keys
            -- mode is `n` by default. For more advanced options, check the section on key mappings
            keys = { "<C-a>", { "<C-x>", mode = "n" } },
            config = function()
                local keymap = vim.keymap.set
                keymap("n", "<C-a>", require("dial.map").inc_normal(), {noremap = true})
                keymap("n", "<C-x>", require("dial.map").dec_normal(), {noremap = true})
                keymap("v", "<C-a>", require("dial.map").inc_visual(), {noremap = true})
                keymap("v", "<C-x>", require("dial.map").dec_visual(), {noremap = true})
                keymap("v", "g<C-a>",require("dial.map").inc_gvisual(), {noremap = true})
                keymap("v", "g<C-x>",require("dial.map").dec_gvisual(), {noremap = true})
            end,
        },

        { 'kyazdani42/nvim-tree.lua' },

        {
            'nvim-telescope/telescope.nvim',
            dependencies = { 'nvim-lua/plenary.nvim' },
        },

        { 'akinsho/toggleterm.nvim' },

        { 'lewis6991/gitsigns.nvim' },

        {
            'williamboman/mason.nvim',
            dependencies = {
                "williamboman/mason-lspconfig.nvim"
            }
        },

        { 'sbdchd/neoformat' },

        {
            "ThePrimeagen/refactoring.nvim",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-treesitter/nvim-treesitter"
            },
        },

        { 'wellle/targets.vim' },

        { 
            'ray-x/go.nvim',
            ft = "go",
        },

        {
            "cuducos/yaml.nvim",
            ft = "yaml",
            dependencies = {
                "nvim-treesitter/nvim-treesitter",
                "nvim-telescope/telescope.nvim"
            },
        },

        { 'jamestthompson3/nvim-remote-containers' },

        { "stevearc/dressing.nvim", event = "VeryLazy" },

        {
            "kevinhwang91/nvim-ufo",
            dependencies = {
                'kevinhwang91/promise-async',
                'nvim-treesitter/nvim-treesitter'
            },
        },
    }
end

return M
