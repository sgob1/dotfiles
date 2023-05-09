require('lspconfig').util.default_config.capabilities = vim.tbl_deep_extend(
    'force',
    require('lspconfig').util.default_config.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

require('lspconfig').pyright.setup({})
require('lspconfig').clangd.setup({})
require('lspconfig').vala_ls.setup({})
require('lspconfig').luau_lsp.setup({})
require('lspconfig').marksman.setup({})
require('lspconfig').rust_analyzer.setup({})
require('lspconfig').tsserver.setup({})
require('lspconfig').jdtls.setup({})
require('lspconfig').gopls.setup{}
