local M = {}

function M.apply(dark_theme, light_theme, dark_lualine, light_lualine)
    local background = vim.opt.background
    local keymap = vim.keymap.set
    local colorscheme = vim.cmd.colorscheme

    background = "dark";

    require('lualine').setup({
        options = {
            theme = dark_theme,
        }
    })

    keymap('n', '<F2>', ':set background=dark<CR>:colorscheme ' .. dark_theme .. '<CR>:lua require(\'lualine\').setup({options = { theme = "' .. dark_lualine .. '" }})<CR>:echo "Here comes the darkness!"<CR>')
    keymap('n', '<F3>', ':set background=light<CR>:colorscheme ' .. light_theme .. '<CR>:lua require(\'lualine\').setup({options = { theme = "' .. light_lualine .. '" }})<CR>:echo "Let the light be!"<CR>')

    colorscheme(dark_theme)
end

return M
