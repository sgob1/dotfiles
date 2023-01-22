require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true,
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            }
        },
    },
    ensure_installed = {
        'lua',
        'latex',
        'c',
        'cpp',
        'java',
        'regex',
        'rust',
        'javascript',
        'typescript',
        'tsx',
        'html',
        'go',
        'markdown',
        'norg',
        'todotxt',
        'yaml',
        'css',
        'json',
    },
})
