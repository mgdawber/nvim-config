local M = {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
        {
            "<leader>ff",
            function()
                require("conform").format({ async = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    config = function()
        local ok, conform = pcall(require, "conform")
        if not ok then
            vim.notify("Conform.nvim not found", vim.log.levels.ERROR)
            return
        end

        local prettier_formatters = { "prettier" }

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
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
        })
    end,
}

return M
