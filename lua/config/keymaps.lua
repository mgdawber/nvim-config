local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Map leader to space
vim.g.mapleader = " "

-- Remap 'j' and 'k' to 'gj' and 'gk' respectively in normal mode
map("n", "j", "gj", opts)
map("n", "k", "gk", opts)

-- Change inner word
map("n", "<CR>", "ciw", opts)

-- Move between windows using Ctrl + directional keys
map("n", "<C-h>", "<C-W><C-H>", opts)
map("n", "<C-j>", "<C-W><C-J>", opts)
map("n", "<C-k>", "<C-W><C-K>", opts)
map("n", "<C-l>", "<C-W><C-L>", opts)

-- Clear highlight
map("n", ",/", ":nohl<CR>", opts)

-- Format code
map("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", opts)

-- Rails command mappings
map("n", "<leader>rc", ":Rails console<CR>", opts)
map("n", "<leader>rs", ":Rails server<CR>", opts)
map("n", "<leader>rdb", ":Rails dbconsole<CR>", opts)

-- Explore shortcut
map("n", "<C-d>", "<cmd>Explore<CR>", opts)
