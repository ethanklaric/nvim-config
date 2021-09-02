local cmd = vim.cmd

cmd('packadd packer.nvim')

local present, packer = pcall(require, 'packer')

if not present then
    local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

    print('Cloning Packer')
    -- remove dir if exists
    vim.fn.delete(packer_path, 'rf')
    vim.fn.system(
        {
            'git',
            'clone',
            'https://github.com/wbthomason/packer.nvim',
            '--depth',
            '20',
            packer_path
        }
    )

    cmd('packadd packer.nvim')
    present, packer = pcall(require, 'packer')

    if present then
        print('Packer Cloned')
    else
        error("Couldn't clone packer !\nPacker path: " .. packer_path)
    end
end

return packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float {border = 'single'}
        end,
        prompt_border = 'single'
    },
    git = {
        clone_timeout = 300 -- times out after 5 mins
    },
    auto_clean = true,
    compile_on_sync = true
}
