require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup({
    ensure_installed = {
        "bashls",
        "eslint",
        "gopls",
        "jdtls",
        "lua_ls",
        "marksman",
        "pyright",
        "ruby_ls",
        "rust_analyzer",
        "texlab",
        "tsserver",
    }
})
