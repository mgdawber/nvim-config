-- Define a function to simplify setting options
local opt = vim.opt

-- Map leader to space
vim.g.mapleader = " "

-- Enable syntax highlighting and filetype plugins
vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")

-- Buffer-local options
opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.smartindent = true

-- Global options
opt.hidden = true
opt.ignorecase = true
opt.scrolloff = 4
opt.shiftround = true
opt.smartcase = true
opt.splitbelow = true
opt.splitright = true
opt.wildmode = "list:longest"

-- Window-local options
opt.number = true
opt.relativenumber = true

-- General options
opt.clipboard = "unnamedplus"
opt.termguicolors = true

-- Setting conceallevel
opt.conceallevel = 2

-- Complete options
opt.completeopt = "menu,menuone,noselect"
