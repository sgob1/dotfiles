local M = {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    lazy = false,
    config = function()
        require('telescope').setup({})
    end
}

return M
