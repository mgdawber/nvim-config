local M = {
	"lervag/vimtex",
	lazy = false, -- vimtex is already lazy
	config = function()
		vim.g.vimtex_compiler_latexmk_engines = { ["default"] = "xelatex" }
		vim.g.vimtex_view_method = "skim"
	end,
}

return M
