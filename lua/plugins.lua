return require('packer').startup(function()
    -- Package Management
    use 'wbthomason/packer.nvim'

    -- Quickstart Configuration
    use 'neovim/nvim-lspconfig'

    -- Syntax check asynchronously and fix files, with LSP support
    use { 'jose-elias-alvarez/null-ls.nvim', requires = { { 'nvim-lua/plenary.nvim'} } }

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        tag = '*',
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

    -- treesitter for syntax highlighting and more
    use 'nvim-treesitter/nvim-treesitter'

    -- Status line
    use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons' } }

    -- Git signs
    use "lewis6991/gitsigns.nvim"

    -- LaTeX preivew support
    use 'lervag/vimtex'

    -- Theme
    use { "catppuccin/nvim", as = "catppuccin" }

    -- Third Party Package Management
    use "williamboman/mason.nvim" 
    use "williamboman/mason-lspconfig.nvim"

    -- Markdown preview support
    use({ "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end, })

    -- Obisidian note taking support
    use({
        "epwalsh/obsidian.nvim",
        tag = "*",
        requires = { "nvim-lua/plenary.nvim", },
        config = function()
            require("obsidian").setup({
                workspaces = { { name = "home", path = "/Users/matthewdawber/Library/Mobile Documents/iCloud~md~obsidian/Documents", },
                },
            })
        end,
    })
end)
