local M = {}

function M.with_switcher(switcher)
    local desktop_session = vim.env.DESKTOP_SESSION
    local dark_theme = nil
    local light_theme = nil

    if desktop_session == "gnome" then
        dark_theme = 'tokyonight-night'
        light_theme = 'tokyonight-day'
        dark_lualine = 'tokyonight'
        light_lualine = 'tokyonight-day'
    elseif desktop_session == "sway" then
        dark_theme = 'gruvbox-material'
        light_theme = 'gruvbox-material'
        dark_lualine = 'gruvbox-material'
        light_lualine = 'gruvbox-material'
    else
        dark_theme = 'github_dark'
        light_theme = 'github_light'
        dark_lualine = 'github_dark'
        light_lualine = 'github_light'
    end

    require(switcher).apply(dark_theme, light_theme, dark_lualine, light_lualine)
end

return M
