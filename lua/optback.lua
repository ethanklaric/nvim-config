local opt = vim.opt local g = vim.g local cmd = vim.cmd
local utils = require('utils')

opt.termguicolors = true
opt.hidden = true
opt.timeoutlen = 300
opt.signcolumn = 'yes'

opt.ignorecase = true
opt.smartcase = true
opt.wrap = false

opt.relativenumber = true
--opt.hlsearch = false
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

local zephyr = require('zephyr')

-- go to prev/next line with h,l when cursor reaches end of line
opt.whichwrap:append('hl')

---- stops screen redrawing when executing macros and registers // better performance
opt.lazyredraw = true 

-- markdown specific settings
utils.create_augroup({
	{'BufRead,BufNewFile', '*.md', 'set', 'conceallevel=3', 'spell spelllang=en_gb'},
---	{'BufRead,BufNewFile', '*.md', 'Goyo'},
---	{'BufRead,BufNewFile', '*.md', 'Limelight'}
--- {'BufRead,BufNewFile', '*.md', 'PencilSoft'}
}, 'markdown')

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]], false
)

require('plugins.treesitter')
require('plugins.telescope')
require('nvim_comment').setup()
-- require('neoscroll').setup()
