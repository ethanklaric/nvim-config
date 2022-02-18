local cmd = vim.cmd
local present = pcall(require, 'packerInit')
local packer

if present then
    packer = require 'packer'
else
    return false
end

local use = packer.use

packer.startup(function()
    use {
        'wbthomason/packer.nvim',
        event = 'VimEnter'
    }

    use 'neovim/nvim-lspconfig'

    -- Autocomplete
    use { 'ms-jpq/coq-nvim', run = 'python3 -m coq deps' }
    use 'ms-jpq/coq.artifacts'
    use 'ms-jpq/coq.thirdparty'
    
    -- file tree
    use 'ms-jpq/chadtree'

    -- Java
    use 'mfussenegger/nvim-jdtls'

    use {
        'nvim-treesitter/nvim-treesitter',
	    run = ':TSUpdate'
    }

    -- Theme
    use 'glepnir/zephyr-nvim'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-fzy-native.nvim'} }
    }

    -- better commenting // gcc for comment line // gc for comment selection
    use {
        'winston0410/commented.nvim'
    }

    -- Markdown
    use {
        'gabrielelana/vim-markdown',
        ft = {'markdown'}
    }

    use {
        'vimwiki/vimwiki'
    }

    use {
        'iamcco/markdown-preview.nvim',
        run = function() vim.fn['mkdp#util#install']() end,
        ft = {'markdown'}
    }

    use {
        'reedes/vim-pencil',
        ft = {'markdown'}
    }

    use {
        'junegunn/goyo.vim',
        ft = {'markdown'}
    }
    
    use {
        'junegunn/limelight.vim',
        ft = {'markdown'}
    }

end)

return packer
