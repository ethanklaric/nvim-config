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

local lspconfig = require('lspconfig')

-- auto-start completion
g.coq_settings = { auto_start = 'shut-up' }

-- enable language servers

-- HTML
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
}
require'lspconfig'.html.setup{}

-- Java
require'lspconfig'.jdtls.setup{ cmd = { 'jdtls' } }

local servers = { }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup(require('coq').lsp_ensure_capabilities({
    -- on_attach = my_custom_on_attach,
  }))
end
