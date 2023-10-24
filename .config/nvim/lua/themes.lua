local M = {}

function M.apply()
    local desktop_session = vim.env.DESKTOP_SESSION
    local keymap = vim.keymap.set
    local colorscheme = vim.cmd.colorscheme
    local opt = vim.opt
    local dark_theme = nil
    local light_theme = nil
    -- local color_scheme = vim.fn.system("gsettings get org.gnome.desktop.interface color-scheme", true)

    opt.background = "dark";

    if desktop_session == "gnome" then
        dark_theme = 'kanagawa'
        light_theme = 'dawnfox'
    elseif desktop_session == "sway" then
        dark_theme = 'everforest'
        light_theme = 'everforest'
    else
        dark_theme = 'github_dark'
        light_theme = 'github_light'
    end


    keymap('n', '<F2>', ':set background=dark<CR>:colorscheme ' .. dark_theme .. '<CR>:echo "Here comes the darkness!"<CR>')
    keymap('n', '<F3>', ':set background=light<CR>:colorscheme ' .. light_theme .. '<CR>:echo "Let the light be!"<CR>')

    colorscheme(dark_theme)
end

return M
