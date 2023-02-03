local keymap = vim.keymap.set
local nvim_keymap = vim.api.nvim_set_keymap

vim.keymap.set('n', '<leader>s', '<cmd>NvimTreeToggle<cr>')
vim.keymap.set('n', '<leader>ff', ':lua require(\'telescope.builtin\').find_files({no_ignore = true})<cr>', {}) -- find files
vim.keymap.set('n', '<leader>fpf', ':lua require(\'telescope.builtin\').find_files()<cr>', {}) -- find project files
vim.keymap.set('n', '<leader>fg', ':lua require(\'telescope.builtin\').live_grep()<cr>', {})
vim.keymap.set('n', '<leader>fb', ':lua require(\'telescope.builtin\').buffers()<cr>', {})
vim.keymap.set('n', '<leader>fh', ':lua require(\'telescope.builtin\').help_tags()<cr>', {})
vim.keymap.set('n', '<leader>ft', ':lua require(\'telescope.builtin\').tags()<cr>', {})
vim.keymap.set('n', '<leader>fc', ':lua require(\'telescope.builtin\').commands()<cr>', {})
vim.keymap.set('n', '<leader>bc', '<cmd>Bdelete<CR>')
vim.keymap.set('n', '<C-M-l>', '<cmd>Neoformat<CR>')
vim.api.nvim_set_keymap("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<leader>rb", [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<leader>rbf", [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<leader>ri", [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap( "v", "<leader>rr", ":lua require('refactoring').select_refactor()<CR>", { noremap = true, silent = true, expr = false })
vim.api.nvim_set_keymap( "v", "<leader>rr", "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", { noremap = true })
vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal(), {noremap = true})
vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal(), {noremap = true})
vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual(), {noremap = true})
vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual(), {noremap = true})
vim.keymap.set("v", "g<C-a>",require("dial.map").inc_gvisual(), {noremap = true})
vim.keymap.set("v", "g<C-x>",require("dial.map").dec_gvisual(), {noremap = true})
