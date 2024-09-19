local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if lazy.nvim is installed; if not, clone it
if not vim.loop.fs_stat(lazypath) then
    local success, _ = pcall(vim.fn.system, {
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
    if not success then
        print("Failed to clone lazy.nvim repository.")
    end
end

-- Prepend lazy.nvim to runtimepath
vim.opt.runtimepath:prepend(lazypath)

-- Load lazy.nvim and configure plugins
require("lazy").setup("plugins", {
	install = { colorscheme = { "catppuccin" } },
	defaults = { lazy = true },
	ui = {
		border = "rounded",
	},
	checker = { enabled = true },
	debug = false,
})
