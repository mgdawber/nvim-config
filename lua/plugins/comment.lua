local M = {
    "tpope/vim-commentary",
    event = { "BufReadPre", "BufNewFile" },  -- Lazy-load on buffer read/new file
}

return M
