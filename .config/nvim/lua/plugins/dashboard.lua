local M = {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    dependencies = {
        {'nvim-tree/nvim-web-devicons'}
    },
    config = function()
        require('dashboard').setup({
            theme = 'hyper',
            config = {
                week_header = {
                    enable = true,
                },
                shortcut = {
                    {
                        desc = '󰊳 Update',
                        group = '@property',
                        action = 'Lazy update',
                        key = 'u'
                    },
                    {
                        icon = '󰮗 ',
                        icon_hl = '@variable',
                        desc = 'Files',
                        group = 'Label',
                        action = 'TelescopeFindFiles',
                        key = 'f',
                    },
                    {
                        icon = ' ',
                        icon_hl = '@variable',
                        desc = 'FindAll',
                        group = 'Label',
                        action = 'TelescopeFindFilesFromHome',
                        key = 'h',
                    },
                    {
                        icon = 'K ',
                        icon_hl = '@variable',
                        desc = 'Knowledge',
                        group = 'Label',
                        action = 'edit ~/notes/kiwi/index.md',
                        key = 'w',
                    },
                },
            },
        })
    end,
}

return M
