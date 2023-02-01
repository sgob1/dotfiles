local M = {}

function M.apply(dark_theme, light_theme)
    local background = vim.opt.background
    local keymap = vim.keymap.set
    local colorscheme = vim.cmd.colorscheme

    background = "dark";

    require('lualine').setup({
        options = {
            theme = dark_theme,
        }
    })

    keymap('n', '<F2>', ':colorscheme ' .. dark_theme .. '<CR>:set background=dark<CR>:lua require(\'lualine\').setup({options = { theme = "' .. dark_theme .. '" }})<CR>:echo "Here comes the darkness!"<CR>')
    keymap('n', '<F3>', ':colorscheme ' .. light_theme .. '<CR>:set background=light<CR>:lua require(\'lualine\').setup({options = { theme = "' .. light_theme .. '" }})<CR>:echo "Let the light be!"<CR>')

    colorscheme(dark_theme)
end

return M
