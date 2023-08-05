local function latex()
    vim.keymap.set('n', '<leader>figure', 'o<ESC>:-1read $HOME/.snippets/latex-picture.tex<CR>2j$i')
    vim.keymap.set('n', '<leader>code', 'o<ESC>o<ESC>:-1read $HOME/.snippets/latex-code.tex<CR>o')
    vim.keymap.set('n', '<leader>verb', 'o<ESC>:-1read $HOME/.snippets/latex-verbatim.tex<CR>o')
    vim.keymap.set('n', '<leader>table', 'o<ESC>:-1read $HOME/.snippets/latex-table.tex<CR>2j$i')
    vim.keymap.set('n', '<leader>enum', 'o<ESC>:-1read $HOME/.snippets/latex-enum.tex<CR>jA')
    vim.keymap.set('n', '<leader>item', 'o<ESC>:-1read $HOME/.snippets/latex-item.tex<CR>jA')
    vim.keymap.set('n', '<leader>desc', 'o<ESC>:-1read $HOME/.snippets/latex-desc.tex<CR>jA')
    vim.keymap.set('n', '<leader>eqn', 'o<ESC>:-1read $HOME/.snippets/latex-eqn.tex<CR>7ela')
    vim.keymap.set('n', '<leader>align', 'o<ESC>:-1read $HOME/.snippets/latex-align.tex<CR>o')
    vim.keymap.set('n', '<leader>ualign', 'o<ESC>:-1read $HOME/.snippets/latex-ualign.tex<CR>o')
    vim.keymap.set('n', '<leader>math', 'o<ESC>:-1read $HOME/.snippets/latex-math.tex<CR>o')
    vim.keymap.set('n', '<leader>array', 'o<ESC>:-1read $HOME/.snippets/latex-array.tex<CR>jo')
    vim.keymap.set('n', '<leader>quote', 'o<ESC>:-1read $HOME/.snippets/latex-quote.tex<CR>j3ei')
    vim.keymap.set('n', '<leader>mm', '<ESC>:read $HOME/.snippets/latex-marginpar.tex<CR>7ela')
    vim.keymap.set('n', '<leader>tt', 'i\\texttt{')
    vim.keymap.set('n', '<leader>ee', 'i\\emph{')
    vim.keymap.set('n', '<leader>bb', 'i\\textbf{')
    vim.keymap.set('n', '<leader>cc', 'i\\textsc{')
    vim.keymap.set('i', '<leader>tt', '\\texttt{')
    vim.keymap.set('i', '<leader>ee', '\\emph{')
    vim.keymap.set('i', '<leader>bb', '\\textbf{')
    vim.keymap.set('i', '<leader>cc', '\\textsc{')
end

local M = {}

function M.setup()
    latex()
end

return M
