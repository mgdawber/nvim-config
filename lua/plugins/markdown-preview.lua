local M = {
    "iamcco/markdown-preview.nvim",
    event = "BufRead",
    lazy = false,
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
}

return M
