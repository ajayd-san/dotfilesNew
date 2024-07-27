require("trouble").setup()

vim.keymap.set("n", "<leader>tx", "<cmd>Trouble diagnostics toggle<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>td", "<cmd>Trouble symbols toggle<cr>",
    { silent = true, noremap = true }
)
-- vim.keymap.set("n", "<leader>tl", "<cmd>TroubleToggle loclist<cr>",
--     { silent = true, noremap = true }
-- )
-- vim.keymap.set("n", "<leader>tq", "<cmd>TroubleToggle quickfix<cr>",
--     { silent = true, noremap = true }
-- )
