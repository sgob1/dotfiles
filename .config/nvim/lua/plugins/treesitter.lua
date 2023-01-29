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
        'bash',
        'c',
        'cmake',
        'comment',
        'cpp',
        'css',
        'gitcommit',
        'gitignore',
        'go',
        'haskell',
        'html',
        'ini',
        'java',
        'javascript',
        'jq',
        'json',
        'latex',
        'lua',
        'markdown',
        'ninja',
        'php',
        'python',
        'r',
        'regex',
        'ruby',
        'rust',
        'todotxt',
        'tsx',
        'typescript',
        'vala',
        'yaml',
    },
})
