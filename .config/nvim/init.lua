local plugin_manager = require('plugin-manager')
local keymaps = require("user.keymaps")
local first_install = plugin_manager.install()
plugin_manager.set_mapleader(keymaps.leader_setter())
plugin_manager.setup()

if not first_install then
    -- local require_all = require('loader').require_all
    require('user.config')
    keymaps.set_global_keys()
    keymaps.set_plugin_keys()
    -- require_all("user.commands")
    -- require_all("user.snippets")
    require('themes').load()
else
    plugin_manager.update()
end
