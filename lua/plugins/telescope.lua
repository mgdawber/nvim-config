local M = {
    {
        'nvim-telescope/telescope.nvim',
        version = '*',
        cmd = 'Telescope',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            "kyazdani42/nvim-web-devicons",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
        },
        config = function()
            require("telescope").setup({
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
                    }
                },
            })

            -- Enable telescope fzf native, if installed
            pcall(require("telescope").load_extension, "fzf")

            -- TODO: Move this to a utils file, we use this elsewhere
            local map = function(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
            end

            map("n", "<C-b>", require("telescope.builtin").buffers, "Open buffers")
            map("n", "<C-p>", require("telescope.builtin").find_files, "Files")
            map("n", "<C-k>", require("telescope.builtin").keymaps, "Search keymaps")
            map("n", "<C-e>", require("telescope.builtin").diagnostics, "Search diagnostics")
            map('n', '<C-x>', require("telescope.builtin").live_grep, "Live grep")

            map("n", "<leader>/", function()
                -- You can pass additional configuration to telescope to change theme, layout, etc.
                require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                    winblend = 10,
                    previewer = false,
                }))
            end, "Search in current buffer")
        end,
    },
}

return M

