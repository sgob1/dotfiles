local M = {
    'serenevoid/kiwi.nvim',
    ft = 'md',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    config = function()
        require('kiwi').setup({
            {
                name = "kiwi",
                path = "/home/sirduke/notes/kiwi"
            }
        })
    end
}

return M
