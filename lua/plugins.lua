return require('packer').startup(function()
    -- Package manager
    use 'wbthomason/packer.nvim'

    -- Quickstart configs
    use 'neovim/nvim-lspconfig'

    use 'dense-analysis/ale'

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        tag = "0.1.4",
        requires = { {
            'nvim-lua/plenary.nvim', 
            'nvim-telescope/telescope-fzf-native.nvim',
        } }
    }

    -- Git bindings
    use 'tpope/vim-fugitive'

    -- Auto commenting
    use 'tpope/vim-commentary'

    -- Auto Complete Snippets
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-cmdline")
	use("L3MON4D3/LuaSnip")
    --
  -- treesitter for syntax highlighting and more
  use {'nvim-treesitter/nvim-treesitter'}
end)


