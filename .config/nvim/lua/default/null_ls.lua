local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    sources = {
        formatting.black,
        formatting.prettier,
        diagnostics.pylint.with({
            diagnostic_config = { underline = false, virtual_text = false},
            method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
        }),
    },
})
