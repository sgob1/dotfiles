-- init.lua ----------------------
--  _ ----  _ _ --- _ ------------
-- (_)_ __ (_) |_  | |_   _  __ _
-- | | '_ \| | __| | | | | |/ _` |
-- | | | | | | |_ _| | |_| | (_| |
-- |_|_| |_|_|\__(_)_|\__,_|\__,_|
-- -------------------------------

local plugin_manager = require('plugin-manager')
local first_install = plugin_manager.install()
plugin_manager.load_plugins()

if not first_install then
    local require_all = require('loader').require_all
    require('user.config')
    require_all("user.keymaps")
    require_all("user.commands")
    require_all("user.snippets")
    require_all("plugins")
    require('themes').with_switcher('colorscheme-switcher')
else
    plugin_manager.first_sync()
end
