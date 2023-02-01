local M = {}

function M.require_all(req_path)
    local dir_path = req_path:gsub("%.", '/')

    for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/" .. dir_path, [[v:val =~ '\.lua$']])) do
        require(req_path .. '.' .. file:gsub('%.lua$', ''))
    end
end

return M
