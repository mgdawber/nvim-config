local M = {
    "jose-elias-alvarez/null-ls.nvim",
    event = { 'BufReadPre', 'BufNewFile' },
    opts = function()
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics
        local code_actions = null_ls.builtins.code_actions

        return {
            debug = true,
            sources = {
                code_actions.gitsigns,
                diagnostics.editorconfig_checker,
                diagnostics.trail_space,
                formatting.clang_format,
                formatting.eslint,
                formatting.prettier,
                formatting.rubocop,
                formatting.shfmt,
            },
        }
    end,
}

return M
