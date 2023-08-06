local plugin_manager = require('plugin-manager')
local keymaps = require("user.keymaps")
local first_install = plugin_manager.install()
plugin_manager.set_mapleader(keymaps.leader_setter())
plugin_manager.setup()

if not first_install then
    require('user.config').setup()
    require('user.commands').setup()
    keymaps.setup()
    require('user.snippets').setup()
    require('themes').apply()
else
    plugin_manager.update()
end
