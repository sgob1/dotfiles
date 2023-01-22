local autocommands = vim.api.nvim_create_augroup('autocommands', {clear = true})

vim.api.nvim_create_autocmd('FileType', {
pattern = {'help', 'man'},
group = autocommands,
desc = 'Use q to close the window',
command = 'nnoremap <buffer> q <cmd>quit<cr>'
})

vim.api.nvim_create_autocmd('TextYankPost', {
group = autocommands,
desc = 'Highlight on yank',
callback = function(event)
    vim.highlight.on_yank({higroup = 'Visual', timeout = 200})
end
})
