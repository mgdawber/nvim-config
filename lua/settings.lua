local utils = require('utils')

vim.cmd 'syntax enable'
vim.cmd 'filetype plugin indent on'

utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', 4)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'tabstop', 4)
utils.opt('o', 'hidden', true)
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'scrolloff', 4)
utils.opt('o', 'shiftround', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('o', 'wildmode', 'list:longest')
utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)
utils.opt('o', 'clipboard','unnamedplus')
utils.opt('o', 'termguicolors', true)

vim.opt.conceallevel = 2

-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

-- Set colorscheme
vim.cmd.colorscheme "catppuccin"
