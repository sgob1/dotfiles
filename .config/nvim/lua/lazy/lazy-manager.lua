local M = {
    install = function()
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
    end,

    load_plugins = function()
        local plugins_list = require("lazy.plugins-list").get()
        require("lazy").setup(plugins_list)
    end,

    first_sync = function()
        local plugins_list = require("lazy.plugins-list").get()
        require("lazy").setup(plugins_list)
    end,
}

return M
