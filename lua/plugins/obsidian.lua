local M = {
    "epwalsh/obsidian.nvim",
    dependencies = { "nvim-lua/plenary.nvim", },
    cmd = "Obsidian",
    lazy = false,
    config = function()
        local obsidian = require("obsidian")

        obsidian.setup({
            workspaces = {
                {
                    name = "Notes",
                    path = "/Users/matthewdawber/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes",
                },
            },
        })

    end,
}

return M
