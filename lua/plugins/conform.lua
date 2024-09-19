local M = {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" }, -- Lazy load on buffer read/new file
    config = function()
        local ok, conform = pcall(require, "conform")
        if not ok then
            vim.notify("Conform.nvim not found", vim.log.levels.ERROR)
            return
        end

        -- Define common formatters
        local prettier_formatters = { "prettier" }

        -- Setup conform with formatters
        conform.setup({
            formatters_by_ft = {
                javascript = prettier_formatters,
                typescript = prettier_formatters,
                javascriptreact = prettier_formatters,
                typescriptreact = prettier_formatters,
                css = prettier_formatters,
                html = prettier_formatters,
                json = prettier_formatters,
                yaml = prettier_formatters,
                markdown = prettier_formatters,
                graphql = prettier_formatters,
            },
        })
    end,
}

return M
