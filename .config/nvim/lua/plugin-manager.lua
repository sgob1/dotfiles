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

function M.set_mapleader(mapleader_setter)
    mapleader_setter.set()
end

function M.setup()
    require("lazy").setup("plugins", {
        defaults = {
            lazy = true
        },
        install = {
            -- install missing plugins on startup. This doesn't increase startup time.
            missing = true,
        },
        change_detection = {
            -- automatically check for config file changes and reload the ui
            enabled = true,
            notify = true, -- get a notification when changes are found
        },
        debug = false,
    })
end

function M.update()
    require("lazy").sync()
end

--[[ function M.get_list()
    return {
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
    }
end
]]--

return M
