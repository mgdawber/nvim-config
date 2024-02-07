return require('packer').startup(function()
    -- Package Management
    use 'wbthomason/packer.nvim'

    -- Quickstart Configuration
    use 'neovim/nvim-lspconfig'

    -- Syntax check asynchronously and fix files, with LSP support
    use 'dense-analysis/ale'

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
    --
    -- treesitter for syntax highlighting and more
    use 'nvim-treesitter/nvim-treesitter'

    -- LaTeX preivew support
    use 'lervag/vimtex'

    -- Theme
    use { "catppuccin/nvim", as = "catppuccin" }

    -- Markdown preview support
    use({ "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end, })

    -- Obisidian note taking support
    use({
        "epwalsh/obsidian.nvim",
        tag = "*",
        requires = { "nvim-lua/plenary.nvim", },
        config = function()
            require("obsidian").setup({
                workspaces = { { name = "personal", path = "~/Documents/personal", },
                },
            })
        end,
    })
end)
