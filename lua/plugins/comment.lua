local M = {
  "tpope/vim-commentary",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    vim.keymap.set('n', 'gcc', '<Plug>CommentaryLine', { noremap = false })
    vim.keymap.set('x', 'gc', '<Plug>Commentary', { noremap = false })
  end,
  version = "*",
  name = "commentary",
}

return M
