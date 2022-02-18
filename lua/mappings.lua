local g = vim.g
local cmd = vim.cmd

g.mapleader = ' '

local M = {}
local opt = {noremap = true, silent = true}

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

map('n', '<leader>sr', ':source %<cr>:source ~/.config/nvim/init.lua<cr>', opt)

map('', '<CR>', ':nohlsearch<cr>', opt)

map('i', 'jh', '<Esc>', opt)

-- Splits
map('n', '<leader>j', ':wincmd j<cr>', opt)
map('n', '<leader>k', ':wincmd k<cr>', opt)

-- Allow cursor to move through wrapped lines
map('', 'j', 'v:count ? "j" : "gj"', {expr = true})
map('', 'k', 'v:count ? "k" : "gk"', {expr = true})

-- Telescope
map('n', '<leader>ff', ':Telescope find_files<cr>', opt) 
map('n', '<leader>fg', ':Telescope live_grep<cr>', opt) 
map('n', '<leader>fb', ':Telescope buffers<cr>', opt) 
map('n', '<leader>fh', ':Telescope help_tags<cr>', opt) 

-- File manager
map('n', '<leader>n', ':CHADopen<cr>', opt)

-- Markdown 
--map('n', '<leader>me', ':Goyo<cr>:Limelight!!<cr>:PencilToggle<cr>', opt)
map('n', '<leader>me', ':Goyo<cr>:Limelight!!<cr>', opt)
map('n', '<leader>mp', ':MarkdownPreviewToggle<cr>', opt)

-- 'si' to open school index
map('n', '<leader>si', ':e ~/school/index.md<cr>', opt)

-- run Java
map('n', '<leader>rj', ':!java %<cr>', opt)

-- Packer commands because it is not loaded at startup
cmd("silent! command PackerCompile lua require 'plugins' require('packer').compile()")
cmd("silent! command PackerInstall lua require 'plugins' require('packer').install()")
cmd("silent! command PackerStatus lua require 'plugins' require('packer').status()")
cmd("silent! command PackerSync lua require 'plugins' require('packer').sync()")
cmd("silent! command PackerUpdate lua require 'plugins' require('packer').update()")

return M
