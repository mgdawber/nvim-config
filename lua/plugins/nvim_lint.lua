local M = {
    "mfussenegger/nvim-lint",
    event = "BufReadPre", -- Load linting only when reading a buffer
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
            -- ruby = { "rubocop" },
            -- erb = { "rubocop" },
        }

        -- Create a group for linting autocommands
        -- local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        -- Setup autocommands for linting
        -- vim.api.nvim_create_autocmd({ "InsertLeave" }, {
        --     group = lint_augroup,
        --     callback = function()
        --         local filetype = vim.bo.filetype
        --         if lint.linters_by_ft[filetype] then
        --             lint.try_lint()
        --         end
        --     end,
        -- })
    end,
}

return M
