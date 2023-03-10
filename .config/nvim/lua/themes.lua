local M = {}

function M.with_switcher(switcher)
    local desktop_session = vim.env.DESKTOP_SESSION
    local dark_theme = nil
    local light_theme = nil

    if desktop_session == "gnome" then
        dark_theme = 'nightfox'
        light_theme = 'dawnfox'
    elseif desktop_session == "sway" then
        dark_theme = 'catppuccin-macchiato'
        light_theme = 'catppuccin-latte'
    else
        dark_theme = 'github_dark'
        light_theme = 'github_light'
    end

    require(switcher).apply(dark_theme, light_theme)
end

return M
