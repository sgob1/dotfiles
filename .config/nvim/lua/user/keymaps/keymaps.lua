local M = {
    generate_fundamental_keys = function()
        vim.g.mapleader = ','
        vim.keymap.set('n', 'Y', 'y$')
        vim.keymap.set('n', '\\', ':noh<cr>')
        vim.keymap.set('n', 'Q', 'gq')
        vim.keymap.set('n', '-', '/') -- emulates US keyboards in Italian layout
        vim.keymap.set('i', '<C-c>', '<ESC>')
        --vim.keymap.set('n', '<F2>', ':set background=dark<CR>')
        --vim.keymap.set('n', '<F3>', ':set background=light<CR>')
        vim.keymap.set('n', 'cy', '"+y') -- yank into clipboard
        vim.keymap.set('n', 'cp', '"+p') -- paste from clipboard
    end,

    generate_nvim_tree_hotkeys = function()
        vim.keymap.set('n', '<leader>s', '<cmd>NvimTreeToggle<cr>')
    end,

    generate_telescope_hotkeys = function()
        vim.keymap.set('n', '<leader>ff', ':lua require(\'telescope.builtin\').find_files({no_ignore = true})<cr>', {}) -- find files
        vim.keymap.set('n', '<leader>fpf', ':lua require(\'telescope.builtin\').find_files()<cr>', {}) -- find project files
        vim.keymap.set('n', '<leader>fg', ':lua require(\'telescope.builtin\').live_grep()<cr>', {})
        vim.keymap.set('n', '<leader>fb', ':lua require(\'telescope.builtin\').buffers()<cr>', {})
        vim.keymap.set('n', '<leader>fh', ':lua require(\'telescope.builtin\').help_tags()<cr>', {})
        vim.keymap.set('n', '<leader>ft', ':lua require(\'telescope.builtin\').tags()<cr>', {})
    end,

    generate_misc = function()
        vim.keymap.set('n', '<leader>bc', '<cmd>Bdelete<CR>')
        vim.keymap.set('n', '<C-M-l>', '<cmd>Neoformat<CR>')
    end
}

return M
