local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

-- Install packer.nvim if it does not exist
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  vim.cmd [[packadd packer.nvim]]
end

-- Default settings
require('settings')

-- Third party plugins
require('plugins')

-- Third party configurations
require('third_party')

-- Custom mappings
require('keymappings')

-- LSP specific mappings
require('lsp')
