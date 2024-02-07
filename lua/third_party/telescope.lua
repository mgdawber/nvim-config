local telescope = require("telescope")

telescope.setup({
    pickers = {
        find_files = {
            find_command = { "rg", "--files", "--hidden", "--glob", "!.git", "--glob", "!build" },
        },
    },
})

-- Key mappings
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-b>', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-x>', ':Telescope live_grep<CR>', { noremap = true, silent = true })
