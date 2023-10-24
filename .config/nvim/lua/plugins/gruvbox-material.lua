local M = {
    'sainnhe/gruvbox-material',
    config = function()
        vim.g.gruvbox_material_foreground = 'material'
        vim.g.gruvbox_material_background = 'medium'
        vim.g.gruvbox_material_diagnostic_text_highlight = true
        vim.g.gruvbox_material_diagnostic_line_highlight = true
        vim.g.gruvbox_material_enable_italic = true
        vim.g.gruvbox_material_enable_bold = true
        vim.g.gruvbox_material_visual = 'blue background'
    end
}

return M
