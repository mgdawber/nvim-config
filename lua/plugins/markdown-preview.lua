local M = {
    "iamcco/markdown-preview.nvim",
    ft = "markdown", -- Load only for Markdown filetypes
    lazy = false,
    config = function()
        -- Ensure the plugin is installed
        if not vim.fn["mkdp#util#install"]() then
            print("Markdown Preview plugin installation failed.")
        end
    end,
}

return M
