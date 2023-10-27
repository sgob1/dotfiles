local M = {}

function M.setup()
    local opt = vim.opt

    opt.path = vim.opt.path + '**';
    opt.wildmenu = true;
    opt.showcmd = true;
    opt.confirm = true;
    opt.modeline = false;
    opt.copyindent = true;
    opt.preserveindent = true;
    opt.cursorline = true;
    opt.ruler = true;
    opt.number = true;
    opt.relativenumber = true;
    opt.tabstop = 4;
    opt.shiftwidth = 4;
    opt.expandtab = true;
    opt.smarttab = true;
    opt.shiftround = true;
    opt.ignorecase = true;
    opt.smartcase = true;
    opt.scrolloff = 1;
    opt.splitbelow = true;
    opt.splitright= true;
    opt.autoread= true;
    opt.laststatus = 2;
    opt.timeout = false;
    opt.ttimeout = false;
    opt.incsearch = true;
    opt.hlsearch = true;
    opt.mouse = 'a';
    opt.undofile = true;
    opt.list = true;
    opt.listchars = {tab = '  ', trail = '·'};
    opt.termguicolors = true;
    opt.background = 'dark';
    opt.showmode = false
    opt.completeopt = {'menu', 'menuone', 'noselect'}
end

return M
