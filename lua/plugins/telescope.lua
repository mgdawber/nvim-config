local M = {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = vim.fn.executable("make") == 1,
			},
		},
		config = function()
			local telescope = require("telescope")
      local previewers = require("telescope.previewers") -- Add this line

			telescope.setup({
				defaults = {
					layout_strategy = "horizontal",
					previewer = true,
          -- TODO: Need to think about how to make this automatic.
          --       filesize, filename (.min.js)...
          buffer_previewer_maker = function(filepath, bufnr, opts)
            if filepath:match("vendor/javascript/three%.js") then
              vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, {
                "File manually excluded from preview as it's too large.",
                "Path: " .. filepath,
              })
              return
            end

            previewers.buffer_previewer_maker(filepath, bufnr, opts)
          end,
					layout_config = {
						height = 0.65,
					},
					mappings = {
						i = {
							["<C-u>"] = false,
							["<C-d>"] = false,
						},
					},
				},
				pickers = {
					find_files = {
						previewer = true,
						find_command = { "rg", "--files", "--hidden", "--glob", "!.git", "--glob", "!build" },
					},
					diagnostics = {
						layout_strategy = "horizontal",
					},
				},
			})

			pcall(telescope.load_extension, "fzf")
		end,
		keys = {
			{
				"<C-b>",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Open buffers",
			},
			{
				"<C-p>",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find files",
			},
			{
				"<C-e>",
				function()
					require("telescope.builtin").diagnostics()
				end,
				desc = "Search diagnostics",
			},
			{
				"<C-x>",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Live grep",
			},
			{
				"<C-s>",
				function()
					require("telescope.builtin").live_grep({ default_text = vim.fn.expand("<cword>") })
				end,
				desc = "Live grep with word under cursor",
			},
			{
				"<leader>/",
				function()
					require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
						winblend = 10,
						previewer = false,
					}))
				end,
				desc = "Search in current buffer",
			},
		},
	},
}

return M
