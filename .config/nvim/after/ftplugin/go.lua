local map = vim.keymap.set

local telescope = require 'telescope'

map("n", "<leader>ge", "<CMD>GoIfErr<CR>")

telescope.load_extension 'goimpl'
map("n", "<leader>im", telescope.extensions.goimpl.goimpl, { noremap = true })

map("n", "<leader>tf", "<cmd>GoTestFunc<cr>", { noremap = true })
