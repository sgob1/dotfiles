local M = {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
        require("todo-comments").setup({})
    end,
}

return M
