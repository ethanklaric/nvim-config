local M = {} -- The module to export
local cmd = vim.cmd

-- Creates a few autogroups, avoids rewriting cmd('augroup' .. group) etc
function M.create_augroup(autocmds, name)
    cmd('augroup ' .. name)
    cmd('autocmd!')
    for _, autocmd in ipairs(autocmds) do
        cmd('autocmd ' .. table.concat(autocmd, ' '))
    end
    cmd('augroup END')
end

-- Add a path to the rtp (runtime path)
--function M.add_rtp(path)
--    local rtp = vim.o.rtp
--    rtp = rtp .. ',' .. path
--end

return M -- Export the module
