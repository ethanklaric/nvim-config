local opt = vim.opt
local g = vim.g
local cmd = vim.cmd

opt.termguicolors = true
opt.hidden = true
opt.timeoutlen = 300
opt.signcolumn = 'yes'

opt.ignorecase = true
opt.smartcase = true
opt.wrap = false

opt.relativenumber = true
opt.splitbelow = true
opt.splitright = true

-- better tabs
opt.smartindent = true
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.scrolloff = 8

-- fix wrap indents
opt.breakindent = true
opt.breakat = ' '

-- change lines with 'h' + 'l' at end of line
opt.whichwrap:append('hl')

-- highlight on yank
vim.api.nvim_exec(
    [[
    augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank()
    augroup end
    ]], false)


local zephyr = require('zephyr')
