local M = {
	"mfussenegger/nvim-lint",
	event = "BufReadPre",
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {}
	end,
}

return M
