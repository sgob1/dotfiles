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
        dark_theme = 'nordic'
        light_theme = 'everforest'
    elseif desktop_session == "sway" then
        dark_theme = 'catppuccin-mocha'
        light_theme = 'catppuccin-latte'
    elseif desktop_session == "hyprland" then
        dark_theme = 'catppuccin-mocha'
        light_theme = 'catppuccin-latte'
    else
        dark_theme = 'gruvbox-material'
        light_theme = 'gruvbox-material'
    end


    keymap('n', '<F2>', ':set background=dark<CR>:colorscheme ' .. dark_theme .. '<CR>:echo "Here comes the darkness!"<CR>')
    keymap('n', '<F3>', ':set background=light<CR>:colorscheme ' .. light_theme .. '<CR>:echo "Let the light be!"<CR>')

    colorscheme(dark_theme)
end

return M
