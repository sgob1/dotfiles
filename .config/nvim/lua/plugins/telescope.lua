local M = {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    lazy = false,
    config = function()
        require("telescope").setup({})
        vim.keymap.set("n", "<C-p>", ":lua require('telescope.builtin').find_files({no_ignore = true})<cr>", {}) -- find files
        vim.keymap.set("n", "<leader>tpf", ":lua require('telescope.builtin').find_files()<cr>", {}) -- find project files
        vim.keymap.set("n", "<leader>tg", ":lua require('telescope.builtin').live_grep({no_ignore = true})<cr>", {})
        vim.keymap.set("n", "<leader>tb", ":lua require('telescope.builtin').buffers()<cr>", {})
        vim.keymap.set("n", "<leader>th", ":lua require('telescope.builtin').help_tags()<cr>", {})
        vim.keymap.set("n", "<leader>tt", ":lua require('telescope.builtin').tags()<cr>", {})
        vim.keymap.set("n", "<leader>tc", ":lua require('telescope.builtin').commands()<cr>", {})
        vim.api.nvim_set_keymap(
            "v",
            "<leader>rr",
            "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
            { noremap = true }
        )
    end,
}

return M
