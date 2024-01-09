return {
    'williamboman/mason.nvim',
    --'williamboman/mason-lspconfig.nvim',
    lazy = false,
    config = function()
        require("mason").setup()
    end,
}
