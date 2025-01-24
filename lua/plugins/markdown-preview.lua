local M = {
	"iamcco/markdown-preview.nvim",
	ft = "markdown",
	lazy = false,
	config = function()
		if not vim.fn["mkdp#util#install"]() then
			print("Markdown Preview plugin installation failed.")
		end
	end,
}

return M
