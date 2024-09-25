local M = {
    "lervag/vimtex",
    lazy = false,
    config = function()
        vim.g.vimtex_compiler_latexmk_engines = { ["default"] = "xelatex" }
        -- vim.g.vimtex_compiler_method = 'xelatex'
        vim.g.vimtex_view_method = 'skim'
    end
}

return M
