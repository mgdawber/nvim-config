local M = {
    {
        'nvim-telescope/telescope.nvim',
        version = '*',
        cmd = 'Telescope',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = vim.fn.executable('make') == 1,
            },
        },
        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")
            local themes = require("telescope.themes")

            telescope.setup({
                defaults = {
                    layout_strategy = "vertical",
                    previewer = false,
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
                        previewer = false,
                        find_command = { "rg", "--files", "--hidden", "--glob", "!.git", "--glob", "!build" },
                    },
                    diagnostics = {
                        layout_strategy = "horizontal",
                    },
                },
            })

            -- Load fzf extension if available
            pcall(telescope.load_extension, "fzf")

            -- Utility function for key mappings
            local map = function(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
            end

            -- Key mappings
            map("n", "<C-b>", builtin.buffers, "Open buffers")
            map("n", "<C-p>", builtin.find_files, "Files")
            map("n", "<C-k>", builtin.keymaps, "Search keymaps")
            map("n", "<C-e>", builtin.diagnostics, "Search diagnostics")
            map('n', '<C-x>', builtin.live_grep, "Live grep")

            map("n", "<leader>/", function()
                builtin.current_buffer_fuzzy_find(themes.get_dropdown({
                    winblend = 10,
                    previewer = false,
                }))
            end, "Search in current buffer")
        end,
    },
}

return M
