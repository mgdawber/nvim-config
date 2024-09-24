local M = {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" }, -- Lazy load on buffer events
    opts = {
        current_line_blame = true, -- Show blame for the current line
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = "eol",
            delay = 1000,
            ignore_whitespace = false,
        },
        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = false,     -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = { interval = 1000, follow_files = true },
        attach_to_untracked = true,
        sign_priority = 6,
        update_debounce = 100,
        max_file_length = 40000, -- Disable if file is longer than this
        preview_config = {
            border = "rounded",
            style = "minimal",
            relative = "cursor",
            row = 0,
            col = 1,
        },
    },
}

return M
