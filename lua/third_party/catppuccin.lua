local catppuccin = require("catppuccin")

-- Theme specific mappings
catppuccin.setup({
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
    }
})
