local M = {
    apply = function(dark_theme, light_theme)
        vim.opt.background = "dark";

        require('lualine').setup({
            options = {
                theme = dark_theme,
            }
        })

        vim.keymap.set('n', '<F2>', ':colorscheme ' .. dark_theme .. '<CR>:set background=dark<CR>:lua require(\'lualine\').setup({options = { theme = "' .. dark_theme .. '" }})<CR>:echo "Here comes the darkness!"<CR>')
        vim.keymap.set('n', '<F3>', ':colorscheme ' .. light_theme .. '<CR>:set background=light<CR>:lua require(\'lualine\').setup({options = { theme = "' .. light_theme .. '" }})<CR>:echo "Let the light be!"<CR>')
        vim.cmd('colorscheme ' .. dark_theme)
    end
}

return M
