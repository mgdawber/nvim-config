-- Map leader to space
vim.g.mapleader = ' '

-- Install packer.nvim if not exists
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  vim.cmd [[packadd packer.nvim]]
end

-- Third party plugins
require('plugins')

-- Default settings
require('settings')

-- Third party configuration
require('config')

-- Custom mappings
require('keymappings')

-- LSP specific mappings
require('lsp_lua')

local telescope = require("telescope")
telescope.setup({
    pickers = {
        find_files = {
            find_command = { "rg", "--files", "--hidden", "--glob", "!.git", "--glob", "!build" },
        },
    },
})
