return {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    },
    lazy = true,

    config = function()
        local lsp_status_ok, lsp = pcall(require, "lsp-zero")
        if not lsp_status_ok then
	        return
        end

        lsp.preset("recommended")

        lsp.ensure_installed({
	        'tsserver', -- typescript
	        'eslint', -- javascript
	        'lua_ls', -- lua
	        'rust_analyzer', -- rust
	        'clangd', -- c and c++
	        'gopls', -- go
	        'bashls', -- bash
	        'cmake', -- cmake
	        'pyright', -- python
        })
        lsp.nvim_workspace()


        local cmp_status_ok, cmp = pcall(require, "cmp")
        if not cmp_status_ok then
	        return
        end

        local cmp_select = {behavior = cmp.SelectBehavior.Select}
        local cmp_mappings = lsp.defaults.cmp_mappings({
	        ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
	        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
            ['<C-Space>'] = cmp.mapping.complete(),
            ["<CR>"] = cmp.mapping.confirm { select = true },
	        ["<C-e>"] = cmp.mapping {
		        i = cmp.mapping.abort(),
		        c = cmp.mapping.close(),
	        },
        })

        lsp.setup_nvim_cmp({
        mapping = cmp_mappings
        })

        lsp.set_preferences({
	        suggest_lsp_servers = false,
            sign_icons = {
                error = 'E',
                warn = 'W',
                hint = 'H',
                info = 'I'
            }
        })

        lsp.on_attach(function(client, bufnr)
	        local opts = {buffer = bufnr, remap = false}
	        vim.keymap.set("n", "gd", 		function() vim.lsp.buf.definition() end, opts)
	        vim.keymap.set("n", "K", 		function() vim.lsp.buf.hover() end, opts)
	        vim.keymap.set("n", "<leader>vws",	function() vim.lsp.buf.workspace_symbol() end, opts)
	        vim.keymap.set("n", "<leader>vd", 	function() vim.diagnostic.open_float() end, opts)
	        vim.keymap.set("n", "<leader>dn", 	function() vim.diagnostic.goto_next() end, opts)
	        vim.keymap.set("n", "<leader>dp",	function() vim.diagnostic.goto_prev() end, opts)
	        vim.keymap.set("n", "<leader>vca",	function() vim.lsp.buf.code_action() end, opts)
	        vim.keymap.set("n", "<leader>vrr",	function() vim.lsp.buf.references() end, opts)
	        vim.keymap.set("n", "<leader>vrn",	function() vim.lsp.buf.rename() end, opts)
	        vim.keymap.set("i", "<C-h>",		function() vim.lsp.buf.signature_help() end, opts)
        end)

        lsp.setup()
    end,
}
