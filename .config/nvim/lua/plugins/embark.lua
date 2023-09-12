local M = {
    "embark-theme/vim",
    lazy = false,
    as = 'embark',
    config = function()
        vim.g.embark_terminal_italics = true
    end
}

return M
