local M = {
    "rebelot/kanagawa.nvim",
    lazy = false,
    config = function()
        require('kanagawa').setup({
            undercurl = true,           -- enable undercurls
            commentStyle = { italic = true },
            functionStyle = { italic = true },
            keywordStyle = { italic = true },
            statementStyle = { bold = true },
            typeStyle = {},
            variablebuiltinStyle = { italic = true},
            specialReturn = true,       -- special highlight for the return keyword
            specialException = true,    -- special highlight for exception handling keywords
            transparent = false,        -- do not set background color
            dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
            globalStatus = false,       -- adjust window separators highlight for laststatus=3
            terminalColors = true,      -- define vim.g.terminal_color_{0,17}
            colors = {},
            theme = "default"           -- Load "default" theme or the experimental "light" theme
        })
    end,
}

return M
