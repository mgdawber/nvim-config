local null_ls = require("null-ls")

local sources = { 
    -- null_ls.builtins.diagnostics.reek,
}

null_ls.setup({ sources = sources })
