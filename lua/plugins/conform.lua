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
        lua = { "stylua" },

        python = { "black" },

        sh = { "shfmt" },
        bash = { "shfmt" },
        zsh = { "shfmt" },

        c = { "clang_format" },
        cpp = { "clang_format" },
        objc = { "clang_format" },
        objcpp = { "clang_format" },
        cs = { "clang_format" },

        rust = { "rustfmt" },

        go = { "gofmt" },

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
