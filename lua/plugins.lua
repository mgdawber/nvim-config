return require('packer').startup(function()
    -- Package management
    use 'wbthomason/packer.nvim'

    -- Quickstart configuration
    use 'neovim/nvim-lspconfig'

    -- Check syntax in Vim/Neovim asynchronously and fix files, 
    -- with Language Server Protocol (LSP) support
    use 'dense-analysis/ale'

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        requires = { { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzf-native.nvim', } }
    }

    -- Git bindings
    use 'tpope/vim-fugitive'

    -- Auto commenting
    use 'tpope/vim-commentary'

    -- Ruby on Rails support
    use 'tpope/vim-rails'

    -- Code Auto Complete
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-cmdline')

    -- Code Snippets
    use('L3MON4D3/LuaSnip')
    --
    -- treesitter for syntax highlighting and more
    use 'nvim-treesitter/nvim-treesitter'

    -- LaTeX preivew support
    use 'lervag/vimtex'

    -- Markdown preview support
    use({ "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end, })
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
end)
