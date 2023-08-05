local function load_commands()
    local command = vim.api.nvim_create_user_command
    command('MakeTags', '!ctags -R .', {})
    command('Spelling', ':set spell spelllang=en,it', {})
    command('SpellingItalian', ':set spell spelllang=it', {})
    command('SpellingEnglish', ':set spell spelllang=en', {})
    command('NoSpelling', ':set nospell', {})
    command('W', ':w', {})
end


local function load_autocommands()
    local autocmd = vim.api.nvim_create_autocmd
    local autocommands = vim.api.nvim_create_augroup('autocommands', {clear = true})

    autocmd('FileType', {
        pattern = {'help', 'man'},
        group = autocommands,
        desc = 'Use q to close the window',
        command = 'nnoremap <buffer> q <cmd>quit<cr>'
    })

    autocmd('TextYankPost', {
        group = autocommands,
        desc = 'Highlight on yank',
        callback = function(event)
            vim.highlight.on_yank({higroup = 'Visual', timeout = 200})
        end
    })
end

local M = {}

function M.setup()
    load_commands()
    load_autocommands()
end

return M
