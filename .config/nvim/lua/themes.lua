local M = {}

function M.load()
    local desktop_session = vim.env.DESKTOP_SESSION
    local keymap = vim.keymap.set
    local colorscheme = vim.cmd.colorscheme
    local opt = vim.opt
    local dark_theme = nil
    local light_theme = nil
    -- local color_scheme = vim.fn.system("gsettings get org.gnome.desktop.interface color-scheme", true)

    opt.background = "dark";

    if desktop_session == "gnome" then
        dark_theme = 'terafox'
        light_theme = 'dawnfox'
    elseif desktop_session == "sway" then
        dark_theme = 'nightfox'
        light_theme = 'dawnfox'
    else
        dark_theme = 'github_dark'
        light_theme = 'github_light'
    end


    keymap('n', '<F2>', ':set background=dark<CR>:colorscheme ' .. dark_theme .. '<CR>:lua require(\'lualine\').setup({options = { theme = "auto" }})<CR>:echo "Here comes the darkness!"<CR>')
    keymap('n', '<F3>', ':set background=light<CR>:colorscheme ' .. light_theme .. '<CR>:lua require(\'lualine\').setup({options = { theme = "auto" }})<CR>:echo "Let the light be!"<CR>')

    colorscheme(dark_theme)
end

return M
