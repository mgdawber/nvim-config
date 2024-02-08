local M = {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({})
        vim.cmd.colorscheme "catppuccin-mocha"
    end,
    opts = {
        integrations = {
            cmp = true,
            gitsigns = true,
            leap = true,
            lsp_trouble = true,
            mason = true,
            markdown = true,
            native_lsp = {
                enabled = true,
                underlines = {
                    errors = { "undercurl" },
                    hints = { "undercurl" },
                    warnings = { "undercurl" },
                    information = { "undercurl" },
                },
            },
            semantic_tokens = true,
            telescope = true,
            treesitter = true,
            treesitter_context = true,
            which_key = true,
        },
    },
}

return M
