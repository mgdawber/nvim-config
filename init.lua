local function safe_require(module)
    local ok, err = pcall(require, module)
    if not ok then
        vim.notify("Error loading " .. module .. "\n\n" .. err, vim.log.levels.ERROR)
    end
end

safe_require("config.options")
safe_require("config.lazy")
safe_require("config.autocmds")
