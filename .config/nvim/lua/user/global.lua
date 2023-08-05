local g = vim.g
local keymap = vim.keymap.set

g.mapleader = ','
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
