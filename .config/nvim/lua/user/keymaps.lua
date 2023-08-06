local function set_global_keys()
    local keymap = vim.keymap.set

    keymap('n', 'Y', 'y$')
    keymap('n', '\\', ':noh<cr>')
    keymap('n', 'Q', 'gq')
    keymap('n', '-', '/') -- emulates US keyboards in Italian layout
    keymap('i', '<C-c>', '<ESC>')
    keymap('n', 'cy', '"+y') -- yank into clipboard
    keymap('n', 'cp', '"+p') -- paste from clipboard

    keymap('n', '<F4>', ':lua require(\'lualine\').setup({options = { theme = "auto" }})<CR>:echo "loaded lualine"<CR>')
    keymap('n', '<F5>', ':set nonumber norelativenumber<CR>')
    keymap('n', '<F6>', ':set number relativenumber<CR>')
end

local function set_plugin_keys()
    local keymap = vim.keymap.set
    local nvim_keymap = vim.api.nvim_set_keymap

    keymap('n', '<leader>s', '<cmd>NvimTreeToggle<cr>')
    keymap('n', '<leader>ff', ':lua require(\'telescope.builtin\').find_files({no_ignore = true})<cr>', {}) -- find files
    keymap('n', '<leader>fpf', ':lua require(\'telescope.builtin\').find_files()<cr>', {}) -- find project files
    keymap('n', '<leader>fg', ':lua require(\'telescope.builtin\').live_grep()<cr>', {})
    keymap('n', '<leader>fb', ':lua require(\'telescope.builtin\').buffers()<cr>', {})
    keymap('n', '<leader>fh', ':lua require(\'telescope.builtin\').help_tags()<cr>', {})
    keymap('n', '<leader>ft', ':lua require(\'telescope.builtin\').tags()<cr>', {})
    keymap('n', '<leader>fc', ':lua require(\'telescope.builtin\').commands()<cr>', {})
    keymap('n', '<leader>bc', '<cmd>Bdelete<CR>')
    keymap('n', '<C-M-l>', '<cmd>Neoformat<CR>')
    nvim_keymap("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
    nvim_keymap("v", "<leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
    nvim_keymap("v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
    nvim_keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})
    nvim_keymap("n", "<leader>rb", [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]], {noremap = true, silent = true, expr = false})
    nvim_keymap("n", "<leader>rbf", [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]], {noremap = true, silent = true, expr = false})
    nvim_keymap("n", "<leader>ri", [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})
    nvim_keymap( "v", "<leader>rr", ":lua require('refactoring').select_refactor()<CR>", { noremap = true, silent = true, expr = false })
    nvim_keymap( "v", "<leader>rr", "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", { noremap = true })
    keymap("n", "<C-a>", require("dial.map").inc_normal(), {noremap = true})
    keymap("n", "<C-x>", require("dial.map").dec_normal(), {noremap = true})
    keymap("v", "<C-a>", require("dial.map").inc_visual(), {noremap = true})
    keymap("v", "<C-x>", require("dial.map").dec_visual(), {noremap = true})
    keymap("v", "g<C-a>",require("dial.map").inc_gvisual(), {noremap = true})
    keymap("v", "g<C-x>",require("dial.map").dec_gvisual(), {noremap = true})

    -- Use default path (i.e. ~/wiki/)
    local kiwi = require('kiwi')

    -- Necessary keybindings
    vim.keymap.set('n', '<leader>ww', kiwi.open_wiki_index, {})
    vim.keymap.set('n', '<leader>wd', kiwi.open_diary_index, {})
    vim.keymap.set('n', '<leader>wn', kiwi.open_diary_new, {})
end


local M = {
    mapleader = ',',
}

MapleaderSetter = {
    set = function()
        vim.g.mapleader = mapleader
    end,
}

function M.leader_setter()
    return MapleaderSetter
end

function M.setup()
    M.leader_setter().set()
    set_global_keys()
    set_plugin_keys()
end

return M
