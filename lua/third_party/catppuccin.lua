local catppuccin = require("catppuccin")

-- Theme specific mappings
catppuccin.setup({
    integrations = {
        cmp = true,
        gitsigns = true,
        markdown = true,
        semantic_tokens = true,
        treesitter = true,
    },
    color_overrides = {
      mocha = {
        peach = "#fcc6a7",
        green = "#d2fac5",
      },
    },
})
