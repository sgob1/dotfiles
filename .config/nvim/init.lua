-- init.lua ----------------------
--  _ ----  _ _ --- _ ------------
-- (_)_ __ (_) |_  | |_   _  __ _
-- | | '_ \| | __| | | | | |/ _` |
-- | | | | | | |_ _| | |_| | (_| |
-- |_|_| |_|_|\__(_)_|\__,_|\__,_|
-- -------------------------------

local packer_manager = require('packer.packer-manager')
local first_install = packer_manager.install()
packer_manager.load_plugins()
if first_install then
    packer_manager.first_sync()
end

require('user.config')
require('user.keymaps.vim')
require('user.keymaps.plugins')
require('user.commands.commands')
require('user.commands.autocommands')
require('user.snippets.latex')

if not first_install then
    require('plugins.lsp.mason')
    require('plugins.lsp.lspconfig')
    require('plugins.lsp.diagnostic')

    require('plugins.global')
    require('plugins.treesitter')
    require('plugins.refactoring')
    require('plugins.cmp')
    require('plugins.lualine')
    require('plugins.telescope')
    require('plugins.comment')
    require('plugins.nvim-tree')
    require('plugins.indent-blankline')
    require('plugins.toggleterm')
    require('plugins.rose-pine')

    local desktop_session = vim.env.DESKTOP_SESSION
    local dark_theme = nil
    local light_theme = nil

    if desktop_session == "gnome" then
        dark_theme = 'sonokai'
        light_theme = 'rose-pine'
    elseif desktop_session == "sway" then
        dark_theme = 'gruvbox-material'
        light_theme = 'gruvbox-material'
    else
        dark_theme = 'github_dark'
        light_theme = 'github_light'
    end

    require('plugins.colorscheme.switcher').apply(dark_theme, light_theme)
end
