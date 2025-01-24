local M = {
	"catppuccin/nvim",
	event = "VimEnter",
	name = "catppuccin",
	priority = 1000,
	opts = {
		integrations = {
			cmp = true,
			gitsigns = true,
			leap = true,
			lsp_trouble = true,
			mason = true,
			markdown = true,
			native_lsp = {
				enabled = true,
				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					warnings = { "undercurl" },
					information = { "undercurl" },
				},
			},
			semantic_tokens = true,
			telescope = true,
			treesitter = true,
			treesitter_context = true,
			which_key = true,
		},
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		local ok, _ = pcall(vim.cmd.colorscheme, "catppuccin-mocha")
		if not ok then
			vim.notify("Catppuccin Mocha colorscheme not found!", vim.log.levels.ERROR)
		end
	end,
}

return M
