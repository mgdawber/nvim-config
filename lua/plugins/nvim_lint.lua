local M = {
    "mfussenegger/nvim-lint",
    event = "BufReadPre", -- Load linting only when reading a buffer
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {}
    end,
}

return M
