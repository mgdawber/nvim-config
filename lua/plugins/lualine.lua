local M = {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
        -- Custom function to get Git diff stats from Gitsigns
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

        -- Define the location section with no padding
        local location = { "location", padding = 0 }

        -- Define Lazy.nvim integration safely
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
                disabled_filetypes = { "alpha", "dashboard" }, -- Disable lualine on these buffers
                always_divide_middle = true,
                globalstatus = true, -- Show status line globally
            },
            sections = {
                lualine_a = { "branch" }, -- Show Git branch
                lualine_b = {
                    { "diff", source = diff_source }, -- Show Git diff stats from Gitsigns
                    "diagnostics", -- Show diagnostics (errors, warnings, hints)
                },
                lualine_c = {
                    { lazy_updates, cond = lazy_updates }, -- Show updates from Lazy.nvim
                },
                lualine_x = { "encoding", "filetype" }, -- Show file encoding and type
                lualine_y = { "progress" }, -- Show buffer progress
                lualine_z = { location, "selectioncount" }, -- Show location and selection count
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { location }, -- Only show location in inactive windows
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
            extensions = { "lazy", "fugitive", "nvim-tree" }, -- Add more lualine extensions
        }
    end,
}

return M
