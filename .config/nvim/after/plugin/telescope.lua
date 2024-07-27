
local actions = require('telescope.actions')

require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ["jkl"] = actions.close,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            }
        }
    }
}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers,{})
vim.keymap.set('n', '<leader>gb', builtin.git_branches,{})
