local M = {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    config = function()
        require('lualine').setup({
            options = {
                theme = 'auto',
                icons_enabled = true,
            },
            sections = {
                lualine_x = {
                    {
                        require("lazy.status").updates,
                        cond = require("lazy.status").has_updates,
                        color = { fg = "#ff9e64" },
                    },
                },
            },
        })
    end
}

return M
