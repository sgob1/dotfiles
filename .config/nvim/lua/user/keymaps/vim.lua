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
