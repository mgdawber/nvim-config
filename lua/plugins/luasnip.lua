local M = {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter", -- Load snippets only when entering insert mode
    dependencies = {
        "rafamadriz/friendly-snippets",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
    config = true,
}

return M
