local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Remap 'j' and 'k' to 'gj' and 'gk' respectively in normal mode
map('n', 'j', 'gj', opts)
map('n', 'k', 'gk', opts)

-- Change inner word
map('n', '<cr>', 'ciw', opts)

-- Move between windows using Ctrl + directional keys
map('n', '<C-H>', '<C-W><C-H>', { noremap = true })
map('n', '<C-J>', '<C-W><C-J>', { noremap = true })
map('n', '<C-K>', '<C-W><C-K>', { noremap = true })
map('n', '<C-L>', '<C-W><C-L>', { noremap = true })

-- Clear highlight
vim.api.nvim_set_keymap('n', ',/', ':nohl<CR>', { noremap = true, silent = true })

-- Format code
vim.api.nvim_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '=', '<Esc>:lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })
