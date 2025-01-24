local M = {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = function()
		local function diff_source()
			local gitsigns = vim.b.gitsigns_status_dict
			if gitsigns then
				return {
					added = gitsigns.added,
					modified = gitsigns.changed,
					removed = gitsigns.removed,
				}
			end
		end

		local location = { "location", padding = 0 }

		local lazy_updates = function()
			local ok, lazy_status = pcall(require, "lazy.status")
			if ok and lazy_status.has_updates() then
				return lazy_status.updates()
			end
		end

		return {
			options = {
				icons_enabled = true,
				theme = "auto",
				section_separators = "",
				component_separators = "",
				disabled_filetypes = { "alpha", "dashboard" },
				always_divide_middle = true,
				globalstatus = true,
			},
			sections = {
				lualine_a = { "branch" },
				lualine_b = {
					{ "diff", source = diff_source },
					"diagnostics",
				},
				lualine_c = {
					{ lazy_updates, cond = lazy_updates },
				},
				lualine_x = { "encoding", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { location, "selectioncount" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { location },
			},
			winbar = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			inactive_winbar = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			extensions = { "lazy", "fugitive" },
		}
	end,
}

return M
