local command = vim.api.nvim_create_user_command
command('ColorschemeGruvboxMaterialDarkHard', ':lua vim.opt.background = "dark"; vim.g.gruvbox_material_background = "hard"; vim.cmd[[colorscheme gruvbox-material]]; require(\'lualine\').setup({options = {theme = "gruvbox-material"}})', {})
command('ColorschemeGruvboxMaterialDarkMedium', ':lua vim.opt.background = "dark"; vim.g.gruvbox_material_background = "medium"; vim.cmd[[colorscheme gruvbox-material]]; require(\'lualine\').setup({options = {theme = "gruvbox-material"}})', {})
command('ColorschemeGruvboxMaterialDarkSoft', ':lua vim.opt.background = "dark"; vim.g.gruvbox_material_background = "soft"; vim.cmd[[colorscheme gruvbox-material]]; require(\'lualine\').setup({options = {theme = "gruvbox-material"}})', {})
command('ColorschemeGruvboxMaterialLightHard', ':lua vim.opt.background = "light"; vim.g.gruvbox_material_background = "hard"; vim.cmd[[colorscheme gruvbox-material]]; require(\'lualine\').setup({options = {theme = "gruvbox-material"}})', {})
command('ColorschemeGruvboxMaterialLightMedium', ':lua vim.opt.background = "light"; vim.g.gruvbox_material_background = "medium"; vim.cmd[[colorscheme gruvbox-material]]; require(\'lualine\').setup({options = {theme = "gruvbox-material"}})', {})
command('ColorschemeGruvboxMaterialLightSoft', ':lua vim.opt.background = "light"; vim.g.gruvbox_material_background = "soft"; vim.cmd[[colorscheme gruvbox-material]]; require(\'lualine\').setup({options = {theme = "gruvbox-material"}})', {})
command('ColorschemeEverforestDarkHard', ':lua vim.opt.background = "dark"; vim.g.everforest_background = "hard"; vim.cmd[[colorscheme everforest]]; require(\'lualine\').setup({options = {theme = "everforest"}})', {})
command('ColorschemeEverforestDarkMedium', ':lua vim.opt.background = "dark"; vim.g.everforest_background = "medium"; vim.cmd[[colorscheme everforest]]; require(\'lualine\').setup({options = {theme = "everforest"}})', {})
command('ColorschemeEverforestDarkSoft', ':lua vim.opt.background = "dark"; vim.g.everforest_background = "soft"; vim.cmd[[colorscheme everforest]]; require(\'lualine\').setup({options = {theme = "everforest"}})', {})
command('ColorschemeEverforestLightHard', ':lua vim.opt.background = "light"; vim.g.everforest_background = "hard"; vim.cmd[[colorscheme everforest]]; require(\'lualine\').setup({options = {theme = "everforest"}})', {})
command('ColorschemeEverforestLightMedium', ':lua vim.opt.background = "light"; vim.g.everforest_background = "medium"; vim.cmd[[colorscheme everforest]]; require(\'lualine\').setup({options = {theme = "everforest"}})', {})
command('ColorschemeEverforestLightSoft', ':lua vim.opt.background = "light"; vim.g.everforest_background = "soft"; vim.cmd[[colorscheme everforest]]; require(\'lualine\').setup({options = {theme = "everforest"}})', {})
command('ColorschemeCatppuccinFrappe', ':lua vim.opt.background = "dark"; vim.cmd[[colorscheme catppuccin-frappe]]; require(\'lualine\').setup({options = {theme = "catppuccin"}})', {})
command('ColorschemeCatppuccinLatte', ':lua vim.opt.background = "dark"; vim.cmd[[colorscheme catppuccin-latte]]; require(\'lualine\').setup({options = {theme = "catppuccin"}})', {})
command('ColorschemeCatppuccinMacchiato', ':lua vim.opt.background = "dark"; vim.cmd[[colorscheme catppuccin-macchiato]]; require(\'lualine\').setup({options = {theme = "catppuccin"}})', {})
command('ColorschemeCatppuccinMocha', ':lua vim.opt.background = "dark"; vim.cmd[[colorscheme catppuccin-mocha]]; require(\'lualine\').setup({options = {theme = "catppuccin"}})', {})
command('ColorschemeKanagawaDark', ':lua vim.opt.background = "dark"; vim.cmd[[colorscheme kanagawa]]; require(\'lualine\').setup({options = {theme = "kanagawa"}})', {})
command('ColorschemeKanagawaLight', ':lua vim.opt.background = "light"; vim.cmd[[colorscheme kanagawa]]; require(\'lualine\').setup({options = {theme = "kanagawa"}})', {})