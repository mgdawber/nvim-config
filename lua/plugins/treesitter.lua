local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-refactor",
	},
	opts = {
		highlight = {
			enable = true,
			disable = function(_, buf)
				local max_filesize = 100 * 1024
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
			additional_vim_regex_highlighting = false,
		},
		indent = { enable = true },
		ensure_installed = {
			"bash",
			"c",
			"css",
			"html",
			"http",
			"javascript",
			"json",
			"latex",
			"lua",
			"ruby",
			"yaml",
		},
		sync_install = false,
		ignore_install = {},
		refactor = {
			highlight_definitions = {
				enable = true,
				clear_on_cursor_move = true,
			},
			highlight_current_scope = { enable = false },
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}

return M
