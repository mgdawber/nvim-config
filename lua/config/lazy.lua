local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

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
		vim.notify("Failed to clone lazy.nvim repository.", vim.log.levels.ERROR)
		return
	end
end

vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("plugins", {
	defaults = { lazy = true },
	install = {
		colorscheme = { "catppuccin" },
	},
	ui = {
		border = "rounded",
	},
	checker = {
		enabled = true,
		notify = true,
		frequency = 86400,
	},
	debug = false,
})
