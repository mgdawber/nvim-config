local M = {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {
      "<leader>ff",
      function()
        require("conform").format({ async = true })
      end,
      desc = "Format buffer",
    },
  },
  config = function()
    local ok, conform = pcall(require, "conform")
    if not ok then
      vim.notify("Conform.nvim not found", vim.log.levels.ERROR)
      return
    end

    conform.setup({
      formatters_by_ft = {
        python = { "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
      },
    })
  end,
}

return M
