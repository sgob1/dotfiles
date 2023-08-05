local plugin_manager = require('plugin-manager')
local keymaps = require("user.keymaps")
local first_install = plugin_manager.install()
plugin_manager.set_mapleader(keymaps.leader_setter())
plugin_manager.setup()

if not first_install then
    config = require('user.config')
    commands = require('user.commands')
    snippets = require('user.snippets')
    config.setup()
    keymaps.setup()
    commands.setup()
    snippets.setup()
    require('themes').load()
else
    plugin_manager.update()
end
