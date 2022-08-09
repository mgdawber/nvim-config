return require('packer').startup(function()
    -- Package manager
	use 'wbthomason/packer.nvim'

    -- Quickstart configs
    use 'neovim/nvim-lspconfig'

    use 'dense-analysis/ale'

    use 'shaunsingh/nord.nvim'

    -- Fuzzy finder
	use {
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}

    -- Git bindings
	use 'tpope/vim-fugitive'

    -- Statusline
    use 'nvim-lualine/lualine.nvim'

    -- Auto commenting
    use 'tpope/vim-commentary'

    -- Code Completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    -- Snippets
    use 'L3MON4D3/LuaSnip'
end)
